class ComradeSuggestion < ActiveRecord::Base

	belongs_to :user

	belongs_to :comrade, :class_name => 'User'

	belongs_to :game

	belongs_to :server, :class_name => 'GameServer'

	belongs_to :area, :class_name => 'GameArea'

end
