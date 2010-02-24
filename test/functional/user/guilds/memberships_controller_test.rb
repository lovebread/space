require 'test_helper'

class User::Guilds::MembershipsControllerTest < ActionController::TestCase

  def setup
    @user = User.find(1)
    @guild = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => @user.id}) 
    @m1 = Membership.create(:user_id => 2, :guild_id => @guild.id, :status => 4)
    @m2 = Membership.create(:user_id => 3, :guild_id => @guild.id, :status => 0)
    @m3 = Membership.create(:user_id => 4, :guild_id => @guild.id, :status => 5)
    @m4 = Membership.create(:user_id => 5, :guild_id => @guild.id, :status => 1)
    @guild.reload
  end

  # 测试 index
  test "会长看" do
    get 'index', {:guild_id => @guild.id, :type => 0}, {:user_id => 1}
    assert_equal assigns(:members).count, 1
    edit_link_exist_for @m1
    delete_link_exist_for @m1

    get 'index', {:guild_id => @guild.id, :type => 1}
    assert_equal assigns(:members).count, 1
    edit_link_exist_for @m3
    delete_link_exist_for @m3

    get 'index', {:guild_id => @guild.id, :type => 2}
    assert_equal assigns(:members).count, 1

    get 'index', {:guild_id => @guild.id, :type => 3} 
    assert_equal assigns(:members).count, 1
    accept_link_exist_for @m4
    decline_link_exist_for @m4
  end

  test "长老看" do
    get 'index', {:guild_id => @guild.id, :type => 0}, {:user_id => 2}
    assert_equal assigns(:members).count, 1
    edit_link_not_exist_for @m1
    delete_link_not_exist_for @m1

    get 'index', {:guild_id => @guild.id, :type => 1}
    assert_equal assigns(:members).count, 1
    edit_link_not_exist_for @m2
    delete_link_not_exist_for @m2

    get 'index', {:guild_id => @guild.id, :type => 2}
    assert_equal assigns(:members).count, 1

    get 'index', {:guild_id => @guild.id, :type => 3}
    assert_equal assigns(:members).count, 1
    accept_link_not_exist_for @m4
    decline_link_not_exist_for @m4
  end

  test "会员看" do
    get 'index', {:guild_id => @guild.id, :type => 0}, {:user_id => 4}
    assert_equal assigns(:members).count, 1
    edit_link_not_exist_for @m1
    delete_link_not_exist_for @m1
  
    get 'index', {:guild_id => @guild.id, :type => 1}
    assert_equal assigns(:members).count, 1
    edit_link_not_exist_for @m2
    delete_link_not_exist_for @m2

    get 'index', {:guild_id => @guild.id, :type => 2}
    assert_equal assigns(:members).count, 1

    get 'index', {:guild_id => @guild.id, :type => 3}
    assert_equal assigns(:members).count, 1
    accept_link_not_exist_for @m4
    decline_link_not_exist_for @m4
  end

  test "请求加入的人看" do
    get 'index', {:guild_id => @guild.id, :type => 0}, {:user_id => 5}
    assert_equal assigns(:members).count, 1
    edit_link_not_exist_for @m1
    delete_link_not_exist_for @m1
  
    get 'index', {:guild_id => @guild.id, :type => 1}
    assert_equal assigns(:members).count, 1
    edit_link_not_exist_for @m2
    delete_link_not_exist_for @m2

    get 'index', {:guild_id => @guild.id, :type => 2}
    assert_equal assigns(:members).count, 1

    get 'index', {:guild_id => @guild.id, :type => 3}
    assert_equal assigns(:members).count, 1
    accept_link_not_exist_for @m4
    decline_link_not_exist_for @m4
  end

  test "被邀请的人看" do
    get 'index', {:guild_id => @guild.id, :type => 0}, {:user_id => 3}
    assert_equal assigns(:members).count, 1
    edit_link_not_exist_for @m1
    delete_link_not_exist_for @m1
  
    get 'index', {:guild_id => @guild.id, :type => 1}
    assert_equal assigns(:members).count, 1
    edit_link_not_exist_for @m2
    delete_link_not_exist_for @m2

    get 'index', {:guild_id => @guild.id, :type => 2}
    assert_equal assigns(:members).count, 1

    get 'index', {:guild_id => @guild.id, :type => 3}
    assert_equal assigns(:members).count, 1
    accept_link_not_exist_for @m4
    decline_link_not_exist_for @m4
  end

  test "没有参加的人看" do
    @m4.destroy
    
    get 'index', {:guild_id => @guild.id, :type => 0}, {:user_id => 5}
    assert_equal assigns(:members).count, 1
    edit_link_not_exist_for @m1
    delete_link_not_exist_for @m1

    get 'index', {:guild_id => @guild.id, :type => 1}
    assert_equal assigns(:members).count, 1
    edit_link_not_exist_for @m2
    delete_link_not_exist_for @m2

    get 'index', {:guild_id => @guild.id, :type => 2}
    assert_equal assigns(:members).count, 1

    get 'index', {:guild_id => @guild.id, :type => 3}
    assert_equal assigns(:members).count, 0  
  end

  # 测试 edit
  test "会长编辑" do
    get 'edit', {:guild_id => @guild.id, :id => @m1.id}, {:user_id => 1}
    assert_template 'user/guilds/memberships/edit'
    assert_equal assigns(:membership), @m1 
  end

  test "长老编辑" do
    get 'edit', {:guild_id => @guild.id, :id => @m1.id}, {:user_id => 2}
    assert_not_found
  end

  test "会员试图编辑" do
    get 'edit', {:guild_id => @guild.id, :id => @m1.id}, {:user_id => 4}
    assert_not_found
  end

  test "被邀请的人试图编辑" do
    get 'edit', {:guild_id => @guild.id, :id => @m1.id}, {:user_id => 3}
    assert_not_found
  end

  test "请求加入的人试图编辑" do
    get 'edit', {:guild_id => @guild.id, :id => @m1.id}, {:user_id => 5}
    assert_not_found
  end

  test "其他人试图编辑" do
    @m4.destroy
    get 'edit', {:guild_id => @guild.id, :id => @m1.id}, {:user_id => 5}
    assert_not_found
  end

  # 测试 update
  test "会长更新" do
    put 'update', {:guild_id => @guild.id, :id => @m1.id, :status => 5}, {:user_id => 1}
    @m1.reload
    @guild.reload
    assert_equal @m1.status, 5
    assert_equal User.find(2).notifications.count, 1
    assert_equal @guild.members_count, 2
    assert_equal @guild.veterans_count, 0
    
    put 'update', {:guild_id => @guild.id, :id => @m3.id, :status => 4}
    @m3.reload
    @guild.reload
    assert_equal @m3.status, 4
    assert_equal User.find(4).notifications.count, 1
    assert_equal @guild.members_count, 1
    assert_equal @guild.veterans_count, 1
  end

  test "长老更新" do
    put 'update', {:guild_id => @guild.id, :id => @m1.id, :status => 5}, {:user_id => 2}
    assert_not_found
  end

  test "会员更新" do
    put 'update', {:guild_id => @guild.id, :id => @m2.id, :status => 4}, {:user_id => 4}
    assert_not_found
  end

  test "被邀请的人更新" do
    put 'update', {:guild_id => @guild.id, :id => @m1.id, :status => 4}, {:user_id => 3}
    assert_not_found
  end

  test "请求加入的人更新" do
    put 'update', {:guild_id => @guild.id, :id => @m1.id, :status => 4}, {:user_id => 5}
    assert_not_found
  end

  test "其他人更新" do
    @m4.destroy
    put 'update', {:guild_id => @guild.id, :id => @m1.id, :status => 4}, {:user_id => 5}
    assert_not_found
  end

  # 测试 destroy
  test "会长替人" do
    delete 'destroy', {:guild_id => @guild.id, :id => @m1.id}, {:user_id => 1}
    assert_equal User.find(2).participated_guilds_count, 0
  end

  test "长老题人" do
    delete 'destroy', {:guild_id => @guild.id, :id => @m2.id}, {:user_id => 2}
    assert_not_found
  end

  test "会员替人" do
    delete 'destroy', {:guild_id => @guild.id, :id => @m1.id}, {:user_id => 4}
    assert_not_found
  end

  test "被邀请的人替人" do
    delete 'destroy', {:guild_id => @guild.id, :id => @m1.id}, {:user_id => 3}
    assert_not_found
  end

  test "请求加入的人替人" do
    delete 'destroy', {:guild_id => @guild.id, :id => @m1.id}, {:user_id => 5}
    assert_not_found
  end

  test "其他人替人" do
    @m4.destroy
    delete 'destroy', {:guild_id => @guild.id, :id => @m1.id}, {:user_id => 5}
    assert_not_found
  end

