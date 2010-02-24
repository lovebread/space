class User::CommentsController < UserBaseController

  # 我想不出怎么在before_destroy里优雅的做到这一点，那只能这样了
  before_filter :deleteable_required, :only => [:destroy]

  before_filter :privilege_required, :only => [:index]

  def create
    @comment = Comment.new((params[:comment] || {}).merge({:poster_id => current_user.id}))
    unless @comment.save
      render :update do |page|
        page << "error('#{@comment.errors.on_base}');"
      end
    end
  end

  def destroy
    if @comment.destroy
      render :update do |page|
        page << "facebox.close();Effect.BlindUp($('comment_#{@comment.id}'));"
      end
    else
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end

  def index
    @comments = @commentable.comments
    render :partial => 'comment', :collection => @comments
  end

protected

  def setup
    if ['index'].include? params[:action]
      @commentable = params[:commentable_type].camelize.constantize.find(params[:commentable_id])
    elsif ['destroy'].include? params[:action]
      @comment = Comment.find(params[:id])
    end
  rescue
    not_found
  end

  def deleteable_required
    @comment.is_deleteable_by?(current_user) || not_found
  end

  def privilege_required
    @commentable.is_comment_viewable_by?(current_user) || not_found
  end

end
