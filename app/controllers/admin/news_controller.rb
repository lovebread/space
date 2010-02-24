class Admin::NewsController < AdminBaseController
  def new
    @news = News.new
  end

  def index
    @news_list = News.find(:all, :order => "created_at DESC").paginate :page => params[:page], :per_page => 10
  end

  def create
    @news = News.new((params[:news] || {}).merge({:poster_id => current_user.id}))
    if @news.save
      render :update do |page|
        page.redirect_to :action => :index
      end
    else
      render :update do |page|
        page << "error(@news.errors.on_base);"
      end
    end
  end

  def edit
  end

  def update
    if @news.update_attributes((params[:news] || {}).merge({:poster_id => current_user.id}))
      render :update do |page|
        page.redirect_to :action => :index
      end
    else
      page << "error(@news.errors.on_base)"
    end
  end

  def destroy
    if @news.destroy
      redirect_to :action => :index
    else
      page << "error('删除新闻出错')"
    end
  end

  protected
  def setup
    if ['edit','update', 'destroy'].include? params[:action]
      @news = News.find(params[:id])
    end
  rescue
    not_found
  end
end