protected
    
  def assert_not_found
    assert_template 'not_found'
  end

  def edit_link_exist_for membership
    assert_tag :tag => 'a', :attributes => {:href => edit_guild_membership_url(membership.guild, membership)} 
  end

  def edit_link_not_exist_for membership
    assert_no_tag :tag => 'a', :attributes => {:href => edit_guild_membership_url(membership.guild, membership)}
  end

  def delete_link_exist_for membership
    assert_tag :tag => 'a', :attributes => {:href => guild_membership_url(membership.guild, membership), :facebox_type => 'confirm'}
  end

  def delete_link_not_exist_for membership
    assert_no_tag :tag => 'a', :attributes => {:href => guild_membership_url(membership.guild, membership), :facebox_type => 'confirm'}
  end

  def accept_link_exist_for membership
    assert_tag :tag => 'a', :content => '接受'
  end

  def accept_link_not_exist_for membership
    assert_no_tag :tag => 'a', :content => '接受'
  end

  def decline_link_exist_for membership
    assert_tag :tag => 'a', :attributes => {:href => decline_guild_request_url(membership.guild, membership, :show => 2)}
  end

  def decline_link_not_exist_for membership
    assert_no_tag :tag => 'a', :attributes => {:href => decline_guild_request_url(membership.guild, membership, :show => 2)}
  end

end
