# 全部 0 或者 1
class ApplicationSetting

  include ActsAsSetting

  acts_as_setting :bits => 1,
                  :defaults => %w[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1],
	                :attributes => %w[emit_blog_feed recv_blog_feed emit_video_feed recv_video_feed emit_photo_feed recv_photo_feed emit_poll_feed recv_poll_feed emit_event_feed recv_event_feed emit_guild_feed recv_guild_feed emit_sharing_feed recv_sharing_feed]

end
