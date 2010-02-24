class GameAttention < ActiveRecord::Base

  belongs_to :user

  belongs_to :game, :counter_cache => :attentions_count

  attr_readonly :user_id, :game_id

  validates_presence_of :user_id, :message => "不能为空", :on => :create

  validates_presence_of :game_id, :message => "不能为空", :on => :create

  validate_on_create :game_is_valid
 
protected

  def game_is_valid 
		return if game_id.blank?
    game = Game.find_by_id(game_id)
    errors.add(:game_id, "不存在") if game.blank?
    return if user_id.blank?
    errors.add(:user_id, "已经关注了") if game.attentions.find_by_user_id(user_id)
	end

end
