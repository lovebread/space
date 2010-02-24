class StatusObserver < ActiveRecord::Observer

  def after_create status
    status.poster.raw_increment :statuses_count
		recipients = [status.poster.profile]
		recipients.concat status.poster.friends
		status.deliver_feeds :recipients => recipients
	end

  def after_destroy status
    status.poster.raw_decrement :statuses_count
  end

end
