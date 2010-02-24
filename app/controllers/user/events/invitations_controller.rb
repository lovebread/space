class User::Events::InvitationsController < UserBaseController

  layout 'app'

  def new
    @characters = current_user.friend_characters(:game_id => @event.game_id, :area_id => @event.game_area_id, :server_id => @event.game_server_id) - @event.all_characters
  end

  def create
    if @event.update_attributes(:invitations => params[:invitations])
      redirect_to event_url(@event)
    else
      render :action => 'new'
    end
  end

  def edit
    render :action => 'edit', :layout => false
  end

  def accept
    unless @invitation.update_attributes(:status => Participation::Confirmed)
      render :update do |page|
        page << "error('发生错误')"
      end
    end
  end

  def decline
    unless @invitation.destroy
      render :update do |page|
        page << "error('发生错误');"
      end
    end  
  end

  def search
    @characters = current_user.friend_characters(:game_id => @event.game_id, :area_id => @event.game_area_id, :server_id => @event.game_server_id) - @event.all_characters
    @characters = @characters.find_all {|f| f.name.include?(params[:key])}
    render :partial => 'characters'
  end

protected

  def setup
    if ['new', 'create', 'search'].include? params[:action]
      @event = current_user.events.find(params[:event_id])
    elsif ['edit', 'accept', 'decline'].include? params[:action]
      @invitation = current_user.event_invitations.find(params[:id])
      @event = @invitation.event
    end
  rescue
    not_found
  end

end
