class Guild < ActiveRecord::Base
  
  belongs_to :game

  belongs_to :president, :class_name => 'User'

  belongs_to :president_character, :class_name => 'GameCharacter', :foreign_key => 'character_id'

  named_scope :hot, :order => '(members_count + veterans_count + 1) DESC'

  named_scope :recent, :order => 'created_at DESC'

  named_scope :unverified, :conditions => {:verified => 0}, :order => "created_at DESC"
  named_scope :accept, :conditions => {:verified => 1}, :order => "created_at DESC"
  named_scope :reject, :conditions => {:verified => 2}, :order => "created_at DESC"

  attr_protected :verified
  
  has_one :forum

  has_one :album, :class_name => 'GuildAlbum', :foreign_key => 'owner_id', :dependent => :destroy
  
  has_many :events

  has_many :gears

  has_many :bosses

  has_many :rules, :class_name => 'GuildRule'

  has_many :basic_rules, :class_name => 'GuildRule', :conditions => {:rule_type => 2}

  has_many :attendance_rules, :class_name => 'GuildRule', :conditions => {:rule_type => [0, 1]}

  has_one :absence_rule, :class_name => 'GuildRule', :conditions => {:rule_type => 0}

  has_one :presence_rule, :class_name => 'GuildRule', :conditions => {:rule_type => 1}

  has_many :memberships

  has_many :invitations, :class_name => 'Membership', :conditions => {:status => 0}

  has_many :requests, :class_name => 'Membership', :conditions => {:status => 1}

	with_options :through => :memberships, :source => 'user', :uniq => true do |guild|

    guild.has_many :invitees, :conditions => "memberships.status = 0"

		guild.has_many :requestors, :conditions => "memberships.status = 1"

		guild.has_many :veterans, :conditions => "memberships.status = 4"
    
    guild.has_many :members, :conditions => "memberships.status = 5"

    guild.has_many :people, :conditions => "memberships.status =3 or memberships.status = 4 or memberships.status = 5"

	end

  with_options :through => :memberships, :source => 'character' do |guild|

    guild.has_many :invite_characters, :conditions => "memberships.status = 0"

    guild.has_many :request_characters, :conditions => "memberships.status = 1"

    guild.has_many :veteran_characters, :conditions => "memberships.status = 4"

    guild.has_many :member_characters, :conditions => "memberships.status = 5"

    guild.has_many :characters, :conditions => "memberships.status = 3 or memberships.status = 4 or memberships.status = 5" 

    guild.has_many :all_characters
  end

  acts_as_feed_recipient :delete_conditions => lambda {|user, guild| guild.president == user },
                         :categories => {
                            :blog => 'Blog',
                            :video => 'Video',
                            :poll => 'Poll',
                            :vote => 'Vote',
                            :event => 'Event',
                            :participation => 'Participation',
                            :personal_album => 'PersonalAlbum'
                          }

	acts_as_resource_feeds

	acts_as_commentable :order => 'created_at DESC',
                      :delete_conditions => lambda {|user, guild, comment| guild.president == user}, 
                      :create_conditions => lambda {|user, guild| guild.has_member?(user)},
                      :view_conditions => lambda { true } # anyone can view

	searcher_column :name

  # game_id, president_id, character_id 不能改变
  attr_readonly :game_id, :game_area_id, :game_server_id, :president_id, :character_id, :name

  validates_presence_of :name, :message => "不能为空"

  validates_size_of :name, :within => 1..100, :too_long => "最长100个字节", :too_short => "最短1个字节"

  validates_presence_of :description, :message => "不能为空"

  validates_size_of :description, :within => 1..10000, :too_long => "最长10000个字节", :too_short => "最短1个字节"
 
  validates_presence_of :character_id, :message => "不能为空", :on => :create

  validate_on_create :character_is_valid

	def people_count
		veterans_count + members_count + 1
	end

  def has_member? user
    !memberships.find(:first, :conditions => {:user_id => user.id, :status => [3,4,5]}).blank? 
  end

  def has_character? character
    !memberships.find(:first, :conditions => {:character_id => character.id, :status => [3,4,5]}).blank?
  end

  def memberships_for user
    memberships.find(:all, :conditions => {:user_id => user.id})
  end

  def characters_for user
    characters.find(:all, :conditions => {:user_id => user.id})
  end

  def role_for user
    memberships.find(:first, :conditions => {:user_id => user.id, :status => [3,4,5]}, :order => 'status ASC') 
  end

  def is_requestable_by? user
    !user.characters.find(:first, :conditions => {:game_id => game_id, :area_id => game_area_id, :server_id => game_server_id}).blank?
  end

  def invitations= invitation_attrs
    return if invitation_attrs.blank?
    invitation_attrs.each do |attrs|
      invitations.build(attrs)
    end 
  end

  after_save :save_rules

  def new_rules= rule_attrs
    @new_rules_attrs = rule_attrs
  end

  def existing_rules= rule_attrs
    @existing_rules_attrs = rule_attrs
  end

  def del_rules= rule_ids
    @del_rules_ids = rule_ids
  end

  def save_rules
    unless @new_rules_attrs.blank?
      @new_rules_attrs.each_value do |attrs|
        basic_rules.create(attrs)
      end
    end
    @new_rules_attrs = nil
    
    unless @existing_rules_attrs.blank?
      @existing_rules_attrs.each do |id, attrs|
        rules.find(id).update_attributes(attrs)
      end
    end
    @existing_rules_attrs = nil
    
    unless @del_rules_ids.blank?
      @del_rules_ids.each do |id|
        rules.find(id).destroy
      end
    end
    @del_rules_ids = nil
  end

  after_save :save_bosses

  def new_bosses= boss_attrs
    @new_bosses_attrs = boss_attrs
  end

  def existing_bosses= boss_attrs
    @existing_bosses_attrs = boss_attrs
  end

  def del_bosses= boss_ids
    @del_bosses_ids = boss_ids
  end

  def save_bosses
    unless @new_bosses_attrs.blank?
      @new_bosses_attrs.each_value do |attrs|
        bosses.create(attrs)
      end
    end
    @new_bosses_attrs = nil

    unless @existing_bosses_attrs.blank?
      @existing_bosses_attrs.each do |id, attrs|
        bosses.find(id).update_attributes(attrs)
      end
    end
    @existing_bosses_attrs = nil

    unless @del_bosses_ids.blank?
      @del_bosses_ids.each do |id|
        bosses.find(id).destroy
      end
    end
    @del_bosses_ids = nil
  end

  after_save :save_gears

  def new_gears= gear_attrs
    @new_gears_attrs = gear_attrs
  end

  def existing_gears= gear_attrs
    @existing_gears_attrs = gear_attrs
  end

  def del_gears= gear_ids
    @del_gears_ids = gear_ids
  end

  def save_gears
    unless @new_gears_attrs.blank?
      @new_gears_attrs.each_value do |attrs|
        gears.create(attrs)
      end
    end
    @new_gears_attrs = nil

    unless @existing_gears_attrs.blank?
      @existing_gears_attrs.each do |id, attrs|
        gears.find(id).update_attributes(attrs)
      end
    end
    @existing_gears_attrs = nil

    unless @del_gears_ids.blank?
      @del_gears_ids.each do |id|
        gears.find(id).destroy
      end
    end
    @del_gears_ids = nil
  end

protected

  def character_is_valid
    return if character_id.blank?
    character = GameCharacter.find(:first, :conditions => {:id => character_id})
    errors.add(:character_id, "不存在") if character.blank?
    return if president_id.blank?
    errors.add(:character_id, "不是拥有者") if character.user_id != president_id
  end

end
