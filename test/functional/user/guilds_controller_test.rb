require 'test_helper'

class User::GuildsControllerTest < ActionController::TestCase

  def setup
    @user1 = User.find(1)
    @user2 = User.find(2)
    @user3 = User.find(3)
    @user4 = User.find(4)
    @guild1 = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => @user1.id}) 
    @guild2 = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => @user2.id})
    @guild3 = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => @user3.id})
    @guild4 = Guild.create({:game_id => 2, :name => 'guild name', :description => 'guild description', :president_id => @user4.id})
    Membership.create(:guild_id => @guild1.id, :user_id => 2, :status => 5)
    Membership.create(:guild_id => @guild3.id, :user_id => 2, :status => 5)
    @params = {:game_id => 2, :name => 'guild name', :description => 'guild description'}
  end

  # 测试 index
  test "自己查看" do
    get 'index', {:id => 2}, {:user_id => 2}

    assert_template 'user/guilds/index'

    assert_equal assigns(:guilds).count, 1
    view_link_exist_for @guild2
    invite_link_exist_for @guild2
    edit_link_exist_for @guild2
    assert_guild_status @guild2, @user2 
  end

  test "好友查看" do
    # 如果好友还没加入
    get 'index', {:id => 2}, {:user_id => 1}
    assert_template 'user/guilds/index'
    assert_equal assigns(:guilds).count, 1
    view_link_exist_for @guild2
    invite_link_not_exist_for @guild2
    edit_link_not_exist_for @guild2
    assert_guild_status @guild2, @user1
    
    # 如果好友被邀请
    @m = Membership.create(:user_id => 1, :guild_id => @guild2.id, :status => 0)
    get 'index', {:id => 2}
    assert_template 'user/guilds/index'
    assert_equal assigns(:guilds).count, 1
    view_link_exist_for @guild2
    invite_link_not_exist_for @guild2
    edit_link_not_exist_for @guild2
    assert_guild_status @guild2, @user1
  
    # 如果好友请求加入
    @m.destroy
    @m = Membership.create(:user_id => 1, :guild_id => @guild2.id, :status => 1)
    get 'index', {:id => 2}, {:user_id => 1}
    assert_template 'user/guilds/index'
    assert_equal assigns(:guilds).count, 1
    view_link_exist_for @guild2
    invite_link_not_exist_for @guild2
    edit_link_not_exist_for @guild2
    assert_guild_status @guild2, @user1
  
    # 如果好友已经是会员了
    @m.destroy
    @m = Membership.create(:user_id => 1, :guild_id => @guild2.id, :status => 4)
    get 'index', {:id => 2}, {:user_id => 1}
    assert_template 'user/guilds/index'
    assert_equal assigns(:guilds).count, 1
    view_link_exist_for @guild2
    invite_link_not_exist_for @guild2
    edit_link_not_exist_for @guild2
    assert_guild_status @guild2, @user1
  end

  test "玩相同游戏查看" do
    get 'index', {:id => 2}, {:user_id => 3}
    redirect_to_new_friend
  end

  test "陌生人查看" do
    get 'index', {:id => 2}, {:user_id => 4}
    redirect_to_new_friend
  end

  # 测试 participated
  test "自己查看参加的工会" do
    get 'participated', {:id => 2}, {:user_id => 2}
    assert_template 'user/guilds/participated'
    assert_equal assigns(:guilds).count, 2
    assert_guild_status @guild1, @user2
    assert_guild_status @guild3, @user2
  end

  test "好友查看参加的工会" do
    get 'participated', {:id => 2}, {:user_id => 1}
    assert_template 'user/guilds/participated'
    assert_equal assigns(:guilds).count, 2
    assert_guild_status @guild1, @user1
    assert_guild_status @guild3, @user1
  end

  test "玩相同游戏的人查看参加的工会" do
    get 'participated', {:id => 2}, {:user_id => 3}
    redirect_to_new_friend
  end

  test "陌生人查看参加的工会" do
    get 'participated', {:id => 2}, {:user_id => 4}
    redirect_to_new_friend
  end

  # 测试show
  test "会长看工会" do
    get 'show', {:id => @guild1.id}, {:user_id => 1}
    
    assert_template 'user/guilds/show'
    
    assert_equal assigns(:guild), @guild1
    edit_link_exist_for @guild1
    invite_link_exist_for @guild1
    event_link_exist_for @guild1
    photo_link_exist_for @guild1
    forum_link_exist_for @guild1
    view_link_exist_for @guild1
    mail_link_not_exist_for @guild1
  end

  test "长老看工会" do
    Membership.create(:user_id => 4, :guild_id => @guild1.id, :status => 4)

    get 'show', {:id => @guild1.id}, {:user_id => 4}   
 
    assert_template 'user/guilds/show'

    assert_equal assigns(:guild), @guild1
    edit_link_not_exist_for @guild1
    invite_link_not_exist_for @guild1
    event_link_exist_for @guild1
    photo_link_exist_for @guild1
    forum_link_exist_for @guild1
    view_link_not_exist_for @guild1
    mail_link_exist_for @guild1
  end

  test "会员看工会" do
    Membership.create(:user_id => 4, :guild_id => @guild1.id, :status => 5)

    get 'show', {:id => @guild1.id}, {:user_id => 4}

    assert_template 'user/guilds/show'

    assert_equal assigns(:guild), @guild1
    edit_link_not_exist_for @guild1
    invite_link_not_exist_for @guild1
    event_link_not_exist_for @guild1
    photo_link_not_exist_for @guild1
    forum_link_exist_for @guild1
    view_link_not_exist_for @guild1
    mail_link_exist_for @guild1
  end

  test "被邀请的人看工会" do
    @m = Membership.create(:user_id => 3, :guild_id => @guild1.id, :status => 0)
    
    get 'show', {:id => @guild1.id}, {:user_id => 3}

    assert_template 'user/guilds/show'

    assert_equal assigns(:guild), @guild1
    edit_link_not_exist_for @guild1
    invite_link_not_exist_for @guild1
    event_link_not_exist_for @guild1
    photo_link_not_exist_for @guild1
    forum_link_not_exist_for @guild1
    view_link_not_exist_for @guild1
    mail_link_not_exist_for @guild1
    
    assert_tag :tag => 'input', :attributes => {:value => 1, :type => 'radio', :id => 'invitation_status_1'}
    assert_tag :tag => 'input', :attributes => {:value => 2, :type => 'radio', :id => 'invitation_status_2'}
  end

  test "请求加入的人看工会" do
    Membership.create(:user_id => 4, :guild_id => @guild1.id, :status => 1)

    get 'show', {:id => @guild1.id}, {:user_id => 4}

    assert_template 'user/guilds/show'

    assert_equal assigns(:guild), @guild1
    edit_link_not_exist_for @guild1
    invite_link_not_exist_for @guild1
    event_link_not_exist_for @guild1
    photo_link_not_exist_for @guild1
    forum_link_not_exist_for @guild1
    view_link_not_exist_for @guild1
    mail_link_not_exist_for @guild1
    
    assert_tag :tag => 'span', :content => "你已经申请加入这个工会了，请耐心等待会长回复"
  end

  test "非会员的人看工会" do
    get 'show', {:id => @guild1.id}, {:user_id => 4}
 
    assert_template 'user/guilds/show'
  
    assert_equal assigns(:guild), @guild1
    edit_link_not_exist_for @guild1
    invite_link_not_exist_for @guild1
    event_link_not_exist_for @guild1
    photo_link_not_exist_for @guild1
    forum_link_not_exist_for @guild1
    view_link_not_exist_for @guild1
    mail_link_not_exist_for @guild1

    assert_tag :tag => 'a', :attributes => {:href => new_guild_request_url(@guild1, :show => 1)}
  end

  # 测试new
  test "nothing to test here" do  
  end

  # 测试create
  test "创建一个工会" do
    post 'create', {:guild => @params}, {:user_id => 2}
    @user2.reload
    assert_equal @user2.guilds_count, 2
    post 'create', {:guild => nil}
    assert_not_nil assigns(:guild).errors.on_base
  end

  # 编辑
  test "编辑自己的工会" do
    get 'edit', {:id => @guild2.id}, {:user_id => 2}
    assert_equal assigns(:guild), @guild2
  end

  test "长老编辑自己的工会" do
    Membership.create(:user_id => 3, :guild_id => @guild2.id, :status => 4)
    get 'edit', {:id => @guild2.id}, {:user_id => 3}
    assert_not_found
  end

  test "会员编辑自己的工会" do
    Membership.create(:user_id => 3, :guild_id => @guild2.id, :status => 5)
    get 'edit', {:id => @guild2.id}, {:user_id => 3}
    assert_not_found 
  end

  test "编辑别人的工会" do
    get 'edit', {:id => @guild2.id}, {:user_id => 4}
    assert_not_found
  end

  # 更新
  test "更新自己的工会" do
    put 'update', {:id => @guild3.id, :guild => {:name => 'new name'}}, {:user_id => 3}
    @guild3.reload
    assert_equal assigns(:guild), @guild3
    assert_equal @guild3.name, 'new name'
    assert_equal Email.find(:all, :conditions => {:to => @user2.email}).count, 1
  end

  test "长老更新自己的工会" do
    Membership.create(:user_id => 3, :guild_id => @guild2.id, :status => 4)
    put 'update', {:id => @guild2.id, :guild => {:name => 'new name'}}, {:user_id => 3}
    assert_not_found
  end

  test "会员更新自己的工会" do
    Membership.create(:user_id => 3, :guild_id => @guild2.id, :status => 5)
    put 'update', {:id => @guild2.id, :guild => {:name => 'new name'}}, {:user_id => 3}
    assert_not_found
  end

  test "更新其他人的工会" do
    put 'update', {:id => @guild2.id, :guild => {:name => 'new name'}}, {:user_id => 4}
    assert_not_found
  end

  # 测试hot
  test "热门工会" do
    get 'hot', {}, {:user_id => 2}
    assert_equal assigns(:guilds).count, 3 # 只显示和自己游戏有关的工会
    assert !assigns(:guilds).include?(@guild4)
  end

  # 测试recent
  test "最近工会" do
    get 'recent', {}, {:user_id => 2}
    assert_equal assigns(:guilds).count, 3 # 只显示和自己游戏有关的工会
    assert !assigns(:guilds).include?(@guild4)
  end

