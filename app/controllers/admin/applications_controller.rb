class Admin::ApplicationsController < AdminBaseController

  def index
    @applications = Application.all  
  end

  def edit

  end

  def update
    if @application.update_attributes(params[:application])
      redirect_to admin_applications_url
    end
  end

protected

  def setup
    if ["edit", "update"].include? params[:action]
      @application = Application.find(params[:id])
    elsif ["index"].include? params[:action]
    end
  rescue
    not_found
  end

end
