class AddXiwangonlineData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "剑士",
        :game_id => 25)
GameProfession.create(
        :name => "骑士",
        :game_id => 25)
GameProfession.create(
        :name => "法师",
        :game_id => 25)
GameProfession.create(
        :name => "祭祀",
        :game_id => 25)
GameProfession.create(
        :name => "铁匠",
        :game_id => 25)
GameProfession.create(
        :name => "小丑",
        :game_id => 25)
gamearea1 = GameArea.create(
          :name => "电信服务器",
          :game_id => 25)
GameServer.create(
          :name => "阿勒斯",
          :game_id => 25,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "卡蕾儿",
          :game_id => 25,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "芭尔蒂雅",
          :game_id => 25,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通服务器",
          :game_id => 25)
GameServer.create(
          :name => "阿勒斯",
          :game_id => 25,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "卡蕾儿",
          :game_id => 25,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "芭尔蒂雅",
          :game_id => 25,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
