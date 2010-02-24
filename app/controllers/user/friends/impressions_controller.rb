class User::Friends::ImpressionsController < UserBaseController

  layout 'app'

  def index
    @friends = current_user.friends.paginate :page => params[:page], :per_page => 10, :order => 'login ASC'
  end

end
