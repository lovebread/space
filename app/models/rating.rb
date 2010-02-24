class Rating < ActiveRecord::Base
  
	belongs_to :rateable, :polymorphic => true
  
  belongs_to :user

	Default = 3
	Maximum = 5
	Minimum = 1

  attr_readonly :user_id, :rateable_id, :rateable_type

  validates_presence_of :user_id, :message => "不能为空", :on => :create

  validates_presence_of :rateable_id, :rateable_type, :message => "不能为空", :on => :create

  validate_on_create :rateable_is_valid

  validates_inclusion_of :rating, :in => Minimum..Maximum, :message => "应该在#{Minimum}到#{Maximum}之间"

protected

	def rateable_is_valid
    return if rateable_id.blank? or rateable_type.blank? or user_id.blank?
    
    rateable = rateable_type.camelize.constantize.find(rateable_id)
		if rateable.blank?
      errors.add(:rateable, '不存在')
    elsif rateable.rated_by? user
			errors.add(:rateable, '已经打分过了')
		elsif !rateable.is_rateable_by? user
      errors.add(:rateable, '没有打分的权力')
    end
	end

end
