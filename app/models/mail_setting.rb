# 全部 0 或者 1
class MailSetting

  include ActsAsSetting

	acts_as_setting :bits => 1, 
									:defaults => %w[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1],
									:attributes => %w[mail_me request_to_be_friend confirm_friend birthday comment_my_status comment_same_status_after_me comment_my_profile comment_same_profile_after_me poke_me tag_me_in_photo tag_my_photo comment_my_album comment_same_album_after_me comment_my_photo comment_photo_contains_me comment_same_photo_after_me tag_me_in_blog comment_my_blog comment_same_blog_after_me comment_blog_contains_me tag_me_in_video comment_my_video comment_same_video_after_me comment_video_contains_me invite_me_to_event change_event cancel_event request_to_attend_my_event comment_my_event comment_same_event_after_me change_name_of_guild invite_me_to_guild promotion_to_veteran request_to_attend_my_guild comment_my_guild comment_same_guild_after_me invite_me_to_poll poll_expire comment_my_poll comment_same_poll_after_me poll_summary_change comment_same_game_after_me reply_my_post]



end
