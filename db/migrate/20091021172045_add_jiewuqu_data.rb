class AddJiewuquData < ActiveRecord::Migration
  def self.up
GameServer.create(
          :name => "电信1",
          :game_id => 93)
GameServer.create(
          :name => "电信2",
          :game_id => 93)
GameServer.create(
          :name => "网通1",
          :game_id => 93)
  end

  def self.down
  end
end
