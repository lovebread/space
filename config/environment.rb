# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem "adzap-ar_mailer", :lib => 'action_mailer/ar_mailer', :source => 'http://gems.github.com'

  config.gem "calendar_date_select"

	# reset sweeper path to app/sweepers
	config.load_paths += %W(#{RAILS_ROOT}/app/sweepers)

	# save cached objects to /public/cache
	config.action_controller.page_cache_directory = RAILS_ROOT + "/cache/pages"

	#config.cache_store = :mem_cache_store	

	# reset observer path to app/observers 
	config.load_paths += %W(#{RAILS_ROOT}/app/observers)

  config.active_record.observers = 
    :user_observer,
    :notice_observer,
    :notification_observer, 
		:comment_observer, 
		:profile_observer,
		:game_character_observer,
    :friendship_observer,
		:blog_observer,
		:video_observer,
		:status_observer,
		:event_observer, 
    :participation_observer, 
		:poll_observer, 
    :vote_observer, 
    :poll_invitation_observer, 
		:guild_observer,
    :friend_tag_observer,
    :dig_observer,
    :personal_album_observer,
    :personal_photo_observer,
    :avatar_observer, 
    :avatar_album_observer,
    :event_photo_observer,
    :event_album_observer,
    :guild_photo_observer,
    :guild_album_observer,
    :photo_tag_observer,
    :membership_observer,
    :sharing_observer,
    :game_area_observer,
    :game_server_observer,
    :game_race_observer,
    :game_profession_observer,
    :topic_observer,
    :post_observer,
    :tagging_observer,
    :boss_observer,
    :gear_observer,
    :guild_rule_observer,
    :rating_observer,
    :signup_invitation_observer

	# reset mailer path to app/mailers
	config.load_paths += %W(#{RAILS_ROOT}/app/mailers)

  config.time_zone = 'UTC'

end
