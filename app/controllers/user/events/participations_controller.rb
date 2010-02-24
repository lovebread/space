class User::Events::ParticipationsController < UserBaseController

  layout 'app'

  def index
    case params[:type].to_i
    when 0
      @participations = @event.confirmed_participations
    when 1
      @participations = @event.maybe_participations
		when 2
			@participations = @event.invitations
		when 3
			@participations = @event.requests
    end
  end

  def edit
    render :action => 'edit', :layout => false
  end

  def update
    unless @participation.update_attributes(:status => params[:status])
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end

  def destroy
    if @participation.destroy
      render :update do |page|
        page << "$('participation_#{@participation.id}').remove();"
      end
    else
      render :update do |page|
        page << "error('发生错误');"
      end
    end 
  end
  
protected

  def setup
    if ["index"].include? params[:action]
      @event = Event.find(params[:event_id])
      @user = @event.poster
    elsif ["edit", "update"].include? params[:action]
      @participation = current_user.participations.find(params[:id])
      @event = @participation.event
      #@event = Event.find(params[:event_id])
      #@user = @event.poster
      #@participation = @event.participations.find(params[:id], :conditions => {:status => [3,4,5]})
    end
  rescue
    not_found
  end

end
