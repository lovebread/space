module User::NotificationsHelper

  def notification_icon notification
    case notification.category
    when Notification::Friend
      'msg-friend'
    when Notification::FriendTag
      'msg-impress'
    when Notification::EventCancel
      'msg-cancel'
    when Notification::EventChange
      'msg-warn'
    when Notification::EventStatus
      'msg-state'
    when Notification::Participation
      'msg-invite'
    when Notification::Membership
      'msg-work'
    when Notification::Promotion
      'msg-upgrade'
    end
  end

  def group_notifications notifications
    beginning_of_today = Time.now.beginning_of_day
    beginning_of_yesterday = 1.day.ago.beginning_of_day
    beginning_of_this_week = Time.now.beginning_of_week
    beginning_of_last_week = 1.week.ago.beginning_of_week
    beginning_of_this_month = Time.now.beginning_of_month
    beginning_of_last_month = 1.month.ago.beginning_of_month
    notifications.group_by do |d|
      if d.created_at >= beginning_of_today
        # today
        "今天"
      elsif d.created_at < beginning_of_today and d.created_at >= beginning_of_yesterday
        # yesterday
        "昨天"
      elsif d.created_at < beginning_of_yesterday and d.created_at >= beginning_of_this_week
        # this week
        "本周"
      elsif d.created_at < beginning_of_this_week and d.created_at >= beginning_of_last_week
        # last week
        "上周"
      elsif d.created_at < beginning_of_last_week and d.created_at >= beginning_of_this_month
        # this month
        "本月"
      elsif d.created_at < beginning_of_this_month and d.created_at >= beginning_of_last_month
        # last month
        "上月"
      else 
        "很久很久以前"
      end
    end
  end

end
