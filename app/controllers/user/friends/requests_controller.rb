class User::Friends::RequestsController < UserBaseController

	def new
	end

  def create
    @request = Friendship.new((params[:request] || {}).merge({:user_id => current_user.id, :status => 0}))
    if @request.save
      render :update do |page|
        page << "tip('成功，请耐心等待回复');"
      end
    else
      render :update do |page|
        page << "error('发生错误');"
      end
    end  
  end

	def accept
		if @request.accept
			render :update do |page|
				page << "$('friend_request_option_#{@request.id}').innerHTML = '已接受';"
			end
		else
      render :update do |page|
        page << "error('发生错误')"
      end
    end		
	end

	def decline
		if @request.destroy
		  render :update do |page|
			  page << "$('friend_request_option_#{@request.id}').innerHTML = '已拒绝';"
		  end
    else
      render :update do |page|
        page << "error('发生错误');"
      end
    end 
	end

protected

	def setup
		if ["new"].include? params[:action]
			@recipient = User.find(params[:friend_id])
		elsif ["accept", "decline"].include? params[:action]
			@request = current_user.friend_requests.find(params[:id])
		end
	rescue
		not_found
	end

end
