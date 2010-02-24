class AddGtjinwutuan2Data < ActiveRecord::Migration
  def self.up
gamearea1 = GameArea.create(
          :name => "电信游戏大区",
          :game_id => 14)
GameServer.create(
          :name => "网吧专区（顺网）",
          :game_id => 14,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华东一区",
          :game_id => 14,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华南一区",
          :game_id => 14,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "西南一区",
          :game_id => 14,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "江苏浪淘沙",
          :game_id => 14,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "福建（电信）",
          :game_id => 14,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "湖北（胜天易游）",
          :game_id => 14,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "赣湘名智",
          :game_id => 14,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "广东专区",
          :game_id => 14,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通游戏大区",
          :game_id => 14)
GameServer.create(
          :name => "华北一区",
          :game_id => 14,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "黑龙江",
          :game_id => 14,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "山东",
          :game_id => 14,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "河北",
          :game_id => 14,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "华东96U专区",
          :game_id => 14,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
