class User::VisitorRecordsController < UserBaseController

  def index
    @records = current_user.profile.visitor_records.paginate :page => params[:page], :per_page => 1
    @remote = {:update => 'visitor_records', :url => {:action => 'index'}}
  end

end
