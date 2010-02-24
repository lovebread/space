require 'app/mailer/poll_mailer'

class PollInvitationObserver < ActiveRecord::Observer

	def after_create invitation
    # change counter
    invitation.poll.raw_increment :invitees_count

    # send email
		PollMailer.deliver_invitation invitation.poll, invitation.user if invitation.user.mail_setting.invite_me_to_poll
	end

  def after_destroy invitation
    invitation.poll.raw_decrement :invitees_count
  end

end
