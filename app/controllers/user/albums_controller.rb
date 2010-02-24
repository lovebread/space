class User::AlbumsController < UserBaseController

  layout 'app'

  before_filter :friend_or_owner_required, :only => [:index]

  before_filter :privilege_required, :only => [:show]

  def index
		cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @albums = @user.albums.viewable(relationship, :conditions => cond).push @user.avatar_album
		@albums = @albums.paginate :page => params[:page], :per_page => 10
  end

	def recent
		cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @albums = PersonalAlbum.recent.find(:all, :conditions => cond).paginate :page => params[:page], :per_page => 5
  end

  def friends
    @albums = current_user.personal_album_feed_items.map(&:originator).uniq.paginate :page => params[:page], :per_page => 10 
  end

  def select
    @albums = current_user.albums
  end

  def show
		@comments = @album.comments
    @photos = @album.photos.paginate :page => params[:page], :per_page => 12 
  end

  def new
    @album = PersonalAlbum.new
    render :action => 'new', :layout => false
  end

  def create
    @album = current_user.albums.build(params[:album] || {})
    unless @album.save
      render :update do |page|
        page.replace_html 'errors', :partial => 'validation_errors'
      end
    end
  end

  def edit
    render :action => 'edit', :layout => false
  end

  def update
    if @album.update_attributes((params[:album] || {}).merge({:owner_id => current_user.id}))
			respond_to do |format|
        format.json { render :text => @album.description }
        format.html {    
					render :update do |page|
						page.alert '成功'
					end
				}
			end
    else
      render :update do |page|
        page.replace_html 'errors', :partial => 'validation_errors'
      end
    end
  end 

  def confirm_destroy
    render :action => 'confirm_destroy', :layout => false
  end

  def destroy
    if params[:migration] and params[:migration].to_i == 1 and !params[:album][:id].blank?
      Photo.update_all("album_id = #{params[:album][:id]}", "album_id = #{@album.id}")
      Album.update_all("photos_count = photos_count + #{@album.photos_count}", "id = #{params[:album][:id]}")
    end
    if @album.destroy
		  render :update do |page|
			  page.redirect_to personal_albums_url(:id => current_user.id)  
		  end
    else
      render :update do |page|
        page << "error('发生错误');"
      end
    end
	end

protected

  def setup
    if ["index", "recent"].include? params[:action]
      @user = User.find(params[:id])
    elsif ["show"].include? params[:action]
      @album = PersonalAlbum.find(params[:id])
      @user = @album.user
			@privilege = @album.privilege
      @reply_to = User.find(params[:reply_to]) unless params[:reply_to].blank?
    elsif ["edit", "update", "confirm_destroy", "destroy"].include? params[:action]
      @album = current_user.albums.find(params[:id])
    end
  rescue
    not_found
  end

end
