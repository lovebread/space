require 'test_helper'

class BossTest < ActiveSupport::TestCase

  def setup
    @user = User.find(1)
    @guild = Guild.create({:game_id => 1, :game_area_id => 1, :game_server_id => 1, :name => 'name', :description => 'description', :president_id => 1, :character_id => 1})
  end

  test "没有名字" do
    b = Boss.create(:name => nil, :guild_id => @guild.id, :reward => 5)
    assert_equal b.errors.on_base, "没有名字"
  end

  test "工会有问题" do
    b = Boss.create(:name => 'b', :guild_id => nil, :reward => 5)
    assert_equal b.errors.on_base, "没有工会"

    b = Boss.create(:name => 'b', :guild_id => 123123, :reward => 5)
    assert_equal b.errors.on_base, "工会不存在"
  end

  test "没有奖励" do
    b = Boss.create(:name => 'b', :guild_id => @guild.id, :reward => nil)
    assert_equal b.errors.on_base, "没有奖励"

    b = Boss.create(:name => 'b', :guild_id => @guild.id, :reward => -5)
    assert_equal b.errors.on_base, "奖励必须是正数"
  end

  test "不能修改工会" do
    b = Boss.create(:name => 'b', :guild_id => @guild.id, :reward => 5)
    b.update_attributes(:guild_id => 23)
    assert_equal b.errors.on_base, "不能修改guild_id"
  end

  test "不能修改游戏" do
    b = Boss.create(:name => 'b', :guild_id => @guild.id, :reward => 5)
    b.update_attributes(:game_id => 23)
    assert_equal b.errors.on_base, "不能修改game_id"
  end

end