protected
  
  def redirect_to_new_friend
    assert_redirected_to new_friend_url(:id => @user2.id)
  end
    
  def assert_not_found
    assert_template 'not_found'
  end

  def view_link_exist_for guild
    assert_tag :tag => 'a', :attributes => {:href => guild_memberships_url(guild)}
  end

  def view_link_not_exist_for guild
    assert_no_tag :tag => 'a', :attributes => {:href => guild_memberships_url(guild)}
  end

  def event_link_exist_for guild
    assert_tag :tag => 'a', :attributes => {:href => new_event_url}
  end

  def event_link_not_exist_for guild
    assert_no_tag :tag => 'a', :attributes => {:href => new_event_url}
  end

  def forum_link_exist_for guild
    assert_tag :tag => 'a', :attributes => {:href => forum_url(guild.forum)}, :parent => {:tag => 'li'}
  end

  def forum_link_not_exist_for guild
    assert_no_tag :tag => 'a', :attributes => {:href => forum_url(guild.forum)}, :parent => {:tag => 'li'}
  end

  def edit_link_exist_for guild
    assert_tag :tag => 'a', :attributes => {:href => edit_guild_url(guild)}
  end

  def edit_link_not_exist_for guild
    assert_no_tag :tag => 'a', :attributes => {:href => edit_guild_url(guild)}
  end

  def invite_link_exist_for guild
    assert_tag :tag => 'a', :attributes => {:href => new_guild_invitation_url(guild)}
  end

  def invite_link_not_exist_for guild
    assert_no_tag :tag => 'a', :attributes => {:href => new_guild_invitation_url(guild)}
  end

  def photo_link_exist_for guild
    assert_tag :tag => 'a', :attributes => {:href => new_guild_photo_url(:album_id => guild.album.id)}
  end
  
  def photo_link_not_exist_for guild
    assert_no_tag :tag => 'a', :attributes => {:href => new_guild_photo_url(:album_id => guild.album.id)}
  end

  def mail_link_exist_for guild
    assert_tag :tag => 'a', :attributes => {:href => new_mail_url(:recipient_id => guild.president_id)}
  end

  def mail_link_not_exist_for guild
    assert_no_tag :tag => 'a', :attributes => {:href => new_mail_url(:recipient_id => guild.president_id)}
  end

  def assert_guild_status guild, user
    m = guild.memberships.find_by_user_id(user.id)
    if m.blank?
      assert_tag :tag => 'span', :attributes => {:id => "guild_status_#{guild.id}"}, :content => "没有参加"
      assert_tag :tag => 'span', :attributes => {:id => "reply_guild_#{guild.id}"}
      assert_tag :tag => 'a', :attributes => {:href => new_guild_request_url(guild, :show => 0)}
    elsif m.is_invitation?
      assert_tag :tag => 'span', :attributes => {:id => "guild_status_#{guild.id}"}, :content => "受邀请"
      assert_tag :tag => 'span', :attributes => {:id => "reply_guild_#{guild.id}"}
      assert_tag :tag => 'a', :attributes => {:href => edit_guild_invitation_url(guild, m, :show => 0)}
    elsif m.is_request?
      assert_tag :tag => 'span', :attributes => {:id => "guild_status_#{guild.id}"}, :content => "你已经请求加入工会了，请耐心等待"
    else
      assert_tag :tag => 'span', :attributes => {:id => "guild_status_#{guild.id}"}, :content => m.to_s
    end
  end 

end
