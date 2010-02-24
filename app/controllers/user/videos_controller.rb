class User::VideosController < UserBaseController

  layout 'app'

  before_filter :friend_or_owner_required, :only => [:index, :relative]

  before_filter :privilege_required, :only => [:show]

  def index
		cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @videos = @user.videos.viewable(relationship, :conditions => cond).paginate :page => params[:page], :per_page => 10
  end

	def hot
    cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @videos = Video.hot.find(:all, :conditions => cond).paginate :page => params[:page], :per_page => 5
  end

  def recent
    cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @videos = Video.recent.find(:all, :conditions => cond).paginate :page => params[:page], :per_page => 10
  end

  def relative
    cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @videos = @user.relative_videos.find(:all, :conditions => cond).paginate :page => params[:page], :per_page => 10
  end

  def friends
    @videos = current_user.video_feed_items.map(&:originator).paginate :page => params[:page], :per_page => 10 
  end

  def new
    @video = Video.new
  end

  def create
		@video = Video.new((params[:video] || {}).merge({:poster_id => current_user.id}))
    if @video.save
      redirect_to video_url(@video)
    else
      render :action => 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @video.update_attributes((params[:video] || {}).merge({:poster_id => current_user.id}))
		  redirect_to video_url(@video)
    else
      render :action => 'edit'
    end
  end

  def destroy
		if @video.destroy
			render :update do |page|
				page.redirect_to videos_url(:id => current_user.id)
			end
		else
			render :update do |page|
				page << "error('删除的时候发生错误');"
			end
		end
  end

protected

  def setup
    if ['index', 'hot', 'recent', 'relative'].include? params[:action]
      @user = User.find(params[:id])
    elsif ['show'].include? params[:action]
      @video = Video.find(params[:id])
      @user = @video.poster
			@privilege = @video.privilege
			@reply_to = User.find(params[:reply_to]) if params[:reply_to]
    elsif ['edit', 'update', 'destroy'].include? params[:action]
      @video = current_user.videos.find(params[:id])
    end  
  rescue
    not_found
  end

end
