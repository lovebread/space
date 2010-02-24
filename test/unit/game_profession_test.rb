require 'test_helper'

class GameProfessionTest < ActiveSupport::TestCase

  fixtures :all

  test "名字为空" do
    profession = GameProfession.create(:name => nil)
    assert_equal profession.errors.on_base, "没有名字"
  end

  test "游戏不存在" do
    profession = GameProfession.create(:name => 'profession', :game_id => 300)
    assert_equal profession.errors.on_base, "游戏不存在"
  end

  test "游戏为空" do
    profession = GameProfession.create(:name => 'profession', :game_id => nil)
    assert_equal profession.errors.on_base, "没有游戏"
  end

  test "游戏 no_professions = false" do
    game = Game.create(:name => 'professions', :company => 'professions', :no_professions => false)
    profession = GameProfession.create(:name => 'new profession', :game_id => game.id)
    game.reload
    assert_equal game.professions_count, 1
    
    # 删除后，计数器减1
    profession.destroy
    game.reload
    assert_equal game.professions_count, 0
  end

  test "游戏 no_professions = true" do
    game = Game.create(:name => 'professions', :company => 'professions', :no_professions => true)
    profession = GameProfession.create(:name => 'new profession', :game_id => game.id)
    game.reload
    assert_equal profession.errors.on_base, "该游戏没有职业"
    assert_equal game.professions_count, 0
  end

end
