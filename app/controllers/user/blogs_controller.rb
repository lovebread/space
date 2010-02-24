class User::BlogsController < UserBaseController

  layout 'app'

  increment_viewing 'blog', :only => [:show]

  before_filter :friend_or_owner_required, :only => [:index, :relative]

  before_filter :privilege_required, :only => [:show]

  def index
		cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @blogs = @user.blogs.viewable(relationship, :conditions => cond).paginate :page => params[:page], :per_page => 10 
  end

	def hot 
    cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @blogs = Blog.hot.find(:all, :conditions => cond).paginate :page => params[:page], :per_page => 10
  end

  def recent
    cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @blogs = Blog.recent.find(:all, :conditions => cond).paginate :page => params[:page], :per_page => 10
  end

  def relative
    cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @blogs = @user.relative_blogs.find(:all, :conditions => cond).paginate :page => params[:page], :per_page => 10
  end

  def friends
    @blogs = current_user.blog_feed_items.map(&:originator).paginate :page => params[:page], :per_page => 10
  end

  def show
    @comments = @blog.comments
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new((params[:blog] || {}).merge({:poster_id => current_user.id, :draft => false}))
    if @blog.save
      render :update do |page|
        page.redirect_to blog_url(@blog)
      end
    else
      render :update do |page|
        page.replace_html 'errors', :partial => 'user/blogs/validation_errors'
      end
    end
  end

  def edit
  end

  def update
    if @blog.update_attributes((params[:blog] || {}).merge({:poster_id => current_user.id, :draft => false}))
      render :update do |page|
        page.redirect_to blog_url(@blog)
      end
    else
      render :update do |page|
        page.replace_html 'errors', :partial => 'user/blogs/validation_errors'
      end
    end
  end

  def destroy
    if @blog.destroy
			render :update do |page|
				page.redirect_to blogs_url(:id => current_user.id)
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
      @blog = Blog.find(params[:id])
      @user = @blog.poster
			@privilege = @blog.privilege
			@reply_to = User.find(params[:reply_to]) if params[:reply_to]
    elsif ['edit', 'destroy'].include? params[:action]
      @blog = current_user.blogs.find(params[:id])
    elsif ['update'].include? params[:action]
      @blog = current_user.blogs_and_drafts.find(params[:id])
    end
  rescue
    not_found
  end

end
