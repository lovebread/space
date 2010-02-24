module User::HomeHelper

  def group_deliveries deliveries
    beginning_of_today = Time.now.beginning_of_day
    beginning_of_yesterday = 1.day.ago.beginning_of_day
    beginning_of_this_week = Time.now.beginning_of_week
    beginning_of_last_week = 1.week.ago.beginning_of_week
    beginning_of_this_month = Time.now.beginning_of_month
    deliveries.group_by do |d|
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
      else
        # last month
        "上月"
      end
    end
  end

end
