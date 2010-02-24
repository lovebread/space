class User::DraftsController < UserBaseController

  layout 'app'

  def index
    @blogs = current_user.drafts.paginate :page => params[:page], :per_page => 15
  end

  def create
    @blog = Blog.new((params[:blog] || {}).merge({:poster_id => current_user.id, :draft => true}))
    if @blog.save
      render :update do |page|
        page.redirect_to edit_draft_url(@blog)
      end
    else
      render :update do |page|
        page.replace_html :errors, :partial => 'blog/validation_errors'
      end
    end
  end

  def edit
  end

  def update
    if @blog.update_attributes((params[:blog] || {}).merge({:poster_id => current_user.id, :draft => true}))
      render :json => {:draft_id => @blog.id, :tags => @blog.tags.map{|t| {:id => t.id, :friend_login => t.tagged_user.login, :friend_id => t.tagged_user_id}}}
    else
      render :update do |page|
        page.replace_html 'errors', :partial => 'blog/validation_errors'
      end
    end
  end

  def destroy
		if @blog.destroy
      render :update do |page|
        page.redirect_to drafts_url
      end
    else
      render :update do |page|
        page << "error('删除的时候发生错误');"
      end
    end
  end

protected
  
  def setup
    if ['edit', 'update', 'destroy'].include? params[:action]
      @blog = current_user.drafts.find(params[:id])
    end
  rescue
    not_found
  end

end
