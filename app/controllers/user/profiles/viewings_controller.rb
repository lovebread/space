class User::Profiles::ViewingsController < UserBaseController

  def index
    @viewings = @profile.viewings.paginate :page => params[:page], :per_page => 10
    @remote = {:update => 'visitor_records', :url => {:action => 'index'}}
  end

protected

  def setup
    @profile = Profile.find(params[:profile_id])
  rescue
    not_found
  end

end
