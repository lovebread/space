require 'test_helper'

class GameAreaTest < ActiveSupport::TestCase
  
  fixtures :all

  test "名字为空" do
    area = GameArea.create(:name => nil)
    assert_equal area.errors.on_base, "没有名字"
  end

  test "游戏不存在" do
    area = GameArea.create(:name => 'area', :game_id => 3000)
    assert_equal area.errors.on_base, "游戏不存在"
  end

  test "游戏为空" do
    area = GameArea.create(:name => 'area', :game_id => nil)
    assert_equal area.errors.on_base, "没有游戏"
  end

  test "游戏 no_areas = false" do
    game = Game.find(1)
    assert_equal game.areas_count, 2
    assert !game.no_areas
    area = GameArea.create(:name => 'new area', :game_id => game.id)
    game.reload
    assert_equal game.areas_count, 3  

    # 删除后，计数器减1
    area.destroy
    game.reload
    assert_equal game.areas_count, 2
  end

  test "游戏 no_areas = true" do
    game = Game.find(2)
    assert game.no_areas
    area = GameArea.create(:name => 'new area', :game_id => game.id)         
    game.reload
    assert_equal area.errors.on_base, "该游戏没有服务区"
    assert_equal game.areas_count, 0
  end

end
