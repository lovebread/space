# FriendSuggestor
module FriendSuggestor

	FRIEND_SUGGESTION_SET_SIZE = 20
	FRIEND_SUGGESTION_MINIMUM = 10

	COMRADE_SUGGESTION_SET_SIZE = 20
	COMRADE_SUGGESTION_MINIMUM = 10

	def collect_friends
		friend_suggestions = {} # (user_id, frequency) pair
		friend_suggestions.default = 0

		# events
		all_events.sort_by{rand}.each do |event|
			event.participants.sort_by{rand}.each do |p|
				if p != self and !self.has_friend?(p) and !self.wait_for?(p) and !p.wait_for?(self) 
					friend_suggestions[p.id] += 1 
				end
			end
		end	

		return friend_suggestions if friend_suggestions.size > FRIEND_SUGGESTION_SET_SIZE

		#	guilds
		all_guilds.sort_by{rand}.each do |guild|
			guild.people.sort_by{rand}.each do |p|
				if p != self and !self.has_friend?(p) and !self.wait_for?(p) and !p.wait_for?(self) 
					friend_suggestions[p.id] += 1
				end
			end
		end

		return friend_suggestions if friend_suggestions.size > FRIEND_SUGGESTION_SET_SIZE

		# friend's friends
		friends.sort_by{rand}.each do |friend|
			friend.friends.sort_by{rand}.each do |f|
				if f != self and !self.has_friend?(f) and !self.wait_for?(f) and !f.wait_for?(self) 
					friend_suggestions[f.id] += 1
				end
			end
		end

		return friend_suggestions if friend_suggestions.size > FRIEND_SUGGESTION_SET_SIZE
	
		# user within same game
		games.sort_by{rand}.each do |game|
			game.users.sort_by{rand}.each do |u|
				if u != self and !self.has_friend?(u) and !self.wait_for?(u) and !u.wait_for?(self)
					friend_suggestions[u.id] += 1
				end
			end
		end

		friend_suggestions
	
	end

	def destroy_obsoleted_friend_suggestions friend
		FriendSuggestion.destroy_all(:user_id => id, :suggested_friend_id => friend.id)
	end

	def find_or_create_friend_suggestions
		return friend_suggestions if (friend_suggestions.count >= FRIEND_SUGGESTION_MINIMUM) 

		# now destroy all existing friend suggestions
		FriendSuggestion.destroy_all(:user_id => id)

		# construct new suggestions and insert into database
		values = []
		collect_friends.each_key {|friend_id| values << "(NULL,#{id},#{friend_id})" }

    return friend_suggestions if values.blank?

		sql = "insert into friend_suggestions values #{values.join(',')}"
		ActiveRecord::Base.connection.execute(sql)

    self.reload
		friend_suggestions
	end 
		
	def collect_comrades server
		comrade_suggestions = {}
		comrade_suggestions.default =	0	

		server.users.sort_by{rand}.each do |u|
			if u != self and !self.has_friend?(u)	and !self.wait_for?(u) and !u.wait_for?(self)
				comrade_suggestions[u.id] += 5 * u.common_friends_with(self).count
				comrade_suggestions[u.id] += 2 * u.common_events_with(self).count
				comrade_suggestions[u.id] += 2 * u.common_guilds_with(self).count
				break if comrade_suggestions.count >= COMRADE_SUGGESTION_SET_SIZE
			end
		end

		comrade_suggestions.sort {|a,b| a[1] <=> b[1]}

		comrade_suggestions						
	end

	def destroy_obsoleted_comrade_suggestions comrade
		ComradeSuggestion.destroy_all(:user_id => id, :comrade_id => comrade.id)
	end

	def find_or_create_comrade_suggestions server
		suggestions = comrade_suggestions.find(:all, :conditions => {:game_id => server.game_id, :server_id => server.id})

	  return suggestions if suggestions.count >= COMRADE_SUGGESTION_MINIMUM

    ComradeSuggestion.destroy_all(:user_id => id, :game_id => server.game_id, :server_id => server.id)

	  # construct new suggestions and insert into database
	  values = []
	  collect_comrades(server).each_key do |friend_id|
  		if server.game.no_areas?
	  		values << "(NULL, #{id}, #{friend_id}, #{server.game_id}, NULL, #{server.id})"
		  else
			  values << "(NULL, #{id}, #{friend_id}, #{server.game_id}, #{server.area_id}, #{server.id})"
		  end
	  end

		return suggestions if values.blank?

	  sql = "insert into comrade_suggestions values #{values.join(',')}"
	  ActiveRecord::Base.connection.execute(sql)
	  
    self.reload
	  comrade_suggestions.find(:all, :conditions => {:game_id => server.game_id, :server_id => server.id})
	end 

end
