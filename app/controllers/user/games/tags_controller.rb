class User::Games::TagsController < User::TagsController

protected

	def get_taggable
		@taggable = Game.find(params[:game_id])\
	rescue
		not_found
	end

end
