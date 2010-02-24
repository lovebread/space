require 'test_helper'

class GearTest < ActiveSupport::TestCase

  def setup
    @user = User.find(1)
    @guild = Guild.create({:game_id => 1, :game_area_id => 1, :game_server_id => 1, :name => 'name', :description => 'description', :president_id => 1, :character_id => 1})
    @boss = @guild.bosses.create(:name => 'boss', :reward => 50)
  end

  test "没有名字" do
    b = Gear.create(:name => nil, :boss_id => @boss.id, :cost => 5)
    assert_equal b.errors.on_base, "没有名字"
  end

  test "boss有问题" do
    b = Gear.create(:name => 'b', :boss_id => nil, :guild_id => @guild.id, :cost => 5)
    assert_equal b.errors.on_base, "没有boss"

    b = Gear.create(:name => 'b', :boss_id => 2222, :guild_id => @guild.id, :cost => 5)
    assert_equal b.errors.on_base, "boss不存在"
  end

  test "没有成本" do
    b = Gear.create(:name => 'b', :boss_id => @boss.id, :guild_id => @guild.id, :cost => nil)
    assert_equal b.errors.on_base, "没有成本"

    b = Gear.create(:name => 'b', :boss_id => @boss.id, :guild_id => @guild.id, :cost => -5)
    assert_equal b.errors.on_base, "成本必须是正数"
  end
  
  test "不能修改boss_id" do
    b = Gear.create(:name => 'b', :boss_id => @boss.id, :guild_id => @guild.id, :cost => 1)
    b.update_attributes(:boss_id => 23)
    assert_equal b.errors.on_base, "不能修改boss_id"
  end

  test "不能修改guild_id" do
    b = Gear.create(:name => 'b', :boss_id => @boss.id, :guild_id => @guild.id, :cost => 1)
    b.update_attributes(:guild_id => 23)
    assert_equal b.errors.on_base, "不能修改guild_id"
  end

end
