#
# 增加用户参加过的投票的计数器
# 增加选择的那个答案的计数器
# 增加该投票的投票人数
#
class VoteObserver < ActiveRecord::Observer

	def after_create vote
    # increment voter's counter, answer's counter and poll's counter
		vote.voter.raw_increment(:participated_polls_count) if vote.poll.poster != vote.voter
		vote.answers.each do |answer|
			answer.raw_increment :votes_count
		end
		vote.poll.raw_increment :votes_count, vote.answers.count 
	  vote.poll.raw_increment :voters_count

    # issue feeds if necessary
    return unless vote.voter.application_setting.emit_poll_feed
    recipients = [vote.voter.profile]
    recipients.concat vote.voter.guilds
    recipients.concat vote.voter.friends.find_all{|f| f.application_setting.recv_poll_feed}
    vote.deliver_feeds :recipients => recipients
  end

end
