class User::NotificationsController < UserBaseController

  layout 'app'

  def index
    @notifications = current_user.notifications
    Notification.read_all current_user
  end

	def first_five
		@notifications = current_user.notifications.unread.find(:all, :limit => 5)
		Notification.read @notifications, current_user
    render :action => 'first_five', :layout => false
	end

  def destroy
    if @notification.destroy
      render :update do |page|
			  page << "$('notification_#{@notification.id}').remove();"
		  end
    else
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end

  def destroy_all
    Notification.destroy_all(:user_id => current_user.id)
    redirect_to notifications_url
  end

protected
        
  def setup
    if ["destroy"].include? params[:action]
      @notification = current_user.notifications.find(params[:id])
    end
  rescue
    not_found
  end

end
