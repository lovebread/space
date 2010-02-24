class User::SharingsController < UserBaseController

  layout 'app'

  before_filter :link_required, :only => [:show]

  def index
    case params[:type].to_i
    when 0
      @sharings = @user.sharings.paginate :page => params[:page], :per_page => 20
    when 1
      @sharings = @user.blog_sharings.paginate :page => params[:page], :per_page => 20
    when 2
      @sharings = @user.video_sharings.paginate :page => params[:page], :per_page => 20
    when 3
      @sharings = @user.link_sharings.paginate :page => params[:page], :per_page => 20
    when 4
      @sharings = @user.photo_sharings.paginate :page => params[:page], :per_page => 20
    when 5
      @sharings = @user.album_sharings.paginate :page => params[:page], :per_page => 20
    when 6
      @sharings = @user.poll_sharings.paginate :page => params[:page], :per_page => 20
    when 7
      @sharings = @user.game_sharings.paginate :page => params[:page], :per_page => 20
    when 8
      @sharings = @user.profile_sharings.paginate :page => params[:page], :per_page => 20
    end
  end

  def hot
    case params[:type].to_i
    when 0
      @sharings = Sharing.hot.paginate :page => params[:page], :per_page => 20
    when 1
      @sharings = Sharing.hot.find(:all, :conditions => {:shareable_type => 'Blog'}).paginate :page => params[:page], :per_page => 20
    when 2
      @sharings = Sharing.hot.find(:all, :conditions => {:shareable_type => 'Video'}).paginate :page => params[:page], :per_page => 20
    when 3
      @sharings = Sharing.hot.find(:all, :conditions => {:shareable_type => 'Link'}).paginate :page => params[:page], :per_page => 20
    when 4
      @sharings = Sharing.hot.find(:all, :conditions => {:shareable_type => 'Photo'}).paginate :page => params[:page], :per_page => 20
    when 5
      @sharings = Sharing.hot.find(:all, :conditions => {:shareable_type => 'Album'}).paginate :page => params[:page], :per_page => 20
    when 6
      @sharings = Sharing.hot.find(:all, :conditions => {:shareable_type => 'Poll'}).paginate :page => params[:page], :per_page => 20
    when 7
      @sharings = Sharing.hot.find(:all, :conditions => {:shareable_type => 'Game'}).paginate :page => params[:page], :per_page => 20
    when 8
      @sharings = Sharing.hot.find(:all, :conditions => {:shareable_type => 'Profile'}).paginate :page => params[:page], :per_page => 20
    end
  end

  def recent
    case params[:type].to_i
    when 0
      @sharings = Sharing.recent.paginate :page => params[:page], :per_page => 20
    when 1
      @sharings = Sharing.recent.find(:all, :conditions => {:shareable_type => 'Blog'}).paginate :page => params[:page], :per_page => 20
    when 2
      @sharings = Sharing.recent.find(:all, :conditions => {:shareable_type => 'Video'}).paginate :page => params[:page], :per_page => 20
    when 3
      @sharings = Sharing.recent.find(:all, :conditions => {:shareable_type => 'Link'}).paginate :page => params[:page], :per_page => 20
    when 4
      @sharings = Sharing.recent.find(:all, :conditions => {:shareable_type => 'Photo'}).paginate :page => params[:page], :per_page => 20
    when 5
      @sharings = Sharing.recent.find(:all, :conditions => {:shareable_type => 'Album'}).paginate :page => params[:page], :per_page => 20
    when 6
      @sharings = Sharing.recent.find(:all, :conditions => {:shareable_type => 'Poll'}).paginate :page => params[:page], :per_page => 20
    when 7
      @sharings = Sharing.recent.find(:all, :conditions => {:shareable_type => 'Game'}).paginate :page => params[:page], :per_page => 20
    when 8
      @sharings = Sharing.recent.find(:all, :conditions => {:shareable_type => 'Profile'}).paginate :page => params[:page], :per_page => 20
    end
  end

  def friends
    case params[:type].to_i
    when 0
      @sharings = current_user.sharing_feed_items.map(&:originator).paginate :page => params[:page], :per_page => 20
    when 1
      @sharings = current_user.sharing_feed_items.find_all{|i| i.data[:type] == 'Blog'}.map(&:originator).paginate :page => params[:page], :per_page => 20
    when 2
      @sharings = current_user.sharing_feed_items.find_all{|i| i.data[:type] == 'Video'}.map(&:originator).paginate :page => params[:page], :per_page => 20
    when 3
      @sharings = current_user.sharing_feed_items.find_all{|i| i.data[:type] == 'Link'}.map(&:originator).paginate :page => params[:page], :per_page => 20
    when 4
      @sharings = current_user.sharing_feed_items.find_all{|i| i.data[:type] == 'Photo'}.map(&:originator).paginate :page => params[:page], :per_page => 20
    when 5
      @sharings = current_user.sharing_feed_items.find_all{|i| i.data[:type] == 'Album'}.map(&:originator).paginate :page => params[:page], :per_page => 20
    when 6
      @sharings = current_user.sharing_feed_items.find_all{|i| i.data[:type] == 'Poll'}.map(&:originator).paginate :page => params[:page], :per_page => 20
    when 7
      @sharings = current_user.sharing_feed_items.find_all{|i| i.data[:type] == 'Game'}.map(&:originator).paginate :page => params[:page], :per_page => 20
    when 7
      @sharings = current_user.sharing_feed_items.find_all{|i| i.data[:type] == 'Profile'}.map(&:originator).paginate :page => params[:page], :per_page => 20
    end
  end

  def new
    @sharing = Sharing.new(:title => get_default_title(@shareable))
    render :action => 'new', :layout => false
  end

  def create
    @sharing = @shareable.sharings.build(params[:sharing].merge({:poster_id => current_user.id}))
    if @sharing.save
      render :update do |page|
        if @sharing.shareable_type == 'Link'
          page.redirect_to sharings_url(:id => current_user.id)
        else
          page << "notice('分享成功');"
        end
      end
    else
      render :update do |page|
        if @sharing.shareable_type == 'Link'
          page << "error('保存过程中发生错误');"
        else
          page << "error('你已经分享过了，该资源你只能分享一次');"
        end
      end
    end
  end

  # show only works for link
  # for blog,video, photo, album, the page will be reidrected to blog_url, video_url... etc
  def show
    render :action => 'show', :layout => false
  end

