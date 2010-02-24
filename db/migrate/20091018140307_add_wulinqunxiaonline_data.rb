class AddWulinqunxiaonlineData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "毒龙教",
        :game_id => 23)
GameProfession.create(
        :name => "刑天门",
        :game_id => 23)
GameProfession.create(
        :name => "风云谷",
        :game_id => 23)
GameProfession.create(
        :name => "无极医宫",
        :game_id => 23)
gamearea1 = GameArea.create(
          :name => "电信",
          :game_id => 23)
GameServer.create(
          :name => "壮志",
          :game_id => 23,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "盛世",
          :game_id => 23,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "擎天&天尊",
          :game_id => 23,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "震岳&虎跃&逍遥",
          :game_id => 23,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "君王&巅峰",
          :game_id => 23,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通",
          :game_id => 23)
GameServer.create(
          :name => "逐鹿",
          :game_id => 23,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "至尊",
          :game_id => 23,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "鸿图&纵横&昆仑",
          :game_id => 23,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "豪侠",
          :game_id => 23,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
