class Notification < ActiveRecord::Base

	belongs_to :user

  named_scope :unread, :conditions => {:read => false}

  Friend = 0 # 接受／拒绝成为好友，删除好友
  FriendTag = 1 # 好友印象
  EventCancel = 2 # 取消活动
  EventChange = 3 # 活动时间改变
  EventStatus = 4 # 某人修改了活动状态，可能去，可能不去啥的
  Participation = 5 # 邀请被接受／拒绝，请求被接受／拒绝, 被剔除活动
  Membership = 6 # 邀请被接受／拒绝，请求被接受／拒绝，被剔除工会
  Promotion = 7 # 职务变动

  def self.read notifications, user
    return if notifications.blank?
    Notification.update_all("notifications.read = 1", {:id => notifications.map(&:id), :user_id => user.id})
    user.raw_decrement :unread_notifications_count, notifications.count
  end

  def self.read_all user
    Notification.update_all("notifications.read = 1", {:user_id => user.id})
    user.update_attribute(:unread_notifications_count, 0)
  end

end
