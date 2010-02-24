class Event < ActiveRecord::Base

  has_one :album, :class_name => 'EventAlbum', :foreign_key => 'owner_id', :dependent => :destroy

  belongs_to :poster, :class_name => 'User'

  belongs_to :poster_character, :class_name => 'GameCharacter', :foreign_key => 'character_id'

  belongs_to :game

  belongs_to :game_server

  belongs_to :game_area

  belongs_to :guild

	named_scope :hot, :conditions => {:expired => 0}, :order => 'confirmed_count DESC'
	
	named_scope :recent, :conditions => {:expired => 0}, :order => 'start_time DESC'

  named_scope :unverified, :conditions => {:verified => 0}, :order => "created_at DESC"
  named_scope :accept, :conditions => {:verified => 1}, :order => "created_at DESC"
  named_scope :reject, :conditions => {:verified => 2}, :order => "created_at DESC"

  attr_protected :verified
  
  has_many :participations, :dependent => :delete_all # we dont want to trigger participation destroy callback here, it's slow.

  has_many :confirmed_participations, :class_name => 'Participation', :conditions => {:status => Participation::Confirmed}

  has_many :maybe_participations, :class_name => 'Participation', :conditions => {:status => Participation::Maybe}

  has_many :invitations, :class_name => 'Participation', :conditions => {:status => Participation::Invitation}
  
  has_many :requests, :class_name => 'Participation', :conditions => {:status => Participation::Request}

	with_options :source => 'participant', :uniq => true do |event|

		event.has_many :invitees, :through => :invitations

		event.has_many :requestors, :through => :requests

		event.has_many :confirmed_participants, :through => :confirmed_participations

		event.has_many :maybe_participants, :through => :maybe_participations

		event.has_many :participants, :through => :participations, :conditions => "participations.status = 3 or participations.status = 4"

	end

  with_options :source => 'character' do |event|

    event.has_many :invite_characters, :through => :invitations

    event.has_many :request_characters, :through => :requests

    event.has_many :confirmed_characters, :through => :confirmed_participations

    event.has_many :maybe_characters, :through => :maybe_participations

    event.has_many :characters, :through => :participations, :conditions => "participations.status = 3 or participations.status = 4"

    event.has_many :all_characters, :through => :participations

  end

  acts_as_commentable :order => 'created_at DESC',
                      :delete_conditions => lambda {|user, event, comment| event.poster == user}, 
                      :create_conditions => lambda {|user, event| event.has_participant?(user)},
                      :view_conditions => lambda { true } # this means anyone can view

	acts_as_resource_feeds

	searcher_column :title

  # poster_id, game_server_id, game_area_id, game_id 不能改
  # guild_id 不能改，如果存在的话
  attr_readonly :poster_id, :character_id, :game_server_id, :game_area_id, :game_id, :guild_id

  validates_presence_of :poster_id, :message => "不能为空", :on => :create

  validates_presence_of :title, :message => "不能为空"

  validates_size_of :title, :within => 1..100, :too_long => "最长100字节", :too_short => "最短1字节"

  validates_presence_of :description, :message => "不能为空"

  validates_size_of :description, :within => 1..10000, :too_long => "最长10000字节", :too_short => "最短1字节"

  validates_presence_of :start_time, :end_time, :message => "不能为空"

  validate :time_is_valid

  validate_on_create :guild_is_valid

  validates_presence_of :character_id, :message => "不能为空", :on => :create

  validate_on_create :character_is_valid

  def participants_count
    confirmed_count + maybe_count
  end

  def has_participant? user
    !participations.find(:first, :conditions => {:status => [Participation::Confirmed, Participation::Maybe], :participant_id => user.id}).blank?
  end

  def has_character? character
    !participations.find(:first, :conditions => {:status => [Participation::Confirmed, Participation::Maybe], :character_id => character.id}).blank?
  end

  def participations_for user
    participations.find(:all, :conditions => {:participant_id => user.id})
  end

  def characters_for user
    all_characters.find(:all, :conditions => {:user_id => user.id})  
  end

  def is_guild_event?
    !guild_id.nil?
  end

  def was_guild_event?
    !guild_id_was.nil?
  end

  def time_changed?
    start_time.changed? || end_time.changed?
  end

  def is_requestable_by? user
    return -3 if expired 
    return -1 if user.characters.find(:first, :conditions => {:game_id => game_id, :area_id => game_area_id, :server_id => game_server_id}).blank?

    if is_guild_event?
      return 1 if guild.has_member?(user)
      return -2
    else
      return 1 if privilege == 1 || (privilege == 2 and poster.has_friend? user)
      return 0
    end
  end

  def invitations= invitation_attrs
    return if invitation_attrs.blank?
    invitation_attrs.each do |attrs|
      invitations.build(:participant_id => attrs[:user_id], :character_id => attrs[:character_id])
    end
  end

protected

  def time_is_valid
    return if start_time.blank? or end_time.blank?
    errors.add(:start_time, "不能比现在早") if start_time <= Time.now
    errors.add(:end_time, "不能比开始时间早") if end_time <= start_time
  end

  def guild_is_valid
    return if guild_id.blank?
    guild = Guild.find(:first, :conditions => {:id => guild_id})
    if guild.blank?
      errors.add(:guild_id, "不存在")
    elsif poster_id
      role = guild.role_for(poster)
      errors.add(:guild_id, "没有权限") if role == Membership::President or role == Membership::Veteran
    end
  end

  def character_is_valid
    return if character_id.blank?
    character = GameCharacter.find(:first, :conditions => {:id => character_id})
    errors.add(:character_id, "不存在") if character.blank?
    return if poster_id.blank?
    errors.add(:character_id, "不是拥有者") if character.user_id != poster_id
  end

end
