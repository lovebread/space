class User::InvitationsController < UserBaseController

  layout 'app'

  def index
    @invitations = []
		if params[:type].blank?
			@invitations.concat current_user.event_invitations
			@invitations.concat current_user.poll_invitations
			@invitations.concat current_user.guild_invitations
			@invitations = @invitations.paginate :page => params[:page], :per_page => 10
		elsif params[:type].to_i == 1
			@invitations = current_user.poll_invitations.paginate :page => params[:page], :per_page => 10
		elsif params[:type].to_i == 2
			@invitations = current_user.event_invitations.paginate :page => params[:page], :per_page => 10
		elsif params[:type].to_i == 3
			@invitations = current_user.guild_invitations.paginate :page => params[:page], :per_page => 10
		end	
  end

protected

  def setup
    @user = current_user
  end

end
