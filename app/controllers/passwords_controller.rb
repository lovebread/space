class PasswordsController < ApplicationController

  layout 'root'

  before_filter :logout_required

  def new
  end

  def create
    if session[:validation_text] == params[:validation_text]
      @user = User.find_by_email(params[:email])
      if @user.nil?
        flash.now[:notice] = "该邮箱没有注册我们网站"
        render :action => 'new'
      elsif !@user.active?
        redirect_to :controller => 'users', :action => 'activation_mail_sent', :show => 1, :email => @user.email
      else
        @user.forgot_password
        @user.save
        flash[:notice] = "一封重置密码的邮件已经发到你的邮箱里了"
        redirect_to login_path
      end
    else
      flash.now[:notice] = "验证码错误"
      render :action => 'new' 
    end
  end

  def edit
    if params[:password_reset_code].blank?
      flash.now[:error] = "非法的重置码"
      render :action => 'new'
      return
    end
    @user = User.find_by_password_reset_code(params[:password_reset_code]) if params[:password_reset_code]
    if @user.blank?
      flash.now[:error] = "非法的重置码"
      render login_path
    end   
  end

  def update
    if params[:password_reset_code].blank?
      flash.now[:error] = "非法的重置码"
      render :action => 'edit'
      return
    end
    if params[:password].blank?
      flash.now[:error] = "密码不能为空"
      render :action => 'edit', :password_reset_code => params[:password_reset_code]
      return
    end
    @user = User.find_by_password_reset_code(params[:password_reset_code])
    if @user.blank?
      flash.now[:error] = "非法的重置码"
      render :action => 'edit', :password_reset_code => params[:password_reset_code]
    else
      if params[:password] == params[:password_confirmation]
        @user.password_confirmation = params[:password_confirmation]
        @user.password = params[:password]
        @user.reset_password
        if @user.save
          flash[:notice] = "密码已经重置"
          render '/login'
        else
          flash[:notice] = "发生错误"
          render :action => 'edit', :password_reset_code => params[:password_reset_code]
        end
      else
        flash.now[:notice] = "2此密码不匹配"
        render :action => 'edit', :password_reset_code => params[:password_reset_code]
        return
      end
    end
  end

end
