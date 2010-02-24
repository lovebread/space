class User::ApplicationsController < UserBaseController

  layout 'app'

  def show
  end

protected

  def setup
    @application = Application.find(params[:id])
  rescue
    not_found
  end

end
