module ObserverLinkHelpers

	def video_link video
		"<a href='/videos/#{video.id}'>#{video.title}</a>"
	end

	def blog_link blog
		"<a href='/blogs/#{blog.id}'>#{blog.title}</a>"
	end

	def event_link event
		"<a href='/events/#{event.id}'>#{event.title}</a>"
	end

	def profile_link user
		"<a href='/profiles/#{user.profile.id}'>#{user.login}</a>"
	end 

	def guild_link guild
		"<a href='/guilds/#{guild.president.id}'>#{guild.name}</a>"
	end

	def poll_link poll
		"<a href='/polls/#{poll.id}'>#{poll.name}</a>"
	end

	def album_link album
		"<a href='/#{album.class.to_s.underscore}s/#{album.id}>#{album.title}</a>"
	end

	def photo_link photo
		"<a href='/#{photo.class.to_s.underscore}s/#{photo.id}>照片</a>"
	end

	def profile_wall_link profile
		"<a href='/profiles/#{profile.id}/comments'>留言版</a>"
	end

	def event_wall_link event
		"<a href='/events/#{event.id}/comments'>留言版</a>"
	end

	def guild_wall_link guild
		"<a href='/guilds/#{guild.id}/comments'>留言版</a>"
	end

end

ActiveRecord::Observer.send(:include, ObserverLinkHelpers)
