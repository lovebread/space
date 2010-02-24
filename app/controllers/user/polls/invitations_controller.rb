class User::Polls::InvitationsController < UserBaseController

  layout 'app'

  def new
    @friends = current_user.friends
		@user = current_user
  end

  def create_multiple
    params[:users].each { |user_id| @poll.invitations.create(:user_id => user_id) }
    redirect_to poll_url(@poll)
  end

	def destroy
		if @invitation.destroy
		  render :update do |page|
			  page.redirect_to poll_url(@poll)
		  end
    else
      render :update do |page|
        page << "error('发生错误');"
      end
    end
	end

	def search
		@friends = current_user.friends.search(params[:key])
		render :partial => 'friends'
	end

protected

	def setup
		if ['new', 'create_multiple'].include? params[:action]
			@poll = current_user.polls.find(params[:poll_id])
		elsif ['destroy'].include? params[:action]
      @invitation = current_user.poll_invitations.find(params[:id])
			@poll = @invitation.poll
      #@poll = Poll.find(params[:poll_id])
      #@user = @poll.poster
			#@invitation = @poll.invitations.find(params[:id])
		end
	rescue
		not_found
	end

end
