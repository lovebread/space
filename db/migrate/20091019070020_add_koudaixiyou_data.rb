class AddKoudaixiyouData < ActiveRecord::Migration
  def self.up
GameRace.create(
        :name => "人类",
        :game_id => 45)
GameRace.create(
        :name => "神仙",
        :game_id => 45)
GameRace.create(
        :name => "妖怪",
        :game_id => 45)
GameProfession.create(
        :name => "枪侠",
        :game_id => 45)
GameProfession.create(
        :name => "灵剑",
        :game_id => 45)
GameProfession.create(
        :name => "白羽",
        :game_id => 45)
GameProfession.create(
        :name => "萨满",
        :game_id => 45)
GameProfession.create(
        :name => "法皇",
        :game_id => 45)
GameProfession.create(
        :name => "药王",
        :game_id => 45)
gamearea1 = GameArea.create(
          :name => "电信一区",
          :game_id => 45)
GameServer.create(
          :name => "天尊",
          :game_id => 45,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "刑天",
          :game_id => 45,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "星辰",
          :game_id => 45,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "诸神",
          :game_id => 45,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信二区",
          :game_id => 45)
GameServer.create(
          :name => "盘古",
          :game_id => 45,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "武圣",
          :game_id => 45,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "天王",
          :game_id => 45,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "电信西部",
          :game_id => 45)
GameServer.create(
          :name => "龙帝",
          :game_id => 45,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "网通一区",
          :game_id => 45)
GameServer.create(
          :name => "战神",
          :game_id => 45,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "网通二区",
          :game_id => 45)
GameServer.create(
          :name => "炎黄",
          :game_id => 45,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "群仙",
          :game_id => 45,
          :area_id => gamearea5.id)
  end

  def self.down
  end
end
