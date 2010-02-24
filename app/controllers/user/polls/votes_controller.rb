class User::Polls::VotesController < UserBaseController

  def create
		@vote = @poll.votes.build(:voter_id => current_user.id, :answer_ids => params[:votes])
		if @vote.save
      redirect_to poll_url(@poll)
		else
			flash[:error] = "保存的时候发生错误"
			redirect_to poll_url(@poll)
		end
  end

protected

  def setup
    @poll = Poll.find(params[:poll_id])
  rescue
    not_found
  end

end
