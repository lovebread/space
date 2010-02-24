require 'test_helper'

class GameServerTest < ActiveSupport::TestCase

  fixtures :all

  test "名字为空" do
    server = GameServer.create(:name => nil)
    assert_equal server.errors.on_base, "没有名字"
  end

  test "游戏不存在" do
    server = GameServer.create(:name => 'server', :game_id => 3000)
    assert_equal server.errors.on_base, "游戏不存在"
  end

  test "游戏为空" do
    server = GameServer.create(:name => 'server', :game_id => nil)
    assert_equal server.errors.on_base, "没有游戏"
  end

  test "没有服务区" do
    server = GameServer.create(:name => 'server', :game_id => 1)
    assert_equal server.errors.on_base, "没有服务区"
  end

  test "服务区不存在" do
    server = GameServer.create(:name => 'server', :area_id => 23, :game_id => 1)
    assert_equal server.errors.on_base, "服务区不存在"
  end

  test "游戏 no_areas = true" do
    game = Game.find(2)
    assert_equal game.servers_count, 2 
    
    server = game.servers.create(:name => 'adf')
    game.reload
    assert_equal game.servers_count, 3
    
    server.destroy
    game.reload
    assert_equal game.servers_count, 2
  end

  test "游戏 no_areas = false" do
    game = Game.find(1)
    area = game.areas.first
    assert_equal area.servers_count, 2
    assert_equal game.servers_count, 3
    assert !game.no_areas

    server = GameServer.create(:name => 'asd', :game_id => game.id, :area_id => area.id)
    game.reload
    area.reload
    assert_equal game.servers_count, 4
    assert_equal area.servers_count, 3
    
    server.destroy
    game.reload
    area.reload
    assert_equal game.servers_count, 3
    assert_equal area.servers_count, 2
  end

end
