class AddLuoqiData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "人类",
        :game_id => 66)
GameProfession.create(
        :name => "精灵",
        :game_id => 66)
GameProfession.create(
        :name => "巨人",
        :game_id => 66)
gamearea1 = GameArea.create(
          :name => "电信",
          :game_id => 66)
GameServer.create(
          :name => "一区",
          :game_id => 66,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "二区",
          :game_id => 66,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "三区",
          :game_id => 66,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "四区",
          :game_id => 66,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通",
          :game_id => 66)
GameServer.create(
          :name => "一区",
          :game_id => 66,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "二区",
          :game_id => 66,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "三区",
          :game_id => 66,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "四区",
          :game_id => 66,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