protected

  def setup
    if ["new"].include? params[:action]
      if params[:shareable_type] == 'Link'
        @shareable = Link.new(params[:link])
      else
        @shareable = params[:shareable_type].camelize.constantize.find(params[:shareable_id])
      end
    elsif ["create"].include? params[:action]
      if params[:shareable_type] == 'Link'
        @shareable = Link.create(params[:link])
      else
        @shareable = params[:shareable_type].camelize.constantize.find(params[:shareable_id])
      end
    elsif ["index"].include? params[:action]
      @user = User.find(params[:id])
    elsif ["show"].include? params[:action]
      @sharing = Sharing.find(params[:id])
      @shareable = @sharing.shareable
      # this must be a link
    end
  rescue
    not_found
  end

  def link_required
    @sharing.shareable_type == 'Link' || not_found
  end

  def get_default_title shareable
    case shareable.class.name
    when 'Blog'
      shareable.title
    when 'Video'
      shareable.title
    when 'Link'
      shareable.url
    when 'Poll'
      shareable.name
    when 'PersonalAlbum'
      shareable.title
    when 'AvatarAlbum'
      shareable.title
    when 'GuildAlbum'
      shareable.title
    when 'EventAlbum'
      shareable.title
    when 'PersonalPhoto'
      shareable.notation
    when 'AvatarPhoto'
      shareable.notation
    when 'GuildPhoto'
      shareable.notation
    when 'EventPhoto'
      shareable.notation
    when 'Game'
      shareable.name
    when 'Profile'
      shareable.login
    end
  end

end
