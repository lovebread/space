class Video < ActiveRecord::Base

  belongs_to :poster, :class_name => 'User'

  belongs_to :game

  named_scope :hot, :conditions => ["created_at > ? AND privilege != 4", 2.weeks.ago.to_s(:db)], :order => 'digs_count DESC'

  named_scope :recent, :conditions => ["created_at > ? AND privilege != 4", 2.weeks.ago.to_s(:db)], :order => 'created_at DESC'

  acts_as_friend_taggable :delete_conditions => lambda {|user, video| video.poster == user },
                          :create_conditions => lambda {|user, video| video.poster == user }

  acts_as_shareable

	acts_as_diggable :create_conditions => lambda {|user, video| video.privilege != 4 or video.poster == user}

  acts_as_list :order => 'created_at', :scope => 'poster_id'
 
  acts_as_privileged_resources

	acts_as_video

	acts_as_resource_feeds

  acts_as_commentable :order => 'created_at ASC',
                      :delete_conditions => lambda {|user, video, comment| user == video.poster || user == comment.poster},  
                      :create_conditions => lambda {|user, video| (user == video.poster) || (video.privilege == 1) || (video.privilege == 2 and (video.poster.has_friend? user or video.poster.has_same_game_with? user)) || (video.privilege == 3 and video.poster.has_friend? user) || false} 

  # video url 和 game_id 还有 poster_id 一经创建无法修改
  attr_readonly :video_url, :game_id, :poster_id

  validates_presence_of :title, :message => "不能为空"

  validates_size_of :title, :within => 1..100, :too_long => "标题最长100个字节", :too_short => "标题最短100个字节", :if => 'title'

  validates_size_of :description, :maximum => 10000, :too_long => "介绍最长10000个字节", :allow_nil => true

  validates_presence_of :poster_id, :message => "不能为空"

  validates_presence_of :video_url, :message => "不能为空"

  validates_presence_of :game_id, :message => "不能为空"

  validate_on_create :game_is_valid

protected

  def game_is_valid
    return if game_id.blank?
    errors.add('game_id', "不存在") unless Game.exists?(game_id)
    return if poster_id.blank? or !errors.blank?
    errors.add('game_id', "该用户没有这个游戏") unless poster.characters.map(&:game_id).include?(game_id)
  end

end
