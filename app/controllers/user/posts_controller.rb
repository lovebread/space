class User::PostsController < UserBaseController

  layout 'forum'

  before_filter :moderator_required, :only => [:destroy]

  def index
    @posts = @topic.posts.paginate :page => params[:page], :per_page => 10
  end

  def create
    @post = @topic.posts.build(params[:post].merge({:poster_id => current_user.id, :forum_id => @forum.id}))
    if @post.save
      redirect_to forum_topic_posts_url(@forum, @topic, :page => (@topic.posts_count + 1)/10 + 1)     
    else
      flash[:error] = '保存出错'
      redirect_to forum_topic_posts_url(@forum, @topic)
    end
  end

  def destroy
    @post.destroy
    render :update do |page|
      page << "$('post_#{@post.id}').remove();alert('成功')"
    end 
  end

protected
 
	def setup
		if ["index", "create"].include? params[:action]
			@forum = Forum.find(params[:forum_id])
			@topic = @forum.topics.find(params[:topic_id])
		elsif ["destroy"].include? params[:action]
			@forum = Forum.find(params[:forum_id])
      @topic = @forum.topics.find(params[:topic_id])
			@post = @topic.posts.find(params[:id])
		end
		@is_moderator = @forum.moderators.include? current_user
	rescue
		not_found
	end

  def moderator_required
    @is_moderator || not_found
  end


end
