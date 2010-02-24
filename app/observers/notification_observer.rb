class NotificationObserver < ActiveRecord::Observer

  def after_create notification
    notification.user.raw_increment :notifications_count
    notification.user.raw_increment :unread_notifications_count unless notification.read
  end
 
  def after_update notification
    if !notification.read_was and notification.read
      notification.user.raw_decrement :unread_notifications_count
    end 
  end
 
  def after_destroy notification
    notification.user.raw_decrement :notifications_count
    notification.user.raw_decrement :unread_notifications_count unless notification.read
  end

end
