class AddChaojiwuzheData < ActiveRecord::Migration
  def self.up
GameServer.create(
          :name => "全国电信",
          :game_id => 11)
GameServer.create(
          :name => "华东一区",
          :game_id => 11)
GameServer.create(
          :name => "华南一区",
          :game_id => 11)
GameServer.create(
          :name => "华北一区",
          :game_id => 11)
GameServer.create(
          :name => "黑龙江",
          :game_id => 11)
  end

  def self.down
  end
end
