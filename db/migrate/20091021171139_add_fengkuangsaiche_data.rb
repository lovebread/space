class AddFengkuangsaicheData < ActiveRecord::Migration
  def self.up
GameServer.create(
          :name => "一区 急速乐园",
          :game_id => 92)
GameServer.create(
          :name => "二区 欢乐时速",
          :game_id => 92)
GameServer.create(
          :name => "三区 藏宝海湾",
          :game_id => 92)
GameServer.create(
          :name => "四区 紫禁之巅",
          :game_id => 92)
GameServer.create(
          :name => "五区 我行我速",
          :game_id => 92)
  end

  def self.down
  end
end
