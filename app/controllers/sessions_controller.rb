class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if !@user.nil? and !@user.active?
      redirect_to :controller => 'users', :action => 'activation_mail_sent', :email => @user.email, :show => 1
      return
    end
    self.current_user = User.authenticate(params[:email], params[:password])
    if current_user == nil
      flash.now[:error] = "用户名密码不正确"
      render :action => 'new'
    elsif current_user.enabled == false
      flash.now[:error] = "你的帐号被删除了"
      render :action => 'new'
    else
      if params[:remember_me] == "1"
        current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      redirect_back_or_default(profile_url(current_user.profile))
      flash[:notice] = "成功登录"
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "成功登出"
    redirect_to login_url
  end

end
