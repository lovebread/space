namespace :poll do

  task :send_result => :environment do
    polls = Poll.find(:all, :conditions => ["no_deadline = 0 AND deadline <= ?", Time.now.to_s(:db)])
    polls.each do |poll|
      poll.subscribers.each do |user|
        poll.notifications.create(:user_id => user.id) 
        PollMailer.deliver_result(poll, user) if user.mail_setting.poll_expire
      end
    end
  end

	task :clean_expired_invitations => :environment do 
		polls = Poll.find(:all, :conditions => ["end_date <=  ?", Time.now.to_s(:db)])
		polls.each do |poll|
			poll.invitations.each do |invitation|
				invitation.destroy
			end
		end
	end

end
