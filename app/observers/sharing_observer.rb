class SharingObserver < ActiveRecord::Observer

  def after_create sharing
    # increment counter
    sharing.shareable.raw_increment :sharings_count
    sharing.poster.raw_increment :sharings_count

    # issue feeds if necessary
    recipients = [sharing.poster.profile].concat sharing.poster.guilds
    recipients.concat sharing.poster.friends.find_all {|f| f.application_setting.recv_sharing_feed}
    sharing.deliver_feeds :recipients => recipients, :data => {:type => sharing.shareable_type}
  end

  def after_destroy sharing
    sharing.shareable.raw_decrement :sharings_count
		sharing.poster.raw_decrement :sharings_count
  end

end
