class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.string	:login
      t.string	:email
      t.string	:gender, :default => 'male'
      t.string	:crypted_password,	:limit => 40
      t.string	:salt,			:limit => 40
      t.string	:remember_token
      t.datetime	:remember_token_expires_at
      t.string	:activation_code
      t.datetime	:activated_at
      t.string	:password_reset_code
      t.string :invite_code # 用于万能邀请
      t.boolean	:enabled,	:default => true
			t.integer :avatar_id
      t.string :pinyin

			# settings
			t.integer :privacy_setting, :limit => 8, :default => PrivacySetting.default
			t.integer :mail_setting, :limit => 8, :default => MailSetting.default  
			t.integer :application_setting, :limit => 8, :default => ApplicationSetting.default

      # counters
      t.integer :characters_count, :default => 0 
      t.integer :games_count, :default => 0 
      t.integer :game_attentions_count, :default => 0 
      t.integer :sharings_count, :default => 0 
      t.integer :notices_count, :default => 0
      t.integer :unread_notices_count, :default => 0
      t.integer :notifications_count, :default => 0
      t.integer :unread_notifications_count, :default => 0
      t.integer :friends_count, :default => 0 # done
			t.integer :albums_count, :default => 0 # done
      t.integer :photos_count, :default => 0
			t.integer :events_count, :default => 0
			t.integer :upcoming_events_count, :default => 0
			t.integer :past_events_count, :default => 0
			t.integer :guilds_count, :default => 0 # done
			t.integer :participated_guilds_count, :default => 0 # done
			t.integer :polls_count, :default => 0 
			t.integer :participated_polls_count, :default => 0
      t.integer :blogs_count, :default => 0 # done
      t.integer :drafts_count, :default => 0 # done
      t.integer :videos_count, :default => 0 # done
      t.integer :statuses_count, :default => 0 # done
      t.integer :friend_requests_count, :default => 0
      t.integer :guild_requests_count, :default => 0
      t.integer :event_requests_count, :default => 0
      t.integer :guild_invitations_count, :default => 0
      t.integer :event_invitations_count, :default => 0
      t.integer :poll_invitations_count, :default => 0 
			t.integer :poke_deliveries_count, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table "users"
  end
end
