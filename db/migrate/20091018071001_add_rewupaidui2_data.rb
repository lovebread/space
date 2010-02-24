class AddRewupaidui2Data < ActiveRecord::Migration
  def self.up
GameServer.create(
          :name => "华东一区",
          :game_id => 15)
GameServer.create(
          :name => "华南一区",
          :game_id => 15)
GameServer.create(
          :name => "西部一区",
          :game_id => 15)
GameServer.create(
          :name => "华东二区",
          :game_id => 15)
GameServer.create(
          :name => "东北一区",
          :game_id => 15)
GameServer.create(
          :name => "华北一区",
          :game_id => 15)
GameServer.create(
          :name => "东北二区",
          :game_id => 15)
  end

  def self.down
  end
end
