class Status < ActiveRecord::Base

  belongs_to :poster, :class_name => 'User'

	acts_as_commentable :order => 'created_at ASC',
                      :delete_conditions => lambda {|user, status, comment| status.poster == user || comment.poster == user },
                      :create_conditions => lambda {|user, status| status.poster == user || status.poster.has_friend?(user)}

  acts_as_emotion_text :columns => [:content]

	acts_as_resource_feeds

  named_scope :unverified, :conditions => {:verified => 0}, :order => "created_at DESC"
  named_scope :accept, :conditions => {:verified => 1}, :order => "created_at DESC"
  named_scope :reject, :conditions => {:verified => 2}, :order => "created_at DESC"

  attr_protected :verified
  
  attr_readonly :poster_id, :content

  validates_presence_of :poster_id, :message => "不能为空"

  validates_presence_of :content, :message => "不能为空"

  validates_size_of :content, :within => 1..200, :too_long => '最长140个字节', :too_short => '最短1个字节'

end
