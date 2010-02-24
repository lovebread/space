class User::PrivacySettingController < UserBaseController

  layout 'app'

  before_filter :catch_setting

  def show
  end

  def edit
    case params[:type].to_i
    when 0
      render :action => "profile_privacy"
    when 1
      render :action => "going_privacy"
    when 2
      render :action => "outside_privacy"
    when 3
      render :action => "qq_privacy", :layout => false
    when 4
      render :action => "phone_privacy", :layout => false
    when 5
      render :action => "website_privacy", :layout => false
    end
  end

  def update
    if @setting.update_attributes(params[:setting])
      respond_to do |format|
        format.js {
          render :update do |page|
            page << "facebox.close();"
          end
        }
        format.html {  
          flash[:notice] = "设置保存成功"
			    case params[:type].to_i
			    when 0
				    redirect_to edit_privacy_setting_url(:type => 0)
			    when 1
				    redirect_to edit_privacy_setting_url(:type => 1)
			    when 2	
				    redirect_to edit_privacy_setting_url(:type => 2)
			    end
        }
      end
    end
  end

protected

  def catch_setting
    @setting = current_user.privacy_setting
  end

end
