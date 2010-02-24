class AddJinwushijieData < ActiveRecord::Migration
  def self.up
GameServer.create(
          :name => "华南一区",
          :game_id => 88)
GameServer.create(
          :name => "华东一区",
          :game_id => 88)
GameServer.create(
          :name => "华北一区",
          :game_id => 88)
GameServer.create(
          :name => "西南天府",
          :game_id => 88)
GameServer.create(
          :name => "西北一区",
          :game_id => 88)
  end

  def self.down
  end
end
