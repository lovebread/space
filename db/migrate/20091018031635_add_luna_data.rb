class AddLunaData < ActiveRecord::Migration
  def self.up
GameRace.create(
        :name => "人类",
        :game_id => 6)
GameRace.create(
        :name => "精灵",
        :game_id => 6)
GameProfession.create(
        :name => "战士",
        :game_id => 6)
GameProfession.create(
        :name => "游侠",
        :game_id => 6)
GameProfession.create(
        :name => "法师",
        :game_id => 6)
gamearea1 = GameArea.create(
          :name => "华东电信",
          :game_id => 6)
GameServer.create(
          :name => "华东一区",
          :game_id => 6,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华东二区",
          :game_id => 6,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华东三区",
          :game_id => 6,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华东四区",
          :game_id => 6,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华东五区",
          :game_id => 6,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华东六区",
          :game_id => 6,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华东七区",
          :game_id => 6,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华东八区",
          :game_id => 6,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "华南电信",
          :game_id => 6)
GameServer.create(
          :name => "华南一区",
          :game_id => 6,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "华南二区",
          :game_id => 6,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "华南三区",
          :game_id => 6,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "华南四区",
          :game_id => 6,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "华南五区",
          :game_id => 6,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "西南电信",
          :game_id => 6)
GameServer.create(
          :name => "西南一区",
          :game_id => 6,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "西南二区",
          :game_id => 6,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "西北电信",
          :game_id => 6)
GameServer.create(
          :name => "西北一区",
          :game_id => 6,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "华中电信",
          :game_id => 6)
GameServer.create(
          :name => "华中一区",
          :game_id => 6,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "华中二区",
          :game_id => 6,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "中国版测试区",
          :game_id => 6)
GameServer.create(
          :name => "电信一区",
          :game_id => 6,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "华北网通",
          :game_id => 6)
GameServer.create(
          :name => "华北一区",
          :game_id => 6,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "华北二区",
          :game_id => 6,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "华北三区",
          :game_id => 6,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "华北四区",
          :game_id => 6,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "东北网通",
          :game_id => 6)
GameServer.create(
          :name => "东北一区",
          :game_id => 6,
          :area_id => gamearea8.id)
  end

  def self.down
  end
end
