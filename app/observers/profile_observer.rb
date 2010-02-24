class ProfileObserver < ActiveRecord::Observer

  def before_create profile
    profile.login = profile.user.login
    profile.gender = profile.user.gender
  end

	def after_update profile
		return unless profile.changed?
    
    # to see if login or gender has changed. if so, change login or gender in user table as well
    profile.user.update_attribute('gender', profile.gender) if profile.gender_changed?
    profile.user.update_attribute('login', profile.login) if profile.login_changed?

    # issue feeds if necessary
		modified = []
    modified << "基本信息" if profile.basic_info_changed?
		modified << "联系信息" if profile.contact_info_changed? 
		return if modified.count == 0
		recipients = [profile.user.profile]
		recipients.concat profile.user.friends
		profile.deliver_feeds :recipients => recipients, :data => {:modified => modified}
	end

end
