class SignupInvitation < ActiveRecord::Base

  belongs_to :sender, :class_name => 'User'

  def qq= qq
    self.recipient_email = "#{qq}@qq.com"
  end

  def validate
    if recipient_email.blank?
      errors.add_to_base("邮件不能为空")
    elsif !/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.match(recipient_email)
      errors.add_to_base("邮件格式不对")
    end 
  end

end
