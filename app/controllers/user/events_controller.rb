class User::EventsController < UserBaseController

  layout 'app'

  before_filter :friend_or_owner_required, :only => [:index, :upcoming, :participated]

  def index
		cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @events = @user.events.find(:all, :conditions => cond).paginate :page => params[:page], :per_page => 5
  end

	def hot
    cond = user_game_conds
    @events = Event.hot.find(:all, :conditions => cond).paginate :page => params[:page], :per_page => 5
  end

  def recent
    cond = user_game_conds
    @events = Event.recent.find(:all, :conditions => cond).paginate :page => params[:page], :per_page => 5
	end

  def upcoming
		cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @events = @user.upcoming_events.find(:all, :conditions => cond).paginate :page => params[:page], :per_page => 5
  end

  def participated
		cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @events = @user.participated_events.find(:all, :conditions => {:game_id => params[:game_id]}).paginate :page => params[:page], :per_page => 5
  end

  def friends
    @events = current_user.event_feed_items.map(&:originator).paginate :page => params[:page], :per_page => 10
  end

  def show
    @participations = @event.participations_for current_user
    @album = @event.album
		render :action => 'show', :layout => 'app2'
  end

  def new
    @event = Event.new
  end

  def create
    event_opts = (params[:event] || {}).merge({:poster_id => current_user.id})
    @event = Event.new(event_opts)
    if @event.save
      redirect_to new_event_invitation_url(@event)
    else
      render :action => 'new'
    end
  end

  def edit
    render :action => 'edit', :layout => false
  end

  def update
    event_opts = (params[:event] || {}).merge({:poster_id => current_user.id})
    if @event.update_attributes(event_opts)
      redirect_to event_url(@event)
    else
      render :action => 'edit'
    end
  end

  def destroy
    if @event.destroy
      render :update do |page|
        page.redirect_to events_url(:id => current_user.id)
      end
    else
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end  

  #
  # 这个方法在目前的页面用不上
  #
  def search
    case params[:type].to_i
    when 0
      @events = current_user.upcoming_events.search(params[:key]).paginate :page => params[:page], :per_page => 5
    when 1
      @events = Event.hot.search(params[:key]).paginate :page => params[:page], :per_page => 5
    when 2
      @events = Event.recent.search(params[:key]).paginate :page => params[:page], :per_page => 5
    when 3
      @events = current_user.past_events.search(params[:key]).paginate :page => params[:page], :per_page => 5
    end
    @remote = {:update => 'events', :url => {:action => 'search', :controller => 'user/events', :type => params[:type], :key => params[:key]}}
    render :partial => 'user/event/events', :object => @events
  end

protected

  def setup
    if ['show'].include? params[:action]
      @event = Event.find(params[:id])
			@user = @event.poster
			#@reply_to = User.find(params[:reply_to]) if params[:reply_to]
    elsif ['edit', 'update', 'destroy'].include? params[:action]
      @event = current_user.events.find(params[:id])
    elsif ['index', 'upcoming', 'participated'].include? params[:action]
      @user = User.find(params[:id])
    end
  rescue
    not_found
  end

end
