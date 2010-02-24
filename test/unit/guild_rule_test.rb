require 'test_helper'

class GuildRuleTest < ActiveSupport::TestCase

  def setup
    @user = User.find(1)
    @guild = Guild.create({:game_id => 1, :game_area_id => 1, :game_server_id => 1, :name => 'reason', :description => 'description', :president_id => 1, :character_id => 1})
  end

  test "自动创建2条出勤" do
    assert_equal @guild.rules.count, 2
    assert_not_nil @guild.presence_rule
    assert_not_nil @guild.absence_rule
  end

  # validate
  test "没有名字" do
    b = GuildRule.create(:reason => nil, :guild_id => @guild.id, :outcome => 5, :rule_type => 2)
    assert_equal b.errors.on_base, "原因为空"
  end

  test "工会有问题" do
    b = GuildRule.create(:reason => 'b', :guild_id => nil, :outcome => 5, :rule_type => 2)
    assert_equal b.errors.on_base, "没有工会"

    b = GuildRule.create(:reason => 'b', :guild_id => 123123, :outcome => 5, :rule_type => 2)
    assert_equal b.errors.on_base, "工会不存在"
  end

  test "没有奖励" do
    b = GuildRule.create(:reason => 'b', :guild_id => @guild.id, :outcome => nil, :rule_type => 2)
    assert_equal b.errors.on_base, "赏罚为空"
  end

  # validate_on_create
  test "出勤规则不能由用户创建" do
    b = GuildRule.create(:reason => 'b', :guild_id => @guild.id, :outcome => -5, :rule_type => 0)
    assert_equal b.errors.on_base, "不能创建出勤规则"

    b = GuildRule.create(:reason => 'b', :guild_id => @guild.id, :outcome => -5, :rule_type => 1)
    assert_equal b.errors.on_base, "不能创建出勤规则"
  end

  # validate_on_update
  test "不能修改guild_id" do
    b = GuildRule.create(:reason => 'b', :guild_id => @guild.id, :outcome => -5, :rule_type => 2)
    b.update_attributes(:guild_id => 23)
    assert_equal b.errors.on_base, "不能修改guild_id"
  end

  test "不能修改rule_type" do
    b = GuildRule.create(:reason => 'b', :guild_id => @guild.id, :outcome => -5, :rule_type => 2)
    b.update_attributes(:rule_type => 3)
    assert_equal b.errors.on_base, "不能修改rule_type"
  end

  test "出勤规则只能修改赏罚" do
    b = @guild.presence_rule
    
    b.update_attributes(:reason => 'b')
    assert_equal b.errors.on_base, "出勤规则只能修改赏罚"

    b = @guild.absence_rule
    
    b.update_attributes(:reason => 'b')
    assert_equal b.errors.on_base, "出勤规则只能修改赏罚"
  end

end
