class PollMailer < ActionMailer::Base

  def result poll, user
    setup_email	user
		subject			"Dayday3 - 投票#{poll.name}结束了，快去看看结果"
		body				:user => user, :url => "#{SITE_URL}/polls/#{poll.id}"
  end

  def summary_change poll, user
    setup_email  user
		subject			"Dayday3 - 投票#{poll.name}的小结更新了, 快去看看"
		body				:user => user, :url => "#{SITE_URL}/polls/#{poll.id}"
  end

	def invitation poll, user
		setup_email	user
		subject		 "Dayday3 - #{poll.poster.login}邀请你参加投票#{poll.name}"
		body			 :user => user, :url => "#{SITE_URL}/polls/#{poll.id}"
	end

protected

  def setup_email	user
		recipients	user.email
		from				SITE_MAIL
    sent_on			Time.now
  end

end
