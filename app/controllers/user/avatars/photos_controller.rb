class User::Avatars::PhotosController < UserBaseController

  layout 'app'

  before_filter :friend_or_owner_required, :only => [:show]

  def show
    @comments = @photo.comments
    @tags = @photo.tags.to_json :only => [:id, :width, :height, :x, :y, :content], :include => {:tagged_user => {:only => [:login, :id]}, :poster => {:only => [:login, :id]}}
  end

  def new
    render :action => 'new', :layout => false
  end

  def edit
    render :action => 'edit', :layout => false
  end

  def create
    @photo = @album.photos.build(params[:photo])
    if @photo.save
			responds_to_parent do
        render :update do |page|
          page << "facebox.close()"
          if params[:album].to_i == 1
            page.redirect_to avatar_album_url(@album)
          else
						@album.reload
            page.replace_html 'avatar', album_cover(@album, :size => :large)
          end
        end
      end
    else
      responds_to_parent do
        render :update do |page|
          page << "$('error').innerHTML = 'There was an error uploading this icon"
        end
      end
    end
  end

  def set
    unless @album.set_cover @photo
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end

  def update
    if @photo.update_attributes(params[:photo])
			respond_to do |format|
				format.json { render :text => @photo.notation }
				format.html {
					render :update do |page|
						page << "facebox.close();"
						page << "if($('avatar_notation_#{@photo.id}'))$('avatar_notation_#{@photo.id}').innerHTML = '#{@photo.notation}';"
					end
				}
			end
    else
      flash.now[:error] = "There was an error updating this icon"
      render :action => 'edit'
    end
  end

  def destroy
    if @photo.destroy
      render :update do |page|
        page.redirect_to avatar_album_url(@album)
      end
    else
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end

protected

  def setup
    if ['show'].include? params[:action]
      @photo = Avatar.find(params[:id])
      @album = @photo.album
      @user = @album.user
			@reply_to = User.find(params[:reply_to]) unless params[:reply_to].blank?
    elsif ['edit', 'set', 'update', 'destroy', 'update_notation'].include? params[:action]
      @album = current_user.avatar_album
      @photo = @album.photos.find(params[:id])
    elsif ['new', 'create'].include? params[:action]
      @album = current_user.avatar_album
    end
  rescue
    not_found 
  end
	
end

