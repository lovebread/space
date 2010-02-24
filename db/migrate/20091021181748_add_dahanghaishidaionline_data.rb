class AddDahanghaishidaionlineData < ActiveRecord::Migration
  def self.up
GameRace.create(
        :name => "西班牙",
        :game_id => 100)
GameRace.create(
        :name => "英格兰",
        :game_id => 100)
GameRace.create(
        :name => "葡萄牙",
        :game_id => 100)
GameRace.create(
        :name => "威尼斯",
        :game_id => 100)
GameRace.create(
        :name => "荷兰",
        :game_id => 100)
GameRace.create(
        :name => "法兰西",
        :game_id => 100)
GameProfession.create(
        :name => "冒险家",
        :game_id => 100)
GameProfession.create(
        :name => "商人",
        :game_id => 100)
GameProfession.create(
        :name => "军人",
        :game_id => 100)
GameServer.create(
          :name => "双线一区",
          :game_id => 100)
GameServer.create(
          :name => "双线二区",
          :game_id => 100)
GameServer.create(
          :name => "双线三区",
          :game_id => 100)
GameServer.create(
          :name => "双线四区",
          :game_id => 100)
GameServer.create(
          :name => "双线五区",
          :game_id => 100)
  end

  def self.down
  end
end
