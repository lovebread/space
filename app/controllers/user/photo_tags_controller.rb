class User::PhotoTagsController < UserBaseController

  # 怎么优雅的把delete的权限判断放到model里呢
  before_filter :deleteable_required, :only => [:destroy]

  def new
    case params[:type].to_i
    when 0
      @friends = current_user.friends
    when 1
      @friends = current_user.friends.find_all {|f| f.characters.map(&:game_id).include?(params[:game_id].to_i) }
    end
    render :partial => 'friend_table', :locals => {:friends => @friends}
  end

  def create
    @tag = PhotoTag.new((params[:tag] || {}).merge({:poster_id => current_user.id}))
    if @tag.save
			render :text => (@tag.to_json :only => [:id, :width, :height, :x, :y, :content], :include => {:poster => {:only => [:login, :id]}, :tagged_user => {:only => [:login, :id]}})
		else
      render :update do |page|
        page << "alert('#{@tag.errors.on_base}');"
      end
    end
  end

  def destroy
    if @tag.destroy
			render :nothing => true
    else
      render :update do |page|
        page << "alert('错误，稍后再试');"
      end
    end
  end

  def auto_complete_for_friends
    @friends = current_user.friends.find_all {|f| f.pinyin.starts_with? params[:friend][:login]}
    render :partial => 'auto_complete_friends', :object => @friends
  end

protected

  def setup
    if ["destroy"].include? params[:action]
      @tag = PhotoTag.find(params[:id])
    end
  rescue
    not_found
  end

  def deleteable_required
    @tag.is_deleteable_by?(current_user) || not_found 
  end

end
