class User::GamesController < UserBaseController

  layout 'app2'

  FirstFetchSize = 2
  
  FetchSize = 2

  def index
    @games = @user.games.paginate :page => params[:page], :per_page => 10
    render :action => "index", :layout => "app"      
  end

  def friends
    @games = current_user.friends.map(&:games).flatten.uniq.paginate :page => params[:page], :per_page => 10
    render :action => "friends", :layout => "app"
  end

  #
  # sexy 和 hot 的区别是
  # sexy是按照过去一周这个游戏有多少游戏角色而定的
  # hot是按照这一周里有多少人关注这个游戏而定的
  # 
  def sexy
    @games = Game.sexy.paginate :page => params[:page], :per_page => 10
    render :action => "sexy", :layout => "app"
  end

  def interested
    @games = current_user.interested_games.paginate :page => params[:page], :per_page => 10
    render :action => 'interested', :layout => 'app'
  end

  def show
    @blogs = @game.blogs.find(:all, :limit => 3)
		@players = []
		if current_user.games.include?(@game)
			current_user.servers.find(:all, :conditions=> { :game_id => @game.id}).each { |server|
				@players << server.users
			}
		else
			@players = @game.users.find(:all, :limit => 3)	
		end
    @albums = @game.albums.find(:all, :limit => 3)
    @feed_deliveries = @game.feed_deliveries.find(:all, :limit => FirstFetchSize, :order => 'created_at DESC')
		@first_fetch_size = FirstFetchSize
  end

  def hot
    @games = Game.hot.paginate :page => params[:page], :per_page => 1
    @remote = {:update => 'hot_games_list', :url => {:action => 'hot'}} 
    render :action => 'hot', :layout => 'app'
  end

  def beta
    @games = Game.beta.paginate :page => params[:page], :per_page => 1
    @remote = {:update => 'beta_games_list', :url => {:action => 'beta'}}
    render :action => 'beta', :layout => 'app'
  end

  def more_feeds
    @feed_deliveries = @game.feed_deliveries.find(:all, :offset => FirstFetchSize + FetchSize * params[:idx].to_i, :limit => FetchSize, :order => "created_at DESC")
		@fetch_size = FetchSize
  end

protected

  def setup
    if ["index", "interested"].include? params[:action]
      @user = User.find(params[:id]) 
    elsif ["more_feeds", "show"].include? params[:action]
      @game = Game.find(params[:id])
    elsif ["sexy", "hot", "beta"].include? params[:action]
      @user = current_user
    elsif ["game_details"].include? params[:action]
      @game = Game.find(params[:id])
      @user = current_user
    elsif ["area_details"].include? params[:action]
      @game = Game.find(params[:id])
      @area = @game.areas.find(params[:area_id])
      @user = current_user
    end
  end

end
