class AddSdgandaData < ActiveRecord::Migration
  def self.up
GameServer.create(
          :name => "弥赛亚",
          :game_id => 40)
GameServer.create(
          :name => "太阳之都",
          :game_id => 40)
GameServer.create(
          :name => "阿克西斯",
          :game_id => 40)
GameServer.create(
          :name => "敢打无双",
          :game_id => 40)
  end

  def self.down
  end
end
