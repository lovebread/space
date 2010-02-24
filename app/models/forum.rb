class Forum < ActiveRecord::Base

  belongs_to :guild

  has_many :topics, :dependent => :destroy

  has_many :posts

  has_many :moderator_forums

  has_many :moderators, :class_name => 'User', :through => :moderator_forums

  has_many :hot_topics, :class_name => 'Topic', :order => "posts_count DESC",
           :conditions => ["created_at BETWEEN ? and ?", 1.week.ago.to_s(:db), Time.now.to_s(:db)]

end
