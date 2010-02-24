class Boss < ActiveRecord::Base

  belongs_to :guild
  
  belongs_to :game

  has_many :gears

  attr_readonly :game_id, :guild_id

  validates_presence_of :name, :message => "不能为空"

  validates_size_of :name, :within => 1..100, :too_short => "不能小于1个字节", :too_long => "不能大于100个字节"

  validates_presence_of :reward, :message => "不能为空"

  validates_numericality_of :reward, :message => "非法，必须是正整数", :greater_than => 0, :only_integer => true

  validates_presence_of :guild_id, :message => "不能为空"

  validate_on_create :guild_is_valid

protected

  def guild_is_valid
    return if guild_id.blank?
    errors.add(:guild_id, "不存在") if Guild.exists?(guild_id)
  end
  
end
