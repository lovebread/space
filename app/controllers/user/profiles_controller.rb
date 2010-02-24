class User::ProfilesController < UserBaseController

  layout 'app2'

  before_filter :privilege_required, :only => [:show, :more_feeds, :edit]

  increment_viewing 'profile', :only => [:show]

	FirstFetchSize = 5

	FetchSize = 5

  def show
		@blogs = @user.blogs[0..2]
		@albums = @user.active_albums[0..2]
		@feed_deliveries = @profile.feed_deliveries.find(:all, :limit => FirstFetchSize, :order => 'created_at DESC')
		@first_fetch_size = FirstFetchSize
	end

  def edit
    case params[:type].to_i
    when 0
      @games = Game.find(:all, :order => 'pinyin ASC')
			render :action => 'edit', :layout => 'app'
		when 1
      render :partial => 'edit_basic_info'
    when 2
      render :partial => 'edit_contact_info'
    when 3
      render :partial => 'edit_characters'
    end
  end

  def update
    if @profile.update_attributes(params[:profile])
			respond_to do |format|
				format.json { render :text => @profile.about_me }
				format.html {
					case params[:type].to_i
					when 1
					  render :partial => 'basic_info', :locals => {:profile => @profile}
					when 2
					  render :partial => 'contact_info', :locals => {:profile => @profile, :setting => @profile.user.privacy_setting}
          when 3
            render :partial => 'characters', :locals => {:profile => @profile}
					end
				}
			end
    end
  end

	def more_feeds
		@feed_deliveries = @profile.feed_deliveries.find(:all, :offset => FirstFetchSize + FetchSize * params[:idx].to_i, :limit => FetchSize, :order => 'created_at DESC')
		@fetch_size = FetchSize
	end

protected

  def setup
		if ["more_feeds", "show", "edit"].include? params[:action]
			@profile = Profile.find(params[:id])
			@user = @profile.user
			@setting = @user.privacy_setting
			@privilege = @setting.personal
			@reply_to = User.find(params[:reply_to]) unless params[:reply_to].blank?
    elsif ["update"].include? params[:action]
      @profile = Profile.find(params[:id])
		  @profile.user == current_user || (logger.error "not_found")
    end
  end

end
