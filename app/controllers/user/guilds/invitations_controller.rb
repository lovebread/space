class User::Guilds::InvitationsController < UserBaseController

  layout 'app'

  def new
    @characters = current_user.friend_characters(:game_id => @guild.game_id, :area_id => @guild.game_area_id, :server_id => @guild.game_server_id) - @guild.all_characters
  end

  def create
    if @guild.update_attributes(:invitations => params[:invitations])
      redirect_to guild_url(@guild)
    else
      render :action => 'new'
    end
  end

  def edit
    render :action => 'edit', :layout => false
  end

	def accept
		unless @invitation.update_attributes(:status => Membership::Member)
	    render :update do |page|
        page << "error('发生错误');"
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
    @characters = current_user.friend_characters(:game_id => @guild.game_id, :area_id => @guild.game_area_id, :server_id => @guild.game_server_id) - @guild.all_characters
    @characters = @characters.find_all {|f| f.name.include?(params[:key])}
    render :partial => 'characters'
  end

protected

  def setup
    if ['new', 'create', 'search'].include? params[:action]
      @guild = current_user.guilds.find(params[:guild_id])
    elsif ['edit', 'accept', 'decline'].include? params[:action]
      @invitation = current_user.guild_invitations.find(params[:id])
      @guild = @invitation.guild
    end
  rescue
    not_found
  end

end
