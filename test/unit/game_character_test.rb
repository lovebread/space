require 'test_helper'

class GameCharacterTest < ActiveSupport::TestCase

  fixtures :all

  def setup
    @p1 = {:user_id => 1, :game_id => 1, :server_id => 1, :area_id => 1, :race_id => 1, :profession_id => 1, :name => 'n', :level => 1}
    @p2 = {:user_id => 1, :game_id => 2, :server_id => 4, :area_id => nil, :race_id => 2, :profession_id => 2, :name => 'n', :level => 1}
    @p3 = {:user_id => 1, :game_id => 3, :server_id => 6, :area_id => nil, :race_id => nil, :profession_id => 3, :name => 'n', :level => 1}
    @p4 = {:user_id => 1, :game_id => 4, :server_id => 7, :area_id => nil, :race_id => 3, :profession_id => nil, :name => 'n', :level => 1}
  end
 
  test "没有用户" do
    c = GameCharacter.create(@p1.merge({:user_id => nil}))
    assert_equal c.errors.on_base, "没有用户"
  end
 
  test "没有名字" do
    c = GameCharacter.create(@p1.merge({:name => nil}))
    assert_equal c.errors.on_base, "没有名字"
  end

  test "没有等级" do
    c = GameCharacter.create(@p1.merge({:level => nil}))
    assert_equal c.errors.on_base, "没有等级"
  end

  test "没有游戏" do
    c = GameCharacter.create(@p1.merge({:game_id => nil}))
    assert_equal c.errors.on_base, "没有游戏"
  end

  test "游戏不存在" do
    c = GameCharacter.create(@p1.merge({:game_id => 123}))
    assert_equal c.errors.on_base, "游戏不存在"
  end

  test "服务区不应该有" do
    c = GameCharacter.create(@p2.merge({:area_id => 2}))
    assert_equal c.errors.on_base, "服务区不应该有"
  end

  test "没有服务区" do
    c = GameCharacter.create(@p1.merge({:area_id => nil}))
    assert_equal c.errors.on_base, "没有服务区"
  end

  test "服务区不存在" do
    c = GameCharacter.create(@p1.merge({:area_id => 3}))
    assert_equal c.errors.on_base, "服务区不存在"
  end

  test "没有服务器" do
    c = GameCharacter.create(@p1.merge({:server_id => nil}))
    assert_equal c.errors.on_base, "没有服务器"  
  end

  test "服务器不存在" do
    c = GameCharacter.create(@p1.merge({:server_id => 32}))
    assert_equal c.errors.on_base, "服务器不存在"
  end

  test "种族不应该有" do
    c = GameCharacter.create(@p3.merge({:race_id => 3}))
    assert_equal c.errors.on_base, "种族不应该有"
  end

  test "没有种族" do
    c = GameCharacter.create(@p1.merge({:race_id => nil}))
    assert_equal c.errors.on_base, "没有种族"
  end

  test "种族不存在" do
    c = GameCharacter.create(@p1.merge({:race_id => 23}))
    assert_equal c.errors.on_base, "种族不存在"
  end

  test "职业不应该有" do
    c = GameCharacter.create(@p4.merge({:profession_id => 3}))
    assert_equal c.errors.on_base, "职业不应该有"
  end

  test "没有职业" do
    c = GameCharacter.create(@p1.merge({:profession_id => nil}))
    assert_equal c.errors.on_base, "没有职业"
  end

  test "职业不存在" do
    c = GameCharacter.create(@p1.merge({:profession_id => 23}))
    assert_equal c.errors.on_base, "职业不存在"
  end

  test "计数器" do
    c = GameCharacter.create(@p1)
    assert_equal Game.find(1).characters_count, 1
    assert_equal User.find(1).characters_count, 1
  
    c.destroy
    assert_equal Game.find(1).characters_count, 0
    assert_equal User.find(1).characters_count, 0
  end  

end
  
