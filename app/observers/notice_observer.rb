class NoticeObserver < ActiveRecord::Observer

  def after_create notice
    notice.user.raw_increment :notices_count
    notice.user.raw_increment :unread_notices_count unless notice.read
  end

  def after_update notice
    if !notice.read_was and notice.read
      notice.user.raw_decrement :unread_notices_count
    end
  end

  def after_destroy notice
    notice.user.raw_decrement :notices_count
    notice.user.raw_decrement :unread_notices_count unless notice.read
  end

end
