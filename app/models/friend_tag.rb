#
# FriendTag就是blog, video的标签（谁和这个资源有关）
#

class FriendTag < ActiveRecord::Base

  belongs_to :tagged_user, :class_name => 'User'

  belongs_to :poster, :class_name => 'User'

  belongs_to :taggable, :polymorphic => true

	belongs_to :blog, :foreign_key => 'taggable_id'

	belongs_to :video, :foreign_key => 'taggable_id'

	has_many :notices, :as => 'producer', :dependent => :destroy 

  attr_readonly :poster_id, :tagged_user_id, :taggable_id, :taggable_type

  validates_presence_of :poster_id, :message => "不能为空"

  validates_presence_of :taggable_id, :taggable_type, :message => "不能为空" 

  validate_on_create :taggable_is_valid

  validates_presence_of :tagged_user_id, :message => "不能为空"

  validate_on_create :tagged_user_is_valid

  def is_deleteable_by? user
    taggable.is_tag_deleteable_by? user, self
  end

protected

  def tagged_user_is_valid
    return if tagged_user_id.blank? or poster_id.blank?
    errors.add(:tagged_user_id, "不是好友") if !poster.has_friend?(tagged_user_id) and tagged_user_id != poster_id
  end

  def taggable_is_valid
    return if taggable_id.blank? or taggable_type.blank?

    taggable = taggable_type.constantize.find(:first, :conditions => {:id => taggable_id})
    if taggable.blank?
      errors.add(:taggable_id, "不存在")
    elsif !taggable.is_taggable_by? poster
      errors.add(:taggable_id, "没有权限标记")
    elsif taggable.has_tag? tagged_user_id
      errors.add(:tagged_user_id, '已经标记过了')
    end
  end

end


