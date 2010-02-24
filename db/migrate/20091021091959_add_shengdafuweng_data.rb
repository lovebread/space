class AddShengdafuwengData < ActiveRecord::Migration
  def self.up
GameServer.create(
          :name => "富甲天下",
          :game_id => 67)
GameServer.create(
          :name => "金玉满堂",
          :game_id => 67)
GameServer.create(
          :name => "招财进宝",
          :game_id => 67)
  end

  def self.down
  end
end
