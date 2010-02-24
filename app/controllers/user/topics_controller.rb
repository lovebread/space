class User::TopicsController < UserBaseController

  layout 'forum'

  before_filter :moderator_required, :only => [:destroy]

  def index
    @top_topics = @forum.topics.tops(:all)
    @topics = @forum.topics.normals(:all).paginate :page => params[:page], :per_page => 20
  end

  def show
    redirect_to forum_topic_posts_url(@forum, @topic)
  end

  def new
  end

  def create
    @topic = @forum.topics.build(params[:topic].merge({:poster_id => current_user.id}))
    if @topic.save
      redirect_to forum_topics_url(@forum)
    else
      render :action => 'new'
    end
  end

  def toggle
    @topic.update_attribute('top', params[:top].to_i)
    render :update do |page|
      page << "alert('成功');"
      page.redirect_to forum_topics_url(@forum) 
    end
  end

  def destroy
    @topic.destroy
    render :update do |page|
      page << "$('topic_#{@topic.id}').remove();alert('成功')"
    end
  end

protected

	def setup
		if ["index", "new", "create"].include? params[:action]
			@forum = Forum.find(params[:forum_id])
		elsif ["show", "toggle", "destroy"].include? params[:action]
			@forum = Forum.find(params[:forum_id])
			@topic = @forum.topics.find(params[:id])
		end
		@is_moderator = @forum.moderators.include? current_user
	rescue
		not_found
	end

  def moderator_required
    @is_moderator || not_found
  end

end
