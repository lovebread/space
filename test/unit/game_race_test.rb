require 'test_helper'

class GameRaceTest < ActiveSupport::TestCase

  fixtures :all

  test "名字为空" do
    race = GameRace.create(:name => nil)
    assert_equal race.errors.on_base, "没有名字"
  end

  test "游戏不存在" do
    race = GameRace.create(:name => 'race', :game_id => 1000)
    assert_equal race.errors.on_base, "游戏不存在"
  end

  test "游戏为空" do
    race = GameRace.create(:name => 'race', :game_id => nil)
    assert_equal race.errors.on_base, "没有游戏"
  end

  test "游戏 no_races = false" do
    game = Game.create(:name => 'races', :company => 'races', :no_races => false)
    race = GameRace.create(:name => 'new race', :game_id => game.id)         
    game.reload
    assert_equal game.races_count, 1

    # 删除后，计数器减1
    race.destroy
    game.reload
    assert_equal game.races_count, 0
  end

  test "游戏 no_races = true" do
    game = Game.create(:name => 'races', :company => 'races', :no_races => true)
    race = GameRace.create(:name => 'new race', :game_id => game.id)
    game.reload
    assert_equal race.errors.on_base, "该游戏没有种族"
    assert_equal game.areas_count, 0
  end

end
