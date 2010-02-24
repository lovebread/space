class User::PhotosController < UserBaseController

  layout 'app'

  before_filter :privilege_required, :only => [:show]

	before_filter :friend_or_owner_required, :only => [:relative]

	def hot
		cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @photos = Photo.hot.find(:all, :conditions => cond).paginate :page => params[:page], :per_page => 10
  end

  def relative
		cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @photos = @user.relative_photos.find(:all, :conditions => cond).paginate :page => params[:page], :per_page => 10
  end

  def new
  end

  def show
    @comments = @photo.comments
    @tags = @photo.tags.to_json :only => [:id, :width, :height, :x, :y, :content], :include => {:tagged_user => {:only => [:login, :id]}, :poster => {:only => [:login, :id]}}
  end

	def create
    @photo = @album.photos.build(:swf_uploaded_data => params[:Filedata])
    if @photo.save
			render :text => @photo.id	
		end
	end

  def record_upload
		if @album.record_upload current_user, @photos
      render :update do |page|
        page.redirect_to edit_multiple_personal_photos_url(:album_id => @album.id, :ids => @photos.map {|p| p.id})
      end
    else
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end 

  def edit
    render :action => 'edit', :layout => false
  end

  def update
    @album.update_attribute('cover_id', @photo.id) if params[:cover]
    if @photo.update_attributes(params[:photo])
			respond_to do |format|
				format.json { render :text => @photo.notation }
				format.html {
					render :update do |page|
						if @photo.album_id_changed?
						  page.redirect_to personal_photo_url(@photo)
						else
						  page << "facebox.close();"
							page << "if($('personal_photo_notation_#{@photo.id}'))$('personal_photo_notation_#{@photo.id}').innerHTML = '#{@photo.notation}';"
						end
					end
				}
			end 
    else
      # TODO
    end
  end

  def edit_multiple
  end

  def update_multiple
    @album.update_attribute('cover_id', params[:cover_id]) if params[:cover_id]
    @photos.each {|photo| photo.update_attributes(params[:photos]["#{photo.id}"]) }
    redirect_to personal_album_url(@album) 
  end

  def destroy
    if @photo.destroy
      render :update do |page|
        page.redirect_to personal_album_url(@album)
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
      @photo = PersonalPhoto.find(params[:id])
      @album = @photo.album
      @user = @album.user
			@privilege = @album.privilege
			@reply_to = User.find(params[:reply_to]) if params[:reply_to]
    elsif ['new', 'create'].include? params[:action]
      @album = current_user.albums.find(params[:album_id])
    elsif ['record_upload', 'edit_multiple'].include? params[:action]
      @album = current_user.albums.find(params[:album_id])
      @photos = params[:ids].blank? ? [] : @album.photos.find(params[:ids])
    elsif ['update_multiple'].include? params[:action]
      @album = current_user.albums.find(params[:album_id])
      @photos = params[:photos].blank? ? [] : @album.photos.find(params[:photos].map {|id, attribute| id})
		elsif ['hot', 'relative'].include? params[:action]
			@user = User.find(params[:id])
    elsif ['edit', 'update', 'destroy'].include? params[:action]
      @photo = PersonalPhoto.find(params[:id])
      @album = current_user.albums.find(@photo.album_id) 
    end
  rescue
    not_found
  end

end
