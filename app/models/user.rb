require 'digest/sha1'

class User < ActiveRecord::Base

  acts_as_pinyin :login => "pinyin"

	searcher_column :pinyin, :login

	has_many :friend_suggestions

	has_many :comrade_suggestions

  has_one :profile, :dependent => :destroy

	# mails
	has_many :out_mails, :class_name => 'Mail', :foreign_key => 'sender_id', 
					 :conditions => { :delete_by_sender => false }, :order => 'created_at DESC'

  has_many :in_mails, :class_name => 'Mail', :foreign_key => 'recipient_id', 
					 :conditions => { :delete_by_recipient => false }, :order => 'created_at DESC'  

  def sent_mails
    mails = self.out_mails.group_by { |mail| mail.parent_id }
    mails.map do |parent_id, mail_array|
      mail_array.max {|a,b| a.created_at <=> b.created_at}
    end.sort {|a,b| b.created_at <=> a.created_at}
  end

  def recv_mails
    mails = self.in_mails.group_by { |mail| mail.parent_id }
    mails.map do |parent_id, mail_array|
      mail_array.max {|a,b| a.created_at <=> b.created_at}
    end.sort {|a,b| b.created_at <=> a.created_at }
  end

  def unread_recv_mails
    mails = self.in_mails.group_by { |mail| mail.parent_id }
    mails = mails.map do |parent_id, mail_array|
      mail_array.max {|a,b| a.created_at <=> b.created_at}
    end.sort {|a,b| b.created_at <=> a.created_at }
    mails.find_all {|m| !m.read_by_recipient}
  end

  def interested_in_game? game
		!game_attentions.find_by_game_id(game.id).nil?
  end

  has_many :game_attentions

	has_many :interested_games, :through => :game_attentions, :source => :game, :order => 'sale_date DESC'

	# notifications
	has_many :notifications, :order => 'created_at DESC'

	has_many :notices, :order => 'created_at DESC' # comment, tag notices

	# pokes
	has_many :poke_deliveries, :foreign_key => 'recipient_id', :order => 'created_at DESC'

	# status
  has_many :statuses, :foreign_key => 'poster_id', :order => 'created_at DESC', :dependent => :destroy

	has_one :latest_status, :foreign_key => 'poster_id', :class_name => 'Status', :order => 'created_at DESC'

  # friend
	has_many :all_friendships, :class_name => 'Friendship'

  has_many :friendships, :dependent => :destroy, :conditions => {:status => 1}

	has_many :friends, :through => :friendships, :source => 'friend', :order => 'pinyin ASC'

  def has_friend? user
    user_id = (user.is_a? Integer)? user : user.id
		!friendships.find_by_friend_id(user_id).blank? 
  end

  def wait_for? user
		all_friendships.find_by_friend_id_and_status(user.id, 0) 
  end

	def common_friends_with user
		friends & user.friends
	end

  # settings
	has_setting :application_setting

	has_setting :privacy_setting

	has_setting :mail_setting

  # game
  has_many :characters, :class_name => 'GameCharacter', :dependent => :destroy

  has_many :currently_playing_game_characters, :class_name => 'GameCharacter', :conditions => { :playing => true }, :order => 'created_at DESC' 

  has_many :games, :through => :characters, :uniq => true

	has_many :servers, :through => :characters, :uniq => true

  def friend_characters opts={}
    game_cond = ActiveRecord::Base.send(:sanitize_sql_hash_for_conditions, opts, "game_characters")
    game_cond = "AND #{game_cond}" unless game_cond.blank?
    GameCharacter.find(:all, :joins => "INNER JOIN friendships where friendships.user_id = #{id} AND friendships.friend_id = game_characters.id #{game_cond}")
  end

	def interested_in_game? game
    !game_attentions.find_by_game_id(game.id).nil?
  end

	def has_same_game_with? user
		!(user.characters.map(&:game_id) & characters.map(&:game_id)).blank?
	end

  # album
  belongs_to :avatar

  has_one :avatar_album, :foreign_key => 'owner_id'

  # 为了保证avatar album一定在最后一个，我们不在这里加上avatar album
  has_many :albums, :class_name => 'PersonalAlbum', :foreign_key => 'owner_id', :order => 'uploaded_at DESC'

  has_many :active_albums, :class_name => 'Album', :foreign_key => 'owner_id', :order => 'uploaded_at DESC', :conditions => "uploaded_at IS NOT NULL AND (type = 'AvatarAlbum' OR type = 'PersonalAlbum')"

  # blogs
  with_options :order => 'created_at DESC', :dependent => :destroy, :foreign_key => :poster_id do |user|
    
    user.has_many :blogs, :conditions => {:draft => false}

    user.has_many :drafts, :class_name => 'Blog', :conditions => {:draft => true}

    user.has_many :blogs_and_drafts, :class_name => 'Blog'
  
  end

  # videos
  has_many :videos, :order => 'created_at DESC', :dependent => :destroy, :foreign_key => :poster_id

  # events
  has_many :participations, :foreign_key => 'participant_id', :conditions => {:status => [3,4,5]} 

  has_many :events, :foreign_key => 'poster_id', :order => 'created_at DESC', :conditions => ["events.start_time >= ?", Time.now.to_s(:db)]

	with_options :order =>  'created_at DESC', :through => :participations, :source => :event do |user|

		user.has_many :all_events

    # 不包括我发起的，这样的都在events里
		user.has_many :upcoming_events, :conditions => ['events.poster_id != #{id} AND events.start_time >= ?', Time.now.to_s(:db)]

		user.has_many :participated_events, :conditions => ["events.start_time < ?", Time.now.to_s(:db)]

	end

	def common_events_with user
		events & user.events
	end

  # sharings
  has_many :sharings, :foreign_key => 'poster_id', :order => 'created_at DESC'

  with_options :class_name => 'Sharing', :foreign_key => 'poster_id', :order => 'created_at DESC' do |user|

    user.has_many :blog_sharings, :conditions => {:shareable_type => 'Blog'}

    user.has_many :video_sharings, :conditions => {:shareable_type => 'Video'}

    user.has_many :link_sharings, :conditions => {:shareable_type => 'Link'}

    user.has_many :photo_sharings, :conditions => {:shareable_type => 'Photo'}

    user.has_many :album_sharings, :conditions => {:shareable_type => 'Album'}

    user.has_many :poll_sharings, :conditions => {:shareable_type => 'Poll'}

    user.has_many :game_sharings, :conditions => {:shareable_type => 'Game'}
  
    user.has_many :profile_sharings, :conditions => {:shareable_type => 'Profile'}

  end

  # polls
  has_many :votes, :foreign_key => 'voter_id'

  has_many :polls, :foreign_key => 'poster_id', :order => 'created_at DESC'

  has_many :participated_polls, :through => :votes, :uniq => true, :source => 'poll', :order => 'created_at DESC', :conditions => 'poster_id != #{id}'

	# guilds
	has_many :memberships

  has_many :guilds, :foreign_key => 'president_id'

	with_options :through => :memberships, :source => :guild, :order => 'guilds.created_at DESC' do |user|

    user.has_many :privileged_guilds, :conditions => "memberships.status = 3 or memberships.status = 4"

		user.has_many :participated_guilds, :conditions => "memberships.status = 4 or memberships.status = 5"

		user.has_many :all_guilds, :conditions => "memberships.status IN (3,4,5)"

	end

	def common_guilds_with user
    all_guilds & user.all_guilds
	end

	# invitation and requests
	has_many :event_requests, :through => :events, :source => :requests

	has_many :event_invitations, :class_name => 'Participation', :foreign_key => 'participant_id', :conditions => {:status => 0}

	has_many :poll_invitations 

	has_many :guild_requests, :through => :guilds, :source => :requests 

	has_many :guild_invitations, :class_name => 'Membership',:conditions => {:status => 0}

	has_many :friend_requests, :class_name => 'Friendship', :foreign_key => 'friend_id', :conditions => {:status => 0}

  def invitations_count
    guild_invitations_count + event_invitations_count + poll_invitations_count
  end

  def requests_count
    friend_requests_count + guild_requests_count + event_requests_count
  end

	# tags
	has_many :friend_tags, :foreign_key => 'tagged_user_id'

	has_many :relative_blogs, :through => :friend_tags, :source => 'blog', :conditions => "privilege != 4"

	has_many :relative_videos, :through => :friend_tags, :source => 'video', :conditions => "privilege != 4"

	has_many :photo_tags, :foreign_key => 'tagged_user_id'

	has_many :relative_photos, :through => :photo_tags, :source => 'photo', :conditions => "privilege != 4"

	# feeds
	#has_many :feed_deliveries, :as => 'recipient', :order => 'created_at DESC'
  acts_as_feed_recipient :delete_conditions => lambda {|requestor, user| requestor == user},
                         :categories => {
                            :status => 'Status', 
                            :blog => 'Blog', 
                            :video => 'Video', 
                            :personal_album => 'PersonalAlbum',
                            :avatar => 'Avatar',
                            :event_album => 'EventAlbum',
                            :guild_album => 'GuildAlbum',
                            :all_album_related => ['EventAlbum', 'GuildAlbum', 'PersonalAlbum', 'Avatar'],
                            :poll => 'Poll',
                            :vote => 'Vote',
                            :all_poll_related => ['Poll', 'Vote'],
                            :event => 'Event',
                            :participation => 'Participation',
                            :all_event_related => ['Event', 'Participation'],
                            :guild => 'Guild',
                            :membership => 'Membership',
                            :all_guild_related => ['Guild', 'Membership'],
                            :sharing => 'Sharing',
                            :profile => 'Profile',
                            :friendship => 'Friendship'}                                                                                

  # role
  has_many :role_users, :dependent => :destroy

  has_many :roles, :through => :role_users

  def has_roles? names
    required_roles = names.uniq.map {|name| Role.find_by_name(name)}
    required_roles && roles == required_roles
  end

  def add_role name
    role = Role.find_by_name(name)
    role_users.create(:role_id => role.id) unless role.nil?
  end

  # invitation
  has_many :signup_invitations, :class_name => 'SignupInvitation', :foreign_key => 'sender_id'

  include UserAuthentication 

  include FriendSuggestor

  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :password, :password_confirmation, :gender, :avatar_id

  def validate_on_create
    # check login
    if login.blank?
      errors.add_to_base("昵称不能为空")
      return
    elsif login.length < 4 or login.length > 16
      errors.add_to_base("昵称长度不对")
      return
    elsif /^\d/.match(login)
      errors.add_to_base("昵称不能以数字开头")
      return
    end

    # check gender
    if gender.blank?
      errors.add_to_base("性别为空")
      return
    elsif gender != 'male' and gender != 'female'
      errors.add_to_base("未知的性别")
      return
    end

    # check email
    if email.blank?
      errors.add_to_base("邮件为空")
      return 
    elsif !/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.match(email)
      errors.add_to_base("邮件格式不对")
      return
    elsif !User.find_by_email(email).blank?
      errors.add_to_base("邮件已经被注册了")
      return
    end
  end

end
