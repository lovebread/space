class Dig < ActiveRecord::Base

  belongs_to :poster, :class_name => 'User'

  belongs_to :diggable, :polymorphic => true

  attr_readonly :poster_id, :diggable_id, :diggable_type

  validates_presence_of :poster_id, :message => "不能为空"

  validates_presence_of :diggable_id, :diggable_type, :message => "不能为空"

  validate_on_create :diggable_is_valid

protected
  
  def diggable_is_valid
    return if diggable_id.blank? or diggable_type.blank?

    diggable = diggable_type.constantize.find(:first, :conditions => {:id => diggable_id})
    if diggable.blank?
      errors.add(:diggable_id, "不存在")
    elsif diggable.digged_by? poster
      errors.add(:diggable_id, '已经挖过了')
    elsif !diggable.is_diggable_by? poster
      errors.add(:diggable_id, '没有权限挖')
    end
  end

end
