class Membership < ActiveRecord::Base

  belongs_to :user

  belongs_to :character, :class_name => 'GameCharacter'

  belongs_to :guild

	acts_as_resource_feeds

	Invitation			= 0
	Request         = 1
	President				= 3
	Veteran					= 4
	Member					= 5

  # user_id, guild_id, character_id 不能被修改
  attr_readonly :user_id, :guild_id, :character_id

  validates_presence_of :user_id, :message => "不能为空", :on => :create

  validates_presence_of :guild_id, :message => "不能为空", :on => :create

  validates_presence_of :character_id, :message => "不能为空", :on => :create

  validates_inclusion_of :status, :in => [Invitation, Request, President, Veteran, Member], :message => "只能是0,1,2,3,4"

  validate_on_create :guild_is_valid

  validate_on_create :character_is_valid

  validate_on_create :user_is_valid

  validate_on_update :status_is_valid

  def to_s
    if is_president?
      "会长"
    elsif is_veteran?
      "长老"
    elsif is_member?
      "会员"
    end
  end

  def is_invitation?
    status == Membership::Invitation
  end

  def was_invitation?
    status_was == Membership::Invitation
  end

  def is_request?
    status == Membership::Request
  end

  def was_request?
    status_was == Membership::Request
  end

  def is_president?
    status == Membership::President
  end

  def was_president?
    status_was == Membership::President
  end

  def is_veteran?
    status == Membership::Veteran
  end

  def is_member?
    status == Membership::Member
  end

  def is_authorized?
    status == Membership::Member or status == Membership::Veteran
  end

  def was_authorized?
    status_was == Membership::Member or status_was == Membership::Veteran
  end  

protected

  def guild_is_valid
    return if guild_id.blank?
    errors.add(:guild_id, "工会不存在") if Guild.exists? guild_id
  end

  def character_is_valid
    return if character_id.blank?
    c = GameCharacter.find(:first, :conditions => {:id => character_id, :user_id => user_id})
    if c.blank?
      errors.add(:character_id, "不存在")
    elsif guild and (c.game_id != guild.game_id or c.area_id != guild.game_area_id or c.server_id != guild.game_server_id)
      errors.add(:character_id, "不属于相应服务器")
    end
  end
  
  def user_is_valid
    return if character.blank? or user.blank? or guild.blank?
 
    membership = guild.memberships.find_by_user_id_and_character_id(user_id, character_id)
    
    if membership.blank?
      if is_invitation?
        errors.add(:user_id, '不能邀请非好友') if !guild.president.has_friend?(user_id)
      elsif is_request?
      elsif is_authorized? or is_president?
        errors.add(:user_id, '不能直接创建') unless guild.president_id == user_id
      end
    else
      if membership.is_invitation?
        errors.add(:user_id, '已经被邀请了')
      elsif membership.is_request?
        errors.add(:user_id, '已经发送请求了')
      elsif membership.is_authorized? or membership.is_president?
        errors.add(:user_id, '已经加入了该工会')
      end
		end
  end

  def status_is_valid
    return if status.blank? 
    
    if is_invitation?
      errors.add(:status, '不能从请求变成邀请') if was_request?
      errors.add(:status, '不能从参加变成邀请') if was_authorized? or was_president?
    elsif is_request?
      errors.add(:status, '不能从邀请变成请求') if was_invitation?
      errors.add(:status, '不能从参加变成请求') if was_authorized? or was_president?
    elsif is_president?
      errors.add(:status, '不能变成会长')
    end
  end

end
