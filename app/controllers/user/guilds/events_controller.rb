class User::Guilds::EventsController < UserBaseController

  layout 'app'

  def index
    @events = @guild.events.paginate :page => params[:page], :per_page => 10
  end

	def search
		@events = @guild.events.find_all {|e| e.title.include? params[:key]}.paginate :page => params[:page], :per_page => 10
		@remote = {:update => 'guilds', :url => search_guild_events_url(@guild, :key => params[:key])}
		render :partial => 'event/event_items', :object => @events
	end

protected

  def setup
    @guild = Guild.find(params[:guild_id])
  rescue
    not_found
  end

end
