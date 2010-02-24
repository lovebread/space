class User::Events::RequestsController < UserBaseController

  layout 'app'

  def new
    @characters = current_user.characters.find(:all, :conditions => {:game_id => @event.game_id, :area_id => @event.game_area_id, :server_id => @event.game_server_id}) - @event.characters_for(current_user)
    render :action => 'new', :layout => false
  end

  def create
    request_params = (params[:request] || {}).merge({:participant_id => current_user.id})
    @request = @event.requests.build request_params
    unless @request.save
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end

  def accept
    if @request.accept
      render :update do |page|
        page << "$('event_request_operation_#{@request.id}').innerHTML = '已成功接受';"
      end
    else
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end

  def decline
    if @request.destroy
      render :update do |page|
        page << "$('event_request_option_#{@request.id}').innerHTML = '已拒绝';"
      end
    else
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end

protected

  def setup
    if ['new', 'create'].include? params[:action]
      @event = Event.find(params[:event_id])
      @user = @event.poster
    elsif ['accept', 'decline'].include? params[:action]
      @event = current_user.events.find(params[:event_id])
      @request = @event.requests.find(params[:id])
    end
  rescue
    not_found
  end

end

