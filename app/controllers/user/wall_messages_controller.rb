class User::WallMessagesController < UserBaseController

  before_filter :deleteable_required, :only => [:destroy]

  before_filter :privilege_required, :only => [:index]

  def create
    @message = Comment.new((params[:comment] || {}).merge({:poster_id => current_user.id}))
    unless @message.save
      render :update do |page|
        page << "error('#{@message.errors.on_base}');"
      end
    end
  end

  def destroy
    if @message.destroy
      render :update do |page|
        page << "facebox.close();Effect.BlindUp($('comment_#{@message.id}'));"
      end
    else
      render :update do |page|
        page << "error('发生错误');"
      end
    end
  end

  def index
    @messages = @wall.comments.paginate :page => params[:page], :per_page => 10
    @remote = {:update => 'comments', :url => {:controller => 'user/wall_messages', :action => 'index', :wall_id => params[:wall_id], :wall_type => params[:wall_type]}}
    render :partial => 'wall_messages', :locals => {:messages => @messages}    
  end

protected

  def setup
    if ['index'].include? params[:action]
      @wall = params[:wall_type].camelize.constantize.find(params[:wall_id])
    elsif ['destroy'].include? params[:action]
      @message = Comment.find(params[:id])
    end
  rescue
    not_found
  end

  def deleteable_required
    @message.is_deleteable_by?(current_user) || not_found
  end

  def privilege_required
    @wall.is_comment_viewable_by?(current_user) || not_found
  end

end
