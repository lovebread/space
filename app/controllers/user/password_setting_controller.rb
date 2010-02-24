class User::PasswordSettingController < UserBaseController

  layout 'app'

  def edit
  end

  def update
    @old_password = params[:old_password]
    @new_password = params[:new_password]
    @confirmation = params[:confirmation]
    # check old password
    if User.authenticate(current_user.email, @old_password)
      if @new_password != @confirmation
        flash.now[:error] = "2次输入的密码不一致"
        render :action => 'edit'
      else
        if session[:validation_text] != params[:validation_text]
          flash.now[:error] = "验证码错误"
          render :action => 'edit'
        else
          current_user.password = @new_password
          if current_user.save
            flash.now[:notice] = '成功修改密码'
            render :action => 'edit'
          else
            flash.now[:error] = '保存密码时发生错误，请稍后再试'
            render :action => 'edit'
          end
        end
      end
    else
      flash.now[:error] = "原来的密码不正确"
      render :action => 'edit'
    end
  end

end

