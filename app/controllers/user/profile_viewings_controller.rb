class User::ProfileViewingsController < UserBaseController

  def index
    @viewings = current_user.profile.viewings.paginate :page => params[:page], :per_page => 10
    @remote = {:update => 'visitor_records', :url => {:action => 'index'}}
  end

end
