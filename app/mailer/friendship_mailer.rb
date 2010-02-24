class FriendshipMailer < ActionMailer::Base

	def request user, friend
		setup_email friend
		subject			"Dayday3 - #{user.login}要求加你为好友"
		body				:friend => friend, :url => "#{SITE_URL}/requests"
	end

protected

	def setup_email friend
		recipients	friend.email
		from				SITE_MAIL
		sent_on			Time.now	
	end

end
