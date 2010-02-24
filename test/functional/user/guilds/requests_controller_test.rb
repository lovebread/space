require 'test_helper'

class User::Guilds::RequestsControllerTest < ActionController::TestCase

  def setup
    @user = User.find(1)
    @guild = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => @user.id})
  end

  # 测试new
  test "会长尝试创建" do
    get 'new', {:guild_id => @guild.id}, {:user_id => 1}
    assert_template 'user/guilds/requests/new'  
  end

  test "长老尝试创建" do
    Membership.create(:user_id => 2, :status => 4, :guild_id => @guild.id)
    get 'new', {:guild_id => @guild.id}, {:user_id => 2}
    assert_template 'user/guilds/requests/new'
  end

  test "会员尝试创建" do
    Membership.create(:user_id => 2, :status => 5, :guild_id => @guild.id)
    get 'new', {:guild_id => @guild.id}, {:user_id => 2}
    assert_template 'user/guilds/requests/new'
  end

  test "被邀请的人尝试创建" do
    Membership.create(:user_id => 2, :status => 0, :guild_id => @guild.id)
    get 'new', {:guild_id => @guild.id}, {:user_id => 2}
    assert_template 'user/guilds/requests/new'
  end

  test "请求加入的人尝试创建" do
    Membership.create(:user_id => 2, :status => 1, :guild_id => @guild.id)
    get 'new', {:guild_id => @guild.id}, {:user_id => 2}
    assert_template 'user/guilds/requests/new'
  end

  test "非会员尝试创建" do
    get 'new', {:guild_id => @guild.id}, {:user_id => 2}
    assert_template 'user/guilds/requests/new'
  end

  # 测试create

  test "会长创建" do
    post 'create', {:guild_id => @guild.id, :status => 1}, {:user_id => 1}
    @guild.reload
    assert_not_nil assigns(:request).errors.on_base
    assert_equal @guild.requestors_count, 0
  end

  test "长老创建" do
    Membership.create(:user_id => 2, :status => 4, :guild_id => @guild.id)
    post 'create', {:guild_id => @guild.id, :status => 1}, {:user_id => 2}
    @guild.reload
    assert_not_nil assigns(:request).errors.on_base
    assert_equal @guild.requestors_count, 0
  end

  test "会员创建" do
    Membership.create(:user_id => 2, :status => 5, :guild_id => @guild.id)  
    post 'create', {:guild_id => @guild.id, :status => 1}, {:user_id => 2}
    @guild.reload
    assert_not_nil assigns(:request).errors.on_base
    assert_equal @guild.requestors_count, 0
  end

  test "被邀请的人创建" do
    Membership.create(:user_id => 2, :status => 0, :guild_id => @guild.id)
    post 'create', {:guild_id => @guild.id, :status => 1}, {:user_id => 2}
    @guild.reload
    assert_not_nil assigns(:request).errors.on_base
    assert_equal @guild.requestors_count, 0 
  end

  test "请求加入的人创建" do
    Membership.create(:user_id => 2, :status => 1, :guild_id => @guild.id)
    post 'create', {:guild_id => @guild.id, :status => 1}, {:user_id => 2}
    @guild.reload
    assert_not_nil assigns(:request).errors.on_base
    assert_equal @guild.requestors_count, 1
  end

  test "非会员创建" do
    post 'create', {:guild_id => @guild.id, :status => 1}, {:user_id => 2}
    @user.reload
    @guild.reload
    assert_equal @user.guild_requests_count, 1
    assert_equal @guild.requestors_count, 1
  end

  # 测试 accept
  test "会长接受请求" do
    m = Membership.create(:guild_id => @guild.id, :user_id => 2, :status => 1)
    put 'accept', {:guild_id => @guild.id, :id => m.id}, {:user_id => 1}
    @user.reload
    @guild.reload
    assert_equal @guild.veterans_count, 1
    assert_equal User.find(2).participated_guilds_count, 1
  end

  test "会长拒绝请求" do
    m = Membership.create(:guild_id => @guild.id, :user_id => 2, :status => 1)
    put 'decline', {:guild_id => @guild.id, :id => m.id}, {:user_id => 1}
    @user.reload
    @guild.reload
    assert_equal @guild.veterans_count, 0
    assert_equal User.find(2).participated_guilds_count, 0
  end

  test "非会长接受请求" do
    m = Membership.create(:guild_id => @guild.id, :user_id => 2, :status => 1)
    put 'accept', {:guild_id => @guild.id, :id => m.id}, {:user_id => 2}
    assert_template 'not_found'
  end

  test "非会长拒绝请求" do
    m = Membership.create(:guild_id => @guild.id, :user_id => 2, :status => 1)
    put 'decline', {:guild_id => @guild.id, :id => m.id}, {:user_id => 4}
    assert_template 'not_found' 
  end

end
