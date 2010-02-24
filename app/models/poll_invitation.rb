class PollInvitation < ActiveRecord::Base

	belongs_to :user, :counter_cache => true

	belongs_to :poll

	def validate_on_create
    errors.add_to_base('没有人') if user_id.blank?
    errors.add_to_base('没有投票') if poll_id.blank?
    errors.add_to_base('邀请的不是好友') if poll_id and user_id and !poll.poster.has_friend?(user_id)
	  errors.add_to_base('已经邀请过了') if poll_id and !poll.invitations.find_by_user_id(user_id).blank?
  end

end
