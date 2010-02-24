class AddPaopaokartData < ActiveRecord::Migration
  def self.up
GameServer.create(
          :name => "电信赛车场（一区）",
          :game_id => 24)
GameServer.create(
          :name => "电信赛车场（二区）",
          :game_id => 24)
GameServer.create(
          :name => "网通赛车场（一区）",
          :game_id => 24)
GameServer.create(
          :name => "网通赛车场（二区）",
          :game_id => 24)
  end

  def self.down
  end
end
