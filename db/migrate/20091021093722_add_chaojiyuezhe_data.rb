class AddChaojiyuezheData < ActiveRecord::Migration
  def self.up
GameServer.create(
          :name => "劲乐王者",
          :game_id => 69)
  end

  def self.down
  end
end
