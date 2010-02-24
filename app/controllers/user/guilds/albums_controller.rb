class User::Guilds::AlbumsController < UserBaseController

  layout 'app'

  before_filter :owner_required, :only => ["update"]

  def show
    @membership = @guild.memberships.find_by_user_id(current_user.id)
    @comments = @album.comments
    @photos = @album.photos.paginate :page => params[:page], :per_page => 12
  end

  def update
    if @album.update_attributes((params[:album] || {}).merge({:owner_id => @guild.id}))
			respond_to do |format|
				format.json { render :text => @album.description}
			end
    end
  end

protected

  def setup
    @album = GuildAlbum.find(params[:id])
    @guild = @album.guild
    @user = @guild.president
		#@reply_to = User.find(params[:reply_to]) if params[:reply_to]
  rescue
    not_found
  end

end
