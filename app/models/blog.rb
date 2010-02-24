class Blog < ActiveRecord::Base

  belongs_to :game

	belongs_to :poster, :class_name => 'User'

  named_scope :hot, :conditions => ["draft = 0 AND created_at > ? AND privilege != 4", 2.weeks.ago.to_s(:db)], :order => "digs_count DESC"

  named_scope :recent, :conditions => ["draft = 0 AND created_at > ? AND privilege != 4", 2.weeks.ago.to_s(:db)], :order => "created_at DESC"

  named_scope :unverified, :conditions => {:verified => 0}, :order => "created_at DESC"
  named_scope :accept, :conditions => {:verified => 1}, :order => "created_at DESC"
  named_scope :reject, :conditions => {:verified => 2}, :order => "created_at DESC"

  attr_protected :verified
  
  acts_as_friend_taggable :delete_conditions => lambda {|user, blog| blog.poster == user},
                          :create_conditions => lambda {|user, blog| blog.poster == user}

  acts_as_viewable :create_conditions => lambda {|user, blog| blog.poster != user}

	acts_as_diggable :create_conditions => lambda {|user, blog| blog.privilege != 4 or blog.poster == user}

	acts_as_privileged_resources

  acts_as_resource_feeds

  acts_as_shareable

  acts_as_list :order => 'created_at', :scope => 'poster_id', :conditions => {:draft => false}

  acts_as_commentable :order => 'created_at ASC',
                      :delete_conditions => lambda {|user, blog, comment| user == blog.poster || user == comment.poster}, 
                      :create_conditions => lambda {|user, blog| (user == blog.poster) || (blog.privilege == 1) || (blog.privilege == 2 and (blog.poster.has_friend? user or blog.poster.has_same_game_with? user)) || (blog.privilege == 3 and blog.poster.has_friend? user) || false}

  # poster_id 和 game_id 一经创建无法修改
  attr_readonly :poster_id, :game_id

  validates_presence_of :title, :message => "不能为空"

  validates_size_of :title, :within => 1..100, :too_long => "最长100个字节", :too_short => "最短1个字节", :if => 'title'

  validates_presence_of :poster_id, :message => "不能为空", :on => :create

  validates_presence_of :content, :message => "不能为空" 

  validates_size_of :content, :within => 1..10000, :too_long => "最长10000字节", :too_short => "最短1个字节"

  validates_inclusion_of :privilege, :in => [1, 2, 3, 4], :message => "只能是1,2,3,4中的一个"  

  validates_presence_of :game_id, :message => "不能为空", :on => :create

  validate_on_create :game_is_valid

protected

  def game_is_valid
    return if game_id.blank?
    errors.add('game_id', "不存在") unless Game.exists?(game_id)
    return if poster_id.blank?
    errors.add('game_id', "该用户没有这个游戏") unless poster.characters.map(&:game_id).include?(game_id)
  end

end
