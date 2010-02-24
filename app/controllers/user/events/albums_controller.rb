class User::Events::AlbumsController < UserBaseController

  layout 'app'

  before_filter :owner_required, :only => [:update]

  def show
    @participation = @event.participations.find_by_participant_id(current_user.id)
    @comments = @album.comments
    @photos = @album.photos.paginate :page => params[:page], :per_page => 12
  end

	def update
		if @album.update_attributes((params[:album] || {}).merge({:owner_id => @event.id}))
			respond_to do |format|
				format.json { render :text => @album.description }
			end
		else
      render :update do |page|
        page << "error('发生错误');"
      end
    end
	end

protected

  def setup
		@album = EventAlbum.find(params[:id])
    @event = @album.event
		@user = @event.poster
  rescue
    not_found
  end

end
