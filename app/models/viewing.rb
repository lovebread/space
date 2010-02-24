class Viewing < ActiveRecord::Base

  belongs_to :viewer, :class_name => 'User', :foreign_key => 'user_id'

  belongs_to :viewable, :polymorphic => true, :counter_cache => true

  def validate
    if user_id.blank?
      errors.add_to_base('没有浏览者')
      return
    end

    if viewable_id.blank? or viewable_type.blank?
      errors.add_to_base('没有被浏览的东西')
      return
    else
      viewable = viewable_type.camelize.constantize.find(:first, :conditions => {:id => viewable_id})
      if viewable.blank?
        errors.add_to_base('被浏览的东西不存在')
        return
      elsif !viewable.is_viewing_createable_by? viewer
        errors.add_to_base('没有创建浏览的权力')
        return
      end
    end
  end

end
