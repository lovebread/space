class User::Polls::AnswersController < UserBaseController

  def new
  end
 
  def create
    if @poll.update_attributes(:answers => params[:poll][:answers])
      render :update do |page|
        page << "facebox.close();"
        page.redirect_to poll_url(@poll)
      end
    else
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end

protected

  def setup
    @poll = current_user.polls.find(params[:poll_id])
  rescue
    not_found
  end

end
