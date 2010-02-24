class PhotoTag < ActiveRecord::Base

	belongs_to :tagged_user, :class_name => 'User'

  belongs_to :poster, :class_name => 'User'

  belongs_to :photo

	has_many :notices, :as => 'producer', :dependent => :destroy

  attr_readonly :poster_id, :tagged_user_id, :photo_id

  validates_presence_of :poster_id, :message => "不能为空"

  validates_presence_of :photo_id, :message => "不能为空"

  validate_on_create :photo_is_valid

  validates_presence_of :tagged_user_id, :message => "不能为空"

  validate_on_create :tagged_user_is_valid 

  def is_deleteable_by? user
    photo.is_tag_deleteable_by? user, self
  end

protected

  def tagged_user_is_valid
    return if tagged_user_id.blank? or poster_id.blank?
    errors.add_to_base("不是好友或本人") if !poster.has_friend?(tagged_user_id) and tagged_user_id != poster_id
  end

  def photo_is_valid 
    return if photo_id.blank? or photo_type.blank?
      
    photo = Photo.find(:first, :conditions => {:id => photo_id})
    if photo.blank?
      errors.add(:photo_id, "照片不存在")
    elsif !photo.is_taggable_by? poster
      errors.add(:photo_id, '没有权限标记')
    end
  end

end
