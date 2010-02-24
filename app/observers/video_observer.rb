class VideoObserver < ActiveRecord::Observer

	def after_create video
    # first increment user's count
    video.poster.raw_increment :videos_count
    
    # emit feed if necessary
		return unless video.poster.application_setting.emit_video_feed
		return if video.privilege == 4
		recipients = [video.poster.profile, video.game]
		recipients.concat video.poster.guilds
		recipients.concat video.poster.friends.find_all{|f| f.application_setting.recv_video_feed}
		video.deliver_feeds :recipients => recipients
	end

  def after_update video
    if video.privilege == 4 and video.privilege_was != 4
      video.destroy_feeds
    else
      if video.privilege != 4 and video.privilege_was == 4 and video.poster.application_setting.emit_video_feed
        recipients = [video.poster.profile]
        recipients.concat video.poster.guilds
        recipients.concat video.poster.friends.find_all{|f| f.application_setting.recv_video_feed}
        video.deliver_feeds :recipients => recipients
      end
    end
  end

  def after_destroy video
    video.poster.raw_decrement :videos_count
  end

end
