#
# 其实就是把一群大便代码日到这里，让user减肥下
# 这一群代码是关于注册／激活／密码的
#
module UserAuthentication

  def self.included(recipient)
    recipient.class_eval do
      include UserAuthentication::InstanceMethods

      attr_accessor :password, :password_confirmation
      attr_reader :enabled

      # callbacks
      before_save :encrypt_password
      before_create :make_activation_code
      before_create :make_invite_code
    
      named_scope :activated, :conditions => {:activation_code => nil}
      
      named_scope :pending, :conditions => "activation_code IS NOT NULL"

    end

    recipient.extend(UserAuthentication::ClassMethods)

  end

  module ClassMethods
  
    # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
    def authenticate(email, password)
      u = find :first, :conditions => ['email = ? and activated_at IS NOT NULL', email]
      u && u.authenticated?(password) ? u : nil
    end

    # Encrypts some data with the salt.
    def encrypt(password, salt)
      Digest::SHA1.hexdigest("--#{salt}--#{password}--")
    end

  end


  module InstanceMethods

    # Activates the user in the database.
    def activate
      @activated = true
      self.activated_at = Time.now.utc
      self.activation_code = nil
      save(false)
    end

    def active?
      # the existence of an activation code means they have not activated yet
      activation_code.nil?
    end

    def authenticated?(password)
      crypted_password == encrypt(password)
    end

    def remember_token?
      remember_token_expires_at && Time.now.utc < remember_token_expires_at
    end

    # These create and unset the fields required for remembering users between browser closes
    def remember_me
      remember_me_for 2.weeks
    end

    def remember_me_for(time)
      remember_me_until time.from_now.utc
    end

    def remember_me_until(time)
      self.remember_token_expires_at = time
      self.remember_token = encrypt("#{email}--#{remember_token_expires_at}")
      save(false)
    end

    def forget_me
      self.remember_token_expires_at = nil
      self.remember_token = nil
      save(false)
    end

    def forgot_password
      @forgotten_password = true
      self.make_password_reset_code
    end

    def reset_password
      update_attribute(:password_reset_code, nil)
      @reset_password = true
    end

    def has_role?(name)
      self.roles.find_by_name(name) ? true : false
    end

    # Returns true if the user has just been activated.
    def recently_activated?
      @activated
    end

    def recently_forgot_password?
      @forgotten_password
    end

    def recently_reset_password?
      @reset_password
    end

    def invitation_token
      invitation.token if invitation
    end

    def invitation_token=(token)
      self.invitation = BetaInvitation.find_by_token(token)
    end

      # Encrypts the password with the user salt
    def encrypt(password)
      self.class.encrypt(password, salt)
    end

protected
  
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end

    def make_activation_code
      self.activation_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
    end

    def make_password_reset_code
      self.password_reset_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
    end

    def set_invitation_limit
      self.invitation_limit = 5
    end

    def make_invite_code
      self.invite_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
    end   

  end

end
