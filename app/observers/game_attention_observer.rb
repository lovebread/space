class GameAttentionObserver < ActiveRecord::Observer

	def before_create attention
		attention.user.raw_increment :game_attentions_count unless character.user.interested_games.include?(attention.game)
	end

	def after_destroy attention
		attention.user.raw_decrement :game_attentions_count unless character.user.interested_games.include?(attention.game)
	end

end
