class AddPaopaotangData < ActiveRecord::Migration
  def self.up
GameServer.create(
          :name => "一区开心乐园",
          :game_id => 79)
GameServer.create(
          :name => "二区梦幻王国",
          :game_id => 79)
GameServer.create(
          :name => "三区童话世界",
          :game_id => 79)
GameServer.create(
          :name => "四区缘分天空",
          :game_id => 79)
GameServer.create(
          :name => "五区星梦奇缘",
          :game_id => 79)
GameServer.create(
          :name => "六区紫禁之巅",
          :game_id => 79)
  end

  def self.down
  end
end
