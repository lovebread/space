class User::RequestsController < UserBaseController

	layout 'app'

	def index
		@requests = []
    if params[:type].blank?
      @requests.concat current_user.event_requests
      @requests.concat current_user.friend_requests
      @requests.concat current_user.guild_requests
      @requests = @requests.paginate :page => params[:page], :per_page => 10
    elsif params[:type].to_i == 1
      @requests = current_user.friend_requests.paginate :page => params[:page], :per_page => 10
    elsif params[:type].to_i == 2
      @requests = current_user.event_requests.paginate :page => params[:page], :per_page => 10
    elsif params[:type].to_i == 3
      @requests = current_user.guild_requests.paginate :page => params[:page], :per_page => 10
    end
	end

protected

	def setup
		@user = current_user
	end

end
