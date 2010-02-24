class News < ActiveRecord::Base
  belongs_to :game
  belongs_to :poster, :class_name => 'User'

  named_scope :text, :conditions => ["news_type = '文字'"], :order => "created_at DESC"

  named_scope :pic, :conditions => ["news_type = '图片'"], :order => "created_at DESC"

  named_scope :video, :conditions => ["news_type = '视频'"], :order => "created_at DESC"

  attr_readonly :poster_id
  acts_as_commentable :order => 'created_at ASC',
    :delete_conditions => lambda { |user, news, comment| user.has_role?('admin') || comment.poster == user }, :recipient_required => false
  acts_as_diggable  
  acts_as_shareable
  acts_as_viewable

  def validate
    #check title
    if title.blank?
      errors.add_to_base('没有标题')
    end

    #check game
    if game_id.blank?
      errors.add_to_base('没有游戏')
    elsif Game.find(:first, :conditions => {:id => game_id}).nil?
      errors.add_to_base('游戏不存在')
    end

    #check news type
    if news_type.blank?
      errors.add_to_base('没有新闻种类')
    end

    #check data
    if data.blank?
      errors.add_to_base('没有内容')
    end
  end
end
