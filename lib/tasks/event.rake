namespace :event do
 
  task :send_approaching_notification => :environment do 
    events = Event.find(:all, :conditions => ["start_time <= ?", 2.days.from_now.beginning_of_day.to_s(:db)])
    events.each do |event|
      event.participants.each do |user|
        EventMailer.deliver_approaching_notification(event, user)
      end
    end
  end

	task :clean_expired_events => :environment do
		events = Event.find(:all, :conditions => ["end_time <= ?", Time.now.to_s(:db)])
		events.each do |event|
      event.update_attributes(:expired => 1)
      
      event.invitations.each do |invitation|
        invitation.user.raw_decrement :event_invitations_count
      end
      deleted = Participation.delete_all(:event_id => event.id, :status => 0)
      event.raw_decrement :invitations_count, deleted

      deleted = Participation.delete_all(:event_id => event.id, :status => 1)
      event.raw_decrement :requests_count, deleted
      event.poster.raw_decrement :event_requests_count, deleted

      event.participants.each do |participant|
        participant.raw_decrement :upcoming_events_count
        participant.raw_increment :participated_events_count
      end

      event.poster.raw_decrement :events_count
      event.poster.raw_increment :participated_events_count 
    end
	end

end
