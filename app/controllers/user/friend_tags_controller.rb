class User::FriendTagsController < UserBaseController

  def new
    if params[:game_id] == 'all'
      @friends = current_user.friends
    else
      game = Game.find(params[:game_id])
      @friends = current_user.friends.find_all {|f| f.games.include?(game) }
    end
    render :partial => 'friend_table', :locals => {:friends => @friends}
  end

  def auto_complete_for_friend_tags
    @friends = current_user.friends.search(params[:friend][:login])
    render :partial => 'friends' 
  end

protected

	def setup
    if ['destroy'].include? params[:action]
		  @tag = FriendTag.find(params[:id])
    end
	rescue
    not_found
  end

  def deleteable_required
    @tag.is_deleteable_by?(current_user) || not_found
  end

end

