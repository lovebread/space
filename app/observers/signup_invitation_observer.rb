class SignupInvitationObserver < ActiveRecord::Observer

  def before_save invitation
    invitation.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end

  def after_save invitation
    UserMailer.deliver_signup_invitation invitation  
  end

end
