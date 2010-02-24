class AddYingxionglianonlineData < ActiveRecord::Migration
  def self.up
GameServer.create(
          :name => "奥克角",
          :game_id => 99)
GameServer.create(
          :name => "维尔河谷",
          :game_id => 99)
GameServer.create(
          :name => "麦克积臣",
          :game_id => 99)
  end

  def self.down
  end
end
