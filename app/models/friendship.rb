class Friendship < ActiveRecord::Base

  belongs_to :user

  belongs_to :friend, :class_name => 'User'

	acts_as_resource_feeds

	Request	= 0
	Friend	= 1

  attr_readonly :user_id, :friend_id

  validates_presence_of :user_id, :friend_id, :message => "不能为空", :on => :create

  validate_on_create :friend_is_valid

  validates_inclusion_of :status, :in => [Request, Friend], :message => "只能是1,2"  

  validate_on_update :status_is_valid

  def is_request?
    status == Friendship::Request
  end

  def was_request?
    status_was == Friendship::Request
  end

  def is_friend?
    status == Friendship::Friend
  end

  def was_friend?
    status_was == Friendship::Friend
  end

  def accept
    Friendship.transaction do
      self.update_attributes(:status => Friendship::Friend)
      Friendship.create(:user_id => friend_id, :friend_id => user_id, :status => Friendship::Friend)
    end
  rescue
    return false
  end
  
  def cancel
    Friendship.transaction do
      Friendship.find(:first, :conditions => {:user_id => friend_id, :friend_id => user_id}).destroy
      self.destroy
    end
  rescue
    return false
  end

protected

  def friend_is_valid
    return if user_id.blank? or friend_id.blank?
    friendship = user.all_friendships.find_by_friend_id(friend_id)
    return if friendship.blank?
    if friendship.is_request?
      errors.add(:friend_id, "已经发送请求了")
    else
      errors.add(:friend_id, "已经是好友了")
    end
  end

  def status_is_valid
    return if status.blank?
    errors.add(:status, "不能更新为请求") if is_request?
  end

end
