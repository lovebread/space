class UserMailer < ActionMailer::Base

  def signup_notification user
    setup_email	user
    subject			"Dayday3 - 激活你的帐号"
    body				:user => user, :url => "http://#{SITE_URL}/activate/#{user.activation_code}"
  end

  def signup_invitaton invitation
    recipients  invitation.recipient_email
    from        SITE_EMAIL
    sent_on     Time.now
    subject     "Dayday3 - #{invitation.sender.login} 邀请你加入"
    body        :user => invitation.sender, :url => "http://#{SITE_URL}/invite?token=#{invitation.token}"
  end

  def activation user
    setup_email	user
    subject			"Dayday3 - 你的帐号已经激活"
    body				:user => user, :url => "http://#{SITE_URL}/personal"
  end

  def forgot_password user
    setup_email	user
    subject			"Dayday3 - 申请重新设置你的密码"
    body				:user => user, :url => "http://#{SITE_URL}/reset_password/#{user.password_reset_code}"
  end

  def reset_password user
    setup_email	user
    subject			"Dayday3 - 你的密码已经重新设置了"
    body				:user => user
  end

protected
  
  def setup_email user
    recipients	user.email
    from				SITE_MAIL
    sent_on			Time.now
  end

end
