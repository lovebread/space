class User::PollsController < UserBaseController

  layout 'app'

  before_filter :friend_or_owner_required, :only => [:index, :participated]

  def index
		cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @polls = @user.polls.find(:all, :conditions => cond).paginate :page => params[:page], :per_page => 10
  end

	def hot
		cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @polls = Poll.hot.find(:all, :conditions => cond).paginate :page => params[:page], :per_page => 10
	end

  def recent
		cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @polls = Poll.recent.find(:all, :conditions => cond).paginate :page => params[:page], :per_page => 10
	end

  def participated
		cond = params[:game_id].nil? ? {} : {:game_id => params[:game_id]}
    @polls = @user.participated_polls.find(:all, :conditions => cond).paginate :page => params[:page], :per_page => 10
  end

  def friends
    @polls = current_user.poll_feed_items.map(&:originator).paginate :page => params[:page], :per_page => 10
  end

  def show
		@vote = @poll.votes.find_by_voter_id(current_user.id)
    @vote_feeds = current_user.vote_feed_items.map(&:originator).find_all {|v| v.poll_id == @poll.id}
    @comments = @poll.comments
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new((params[:poll] || {}).merge({:poster_id => current_user.id}))
    if @poll.save
      redirect_to poll_url(@poll)
    else
      render :action => 'new'
    end
  end

  def edit
    if params[:type].to_i == 0
      render :action => 'edit_deadline', :layout => false
    else
      render :action => 'edit_summary', :layout => false
    end
  end

  def update
    if @poll.update_attributes((params[:poll] || {}).merge({:poster_id => current_user.id}))
      render :update do |page|
        page << "facebox.close();"
      end
    else
      render :update do |page|
        page << "error('错误');"
      end
    end 
  end

  def destroy
    if @poll.destroy
      render :update do |page|
        page << "facebox.close();"
        page.redirect_to polls_url(:id => current_user.id)
      end
    else
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end

protected

  def setup
    if ['index', 'participated'].include? params[:action]
      @user = User.find(params[:id])
    elsif ['show'].include? params[:action]
      @poll = Poll.find(params[:id])
      @user = @poll.poster
			@reply_to = User.find(params[:reply_to]) if params[:reply_to]
    elsif ['edit', 'update', 'destroy'].include? params[:action]
      @poll = current_user.polls.find(params[:id])
    end
  rescue
    not_found
  end

end
