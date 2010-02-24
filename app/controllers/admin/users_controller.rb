class Admin::UsersController < AdminBaseController

  def index
    @users = User.activated.paginate :page => params[:page], :per_page => 20
  end

  def destroy
    if @user.destroy
      render :update do |page|
        page.redirect_to admin_users_url
      end
    else
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end

  def enable
    unless @user.update_attribute(:enabled, true)
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end

  def disable
    unless @user.update_attribute(:enabled, false)
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end

  def activate
    if @user and !@user.active?
      @user.activate
      redirect_to :action => 'index'
    end
  end 

  def search
    @users = User.search(params[:key]).paginate :page => params[:page], :per_page => 20
    @remote = {:update => 'users', :url => {:controller => 'admin/users', :action => 'search', :key => params[:key]}}
    render :partial => 'users', :object => @users
  end

protected

  def setup
    if ["destroy", "enable", "disable", "activate"].include? params[:action]
      @user = User.find(params[:id])
    end
  rescue
    not_found
  end

end
