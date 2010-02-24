require 'test_helper'

class User::Guilds::InvitationsControllerTest < ActionController::TestCase

  def setup
    @user = User.find(1)
    @guild = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => 1})
    @m1 = Membership.create(:user_id => 2, :guild_id => @guild.id, :status => 4)
    @m2 = Membership.create(:user_id => 3, :guild_id => @guild.id, :status => 5)
  end

  # 测试 new
  test "会长试图邀请别人" do
    get 'new', {:guild_id => @guild.id}, {:user_id => 1}
    assert_template 'user/guilds/invitations/new'
  end

  test "长老试图邀请别人" do
    get 'new', {:guild_id => @guild.id}, {:user_id => 2}
    assert_template 'not_found'
  end

  test "member试图邀请别人" do
    get 'new', {:guild_id => @guild.id}, {:user_id => 3}
    assert_template 'not_found'
  end

  test "被邀请的人试图邀请别人" do
    @m1.destroy
    Membership.create(:user_id => 2, :guild_id => @guild.id, :status => 0)
    get 'new', {:guild_id => @guild.id}, {:user_id => 2}
    assert_template 'not_found'
  end

  test "请求加入的人试图邀请别人" do
    Membership.create(:user_id => 4, :guild_id => @guild.id, :status => 1)
    get 'new', {:guild_id => @guild.id}, {:user_id => 4}
    assert_template 'not_found'
  end

  test "别人试图创建邀请" do
    get 'new', {:guild_id => @guild.id}, {:user_id => 4}
    assert_template 'not_found'
  end

  # 测试 create
  test "会长邀请别人" do
    @m1.destroy
    @m2.destroy
    post 'create_multiple', {:guild_id => @guild.id, :users => [2]}, {:user_id => 1}
    @guild.reload
    assert_redirected_to guild_url(@guild)
    assert_equal @guild.invitees_count, 1
    # 重复邀请
    post 'create_multiple', {:guild_id => @guild.id, :users => [2,3]}
    @guild.reload
    assert_redirected_to guild_url(@guild)
    assert_equal @guild.invitees_count, 2
    # 邀请不存在的
    post 'create_multiple', {:guild_id => @guild.id, :users => [5,6]}
    @guild.reload
    assert_redirected_to guild_url(@guild)
    assert_equal @guild.invitees_count, 2
    # 邀请非好友
    post 'create_multiple', {:guild_id => @guild.id, :users => [4]}
    @guild.reload
    assert_redirected_to guild_url(@guild)
    assert_equal @guild.invitees_count, 2
  end

  test "长老邀请别人" do
    post 'create_multiple', {:guild_id => @guild.id, :users => [3]}, {:user_id => 2}
    assert_template 'not_found'
  end

  test "member邀请别人" do
    post 'create_multiple', {:guild_id => @guild.id, :users => [3]}, {:user_id => 3}
    assert_template 'not_found'
  end

  test "被邀请的人邀请别人" do
    @m1.destroy
    Membership.create(:user_id => 2, :guild_id => @guild.id, :status => 0)
    post 'create_multiple', {:guild_id => @guild.id, :users => [3]}, {:user_id => 2}
    assert_template 'not_found'
  end

  test "请求加入的人邀请别人" do
    Membership.create(:user_id => 4, :guild_id => @guild.id, :status => 1)
    post 'create_multiple', {:guild_id => @guild.id, :users => [3]}, {:user_id => 4}
    assert_template 'not_found'
  end

  test "别人创建邀请" do
    post 'create_multiple', {:guild_id => @guild.id, :users => [3]}, {:user_id => 4}
    assert_template 'not_found'
  end

  # 接受，拒绝邀请
  test "被邀请的人接受邀请" do
    @m1.destroy
    m = Membership.create(:guild_id => @guild.id, :user_id => 2, :status => 0)
    put 'accept', {:guild_id => @guild.id, :id => m.id}, {:user_id => 2}
    m.reload
    assert_equal m.status, 5
    assert_equal User.find(2).participated_guilds_count, 1
  end

  test "被邀请的人拒绝邀请" do
    @m1.destroy
    m = Membership.create(:guild_id => @guild.id, :user_id => 2, :status => 0)
    put 'decline', {:guild_id => @guild.id, :id => m.id}, {:user_id => 2}
    assert_equal User.find(4).participated_guilds_count, 0
  end

  test "非被邀请的人接受邀请" do
    @m1.destroy
    m = Membership.create(:guild_id => @guild.id, :user_id => 2, :status => 0)
    put 'accept', {:guild_id => @guild.id, :id => m.id}, {:user_id => 3}
    assert_template 'not_found'
  end

  test "非被邀请的人拒绝邀请" do
    @m1.destroy
    m = Membership.create(:guild_id => @guild.id, :user_id => 2, :status => 0)
    put 'decline', {:guild_id => @guild.id, :id => m.id}, {:user_id => 3}
    assert_template 'not_found'
  end

end
