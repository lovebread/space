class GuildRule < ActiveRecord::Base

  belongs_to :guild

  ABSENCE  = 0
  PRESENCE = 1
  NORMAL   = 2

  attr_readonly :rule_type, :guild_id

  validates_presence_of :reason, :message => "不能为空"

  validates_size_of :reason, :within => 1..200, :too_short => "不能小于1个字节", :too_long => "不能大于100个字节"

  validate_on_update :reason_is_readonly_for_attendance_rules

  validates_presence_of :rule_type, :message => "不能为空"

  validates_inclusion_of :rule_type, :in => [ABSENCE, PRESENCE, NORMAL]

  validate_on_create :attendance_rules_cant_be_created

  validates_presence_of :outcome, :message => "不能为空"

  validate :outcome_is_valid

  validates_presence_of :guild_id, :message => "不能为空"

  validate_on_create :guild_is_valid

  def is_attendance_rule?
    rule_type == ABSENCE or rule_type == PRESENCE
  end

  def is_absence_rule?
    rule_type == ABSENCE
  end

  def is_presence_rule?
    rule_type == PRESENCE
  end

  def is_normal_rule?
    rule_type == NORMAL
  end

protected

  def reason_is_read_only_for_attendance_rules
    return if rule_type.blank?
    errors.add(:reason, "对于出勤规则无法改变描述") if is_attendance_rule? and reason_changed?     
  end

  def attendance_rules_cant_be_created
    return if rule_type.blank?
    errors.add(:rule_type, "不能创建出勤规则") if is_attendance_rule?
  end

  def outcome_is_valid
    return if outcome.blank?
    
    if is_presence_rule?
      errors.add(:outcome, "应该为正整数") if outcome.to_i <= 0
    elsif is_absence_rule?
      errors.add(:outcome, "应该<0") if outcome.to_i >= 0
    end
  end

  def guild_is_valid
    return if guild_id.blank?
    errors.add(:guild_id, "不存在") if Guild.exists?(guild_id)
  end

end
