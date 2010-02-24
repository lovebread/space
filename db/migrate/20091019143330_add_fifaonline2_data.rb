class AddFifaonline2Data < ActiveRecord::Migration
  def self.up
GameServer.create(
          :name => "广东1区",
          :game_id => 53)
GameServer.create(
          :name => "四川1区",
          :game_id => 53)
GameServer.create(
          :name => "西北大区",
          :game_id => 53)
GameServer.create(
          :name => "西南大区",
          :game_id => 53)
GameServer.create(
          :name => "华南大区",
          :game_id => 53)
GameServer.create(
          :name => "上海1区",
          :game_id => 53)
GameServer.create(
          :name => "浙江1区",
          :game_id => 53)
GameServer.create(
          :name => "江苏1区",
          :game_id => 53)
GameServer.create(
          :name => "华中大区",
          :game_id => 53)
GameServer.create(
          :name => "华东大区",
          :game_id => 53)
GameServer.create(
          :name => "北京1区",
          :game_id => 53)
GameServer.create(
          :name => "山东1区",
          :game_id => 53)
GameServer.create(
          :name => "辽宁1区",
          :game_id => 53)
GameServer.create(
          :name => "华北大区",
          :game_id => 53)
GameServer.create(
          :name => "东北大区",
          :game_id => 53)
  end

  def self.down
  end
end
