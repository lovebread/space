class AddR2Data < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "骑士",
        :game_id => 26)
GameProfession.create(
        :name => "游侠",
        :game_id => 26)
GameProfession.create(
        :name => "精灵",
        :game_id => 26)
GameProfession.create(
        :name => "刺客",
        :game_id => 26)
GameProfession.create(
        :name => "召唤师",
        :game_id => 26)
gamearea1 = GameArea.create(
          :name => "电信区",
          :game_id => 26)
GameServer.create(
          :name => "炽焰盘龙",
          :game_id => 26,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "血色之獠",
          :game_id => 26,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "不朽之王",
          :game_id => 26,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "光辉岁月",
          :game_id => 26,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通区",
          :game_id => 26)
GameServer.create(
          :name => "血之轮回",
          :game_id => 26,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "冰封大地",
          :game_id => 26,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "深渊之瞳",
          :game_id => 26,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "黑色禁忌",
          :game_id => 26,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "神圣裁决",
          :game_id => 26,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
