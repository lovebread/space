class User::Guilds::RequestsController < UserBaseController

  layout 'app'

  def new
    @characters = current_user.characters.find(:all, :conditions => {:game_id => @guild.game_id, :area_id => @guild.game_area_id, :server_id => @guild.game_server_id})
    render :action => 'new', :layout => false
  end

  def create
    request_params = (params[:request] || {}).merge({:user_id => current_user.id})
    @request = @guild.requests.build request_params
    unless @request.save
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end

  def accept
    if @request.update_attributes(:status => Membership::Member)
      render :update do |page|
        page << "alert('成功'); $('guild_request_option_#{@request.id}').innerHTML = '已接受';"
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
        page << "$('guild_request_#{@request.id}').remove();"
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
      @guild = Guild.find(params[:guild_id])
      @user = @guild.president
    elsif ['accept', 'decline'].include? params[:action]
      @guild = current_user.guilds.find(params[:guild_id])
      @request = @guild.requests.find(params[:id])
    end
  rescue
    not_found
  end

end

