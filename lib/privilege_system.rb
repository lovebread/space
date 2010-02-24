#
# 这个写的很烂很烂，主要用于当前用户和资源（博客，视频，相册）的拥有者(@user)的关系以及current_user是否有权限浏览该资源
# 这里做了几个假设：
# 1. 在调用这些方法前，@user被赋值为资源的拥有者
# 2. 资源的权限分为1，2，3，4这4个等级，1表示全部人，2表示“好友或者相同游戏”， 3表示“好友”， 4表示“自己”
# 总的来说，这个module局限性满大的，使用得小心
#
module PrivilegeSystem

protected

  def is_owner?
    relationship == 'owner'
  end

  def is_friend?
    relationship == 'friend'
  end

  def is_same_game?
    relationship == 'same_game'
  end

  def owner_required
    is_owner? || not_found 
  end

  def friend_required
    is_friend? || friend_denied
  end

  def friend_or_same_game_required
    is_friend? || is_same_game? || friend_denied
  end

  def friend_or_owner_required
    is_friend? || is_owner? || friend_denied
  end

  def not_found
    render :template => 'not_found'
  end

  def friend_denied msg=nil
    flash[:notice] = msg || "只有他的好朋友才有权限看该资源"
    redirect_to new_friend_url(:id => @user.id)
  end

  def relationship
    @relationship unless @relationship.blank?
    if current_user == @user
      @relationship = 'owner'
    elsif @user.has_friend?(current_user) or @user.wait_for?(current_user)
      @relationship = 'friend'
    elsif @user.has_same_game_with?(current_user)
      @relationship = 'same_game'
    else
      @relationship = 'stranger'
    end
    @relationship
  end
 
  def privilege_required
    return true if relationship == 'owner'
    case @privilege
    when 1 # all
      return true
    when 2 # friends or same game
      friend_or_same_game_required
    when 3 # friends
      friend_required
    else
      not_found
    end
  end

  def self.included(base)
    base.send :helper_method, :relationship, :is_owner?, :is_friend?, :owner_required, :friend_required, :friend_or_same_game_required, :friend_or_owner_required
  end

end
