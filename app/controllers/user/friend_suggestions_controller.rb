class User::FriendSuggestionsController < UserBaseController

	layout 'app'

	def index
    @games = Game.find(:all, :order => 'pinyin ASC')
		@friend_suggestions = current_user.find_or_create_friend_suggestions.paginate :page => params[:page], :per_page => 6
		@comrade_suggestions = {}
		current_user.servers.each do |s|
			@comrade_suggestions[s.id] = current_user.find_or_create_comrade_suggestions(s).paginate :page => params[:page], :per_page => 3
		end
	end

	def friend
		@games = Game.find(:all, :order => 'pinyin ASC')
    @friend_suggestions = current_user.find_or_create_friend_suggestions.paginate :page => params[:page], :per_page => 10
	end

	def comrade
    @games = Game.find(:all, :order => 'pinyin ASC')
		@comrade_suggestions = current_user.find_or_create_comrade_suggestions(@server).paginate :page => params[:page], :per_page => 10
	end

	def new
		if !params[:server_id].nil?
			@suggestion = current_user.find_or_create_comrade_suggestions(@server).reject{|s| @except.include?(s)}.sort_by{rand}.first
			render :partial => 'comrade_suggestion', :object => @suggestion
		elsif !params[:nicer].nil?
			@suggestion = current_user.find_or_create_friend_suggestions.reject{|s| @except.include?(s)}.sort_by{rand}.first
			render :partial => 'nicer_friend_suggestion', :object => @suggestion
		else
			@suggestion = current_user.find_or_create_friend_suggestions.reject{|s| @except.include?(s)}.sort_by{rand}.first
			render :partial => 'friend_suggestion', :object => @suggestion
		end
	end

protected

	def setup
		if ["comrade"].include? params[:action]
			@server = GameServer.find(params[:server_id]) 
		elsif ["new"].include? params[:action]
			unless params[:server_id].nil?
				@except = ComradeSuggestion.find(params[:except_ids])
				@server = GameServer.find(params[:server_id])
			else
				@except = FriendSuggestion.find(params[:except_ids])
			end
		end
	rescue
		not_found
	end

end
