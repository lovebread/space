class Topic < ActiveRecord::Base

  named_scope :tops, :conditions => ["top = true"]

  named_scope :normals, :conditions => ["top = false"]

  belongs_to :forum

  belongs_to :poster, :class_name => 'User'

  has_many :posts, :dependent => :destroy

  def last_post
    posts.find(:first, :order => 'created_at DESC')
  end

  def validate
    if poster_id.blank?
      errors.add_to_base('没有发布者')
      return
    end

    if forum_id.blank?
      errors.add_to_base('没有论坛')
      return
    elsif Forum.find(:first, :conditions => {:id => forum_id}).nil?
      errors.add_to_base('论坛不存在')
      return
    end

    if subject.blank?
      errors.add_to_base('没有标题')
      return
    elsif subject.length > 100
      errors.add_to_base('标题太长')
      return
    end

    if content.blank?
      errors.add_to_base('没有内容')
      return
    elsif content.length > 10000
      errors.add_to_base('内容太长')
      return
    end
  end

end
