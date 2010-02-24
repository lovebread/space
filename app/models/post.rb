class Post < ActiveRecord::Base

  belongs_to :poster, :class_name => 'User'

  belongs_to :forum

  belongs_to :topic

  def validate
    if poster_id.blank?
      errors.add_to_base("没有发布者")
      return
    end

    if forum_id.blank?
      errors.add_to_base("没有论坛")
      return
    else
      forum = Forum.find(:first, :conditions => {:id => forum_id})
      if forum.blank?
        errors.add_to_base("论坛不存在")
        return  
      elsif topic_id.blank?
        errors.add_to_base("没有话题")
        return
      elsif Topic.find(:first, :conditions => {:forum_id => forum_id, :id => topic_id}).blank?
        errors.add_to_base("话题不存在")
        return
      end
    end

    if content.blank?
      errors.add_to_base("没有内容")
    elsif content.length > 10000
      errors.add_to_base("内容太长")
    end
  end

end
