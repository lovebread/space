class User::Avatars::AlbumsController < UserBaseController

  layout 'app'

  before_filter :friend_or_owner_required

  def show
    @photos = @album.photos.paginate :page => params[:page], :per_page => 16
    @comments = @album.comments
  end

protected

  def setup
    @album = AvatarAlbum.find(params[:id])
    @user = @album.user
		@reply_to = User.find(params[:reply_to]) if params[:reply_to]
  rescue
    not_found
  end

end
