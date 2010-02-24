require 'test_helper'

class GuildTest < ActiveSupport::TestCase

  fixtures :all

  def setup
    @user = User.find(1)
    @params = {:game_id => 1, :game_area_id => 1, :game_server_id => 1, :name => 'name', :description => 'description', :president_id => 1, :character_id => 1}
  end

  # 测试app/observer/guild_observer.rb
  test "创建工会，同时创建一个相册和一个论坛，用户的计数器加1" do
    g = Guild.create(@params)
    @user.reload
    assert_not_nil g.album
    assert_not_nil g.forum
    assert_equal @user.guilds_count, 1
  end

  test "改名字，通知除了会长的所有会员" do
    g = Guild.create(@params)
    g.memberships.create(:user_id => 2, :character_id => 3, :status => 1).update_attributes(:status => 5)
    g.memberships.create(:user_id => 3, :character_id => 5, :status => 1).update_attributes(:status => 5)
    g.update_attributes(:name => '123123123')
    assert_not_nil Email.find_by_to(User.find(2).email)
    assert_not_nil Email.find_by_to(User.find(3).email)
  end

  test "删除工会" do
  end

  # 测试validate
  test "没有名字" do
    g = Guild.create(@params.merge({:name => nil}))
    assert_equal g.errors.on_base, "名字不能为空"
  end

  test "没有描述" do
    g = Guild.create(@params.merge({:description => nil}))
    assert_equal g.errors.on_base, "描述不能为空"
  end

  test "游戏不正确" do
    g = Guild.create(@params.merge({:game_id => nil}))
    assert_equal g.errors.on_base, "没有游戏"

    g = Guild.create(@params.merge({:game_id => 333}))
    assert_equal g.errors.on_base, "游戏不存在"

    g = Guild.create(@params.merge({:game_id => 2, :game_area_id => 1, :game_server_id => 4}))
    assert_equal g.errors.on_base, '游戏服务区应该为空'

    g = Guild.create(@params.merge({:game_id => 2, :game_area_id => nil, :game_server_id => nil}))
    assert_equal g.errors.on_base, '游戏服务器不能为空'

    g = Guild.create(@params.merge({:game_id => 2, :game_area_id => nil, :game_server_id => 1}))
    assert_equal g.errors.on_base, "游戏服务器不存在或者不属于该游戏"

    g = Guild.create(@params.merge({:game_id => 1, :game_area_id => nil, :game_server_id => 2}))
    assert_equal g.errors.on_base, '游戏服务区不能为空'
    
    g = Guild.create(@params.merge({:game_id => 1, :game_area_id => 1, :game_server_id => nil}))
    assert_equal g.errors.on_base, '游戏服务器不能为空'
    
    g = Guild.create(@params.merge({:game_id => 1, :game_area_id => 1, :game_server_id => 4}))
    assert_equal g.errors.on_base, '游戏服务器不存在或者不属于该区域'      
  end

  test "游戏角色不正确" do
    g = Guild.create(@params.merge({:character_id => nil}))
    assert_equal g.errors.on_base, "没有游戏角色"
    
    g = Guild.create(@params.merge({:character_id => 555}))
    assert_equal g.errors.on_base, "游戏角色不存在"
   
    g = Guild.create(@params.merge({:character_id => 6, :president_id => 3}))
    assert_equal g.errors.on_base, '游戏角色不属于相应服务器'   
  end

  test "不能修改game_id" do
    g = Guild.create(@params)
    g.update_attributes(:game_id => 23)
    assert_equal g.errors.on_base, "不能修改game_id"
  end

  test "不能修改president_id" do
    g = Guild.create(@params)
    g.update_attributes(:president_id => 5)
    assert_equal g.errors.on_base, "不能修改president_id"
  end

  test "不能修改character_id" do
    g = Guild.create(@params)
    g.update_attributes(:character_id => 23)
    assert_equal g.errors.on_base, "不能修改character_id"
  end

end
