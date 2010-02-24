class Participation < ActiveRecord::Base

  belongs_to :participant, :class_name => 'User'

  belongs_to :character, :class_name => 'GameCharacter'

  belongs_to :event

	acts_as_resource_feeds

	Invitation			= 0 # 邀请
  Request         = 1 # 请求 
	Confirmed				= 3 # 一定去
	Maybe						= 4 # 可能去
  Expired         = 5 # 过期的请求或者邀请

  # participant_id, character_id, event_id 都是不能修改的
  attr_readonly :participant_id, :character_id, :event_id

  validates_presence_of :participant_id, :message => "不能为空", :on => :create

  validates_presence_of :character_id, :message => "不能为空", :on => :create

  validates_presence_of :event_id, :message => "不能为空", :on => :create

  validates_inclusion_of :status, :message => "只能是0,1,3,4", :in => [Invitation, Request, Confirmed, Maybe]

  validate_on_create :event_is_valid

  validate_on_create :character_is_valid

  validate_on_create :participant_is_valid

  validate_on_update :status_is_valid

  def to_s
    if is_invitation?
      "受邀请"
    elsif is_request?
      "等待回复"
    elsif status == 3
      "一定去"
    elsif status == 4
      "可能去"
    end
  end

  def is_invitation?
    status == Participation::Invitation
  end

  def was_invitation?
    status_was == Participation::Invitation
  end
  
  def is_request?
    status == Participation::Request
  end

  def was_request?
    status_was == Participation::Request
  end

  def is_confirmed?
    status == Participation::Confirmed
  end

  def is_authorized?
    status == Participation::Confirmed or status == Participation::Maybe
  end

  def was_authorized?
    status_was == Participation::Confirmed or status_was == Participation::Maybe
  end

  def is_expired?
    status == Participation::Expired
  end

protected

  def event_is_valid
    return if event_id.blank?
    errors.add(:event_id, "不存在") unless Event.exists? event_id
  end  

  def character_is_valid
    return if character_id.blank?
    c = GameCharacter.find(:first, :conditions => {:id => character_id, :user_id => participant_id})
    if c.blank?
      errors.add(:character_id, "不存在")
    elsif event and (c.game_id != event.game_id or c.area_id != event.game_area_id or c.server_id != event.game_server_id)
      errors.add(:character_id, "不属于相应服务器")
    end
  end

  def participant_is_valid
    return if event.blank? or participant.blank? or character.blank?

    participation = event.participations.find(:first, :conditions => {:participant_id => participant_id, :character_id => character_id})

    if participation.blank?
      if is_invitation?
        errors.add(:participant_id, '不能邀请非好友') if !event.poster.has_friend?(participant_id)
      elsif is_request?
        errors.add(:participant_id, '权限不够') unless event.is_requestable_by? participant
      elsif is_authorized?
        errors.add(:participant_id, '不能直接创建') unless event.poster_id == participant_id
      end
    else
      if participation.is_invitation?
        errors.add(:participant_id, '已经被邀请了') 
      elsif participation.is_request?
        errors.add(:participant_id, '已经发送请求了')
      elsif participation.is_authorized?
        errors.add(:participant_id, '已经参加了该活动')
		  end
    end
  end

  def status_is_valid
    return if status_id.blank?  
 
    if is_invitation?
      errors.add(:status, '不能从请求变成邀请') if was_request?
      errors.add(:status, '不能从参加变成邀请') if was_authorized?
    elsif is_request?
      errors.add(:status, '不能从邀请变成请求') if was_invitation?
      errors.add(:status, '不能从参加变成请求') if was_authorized?
    end 
  end

end
