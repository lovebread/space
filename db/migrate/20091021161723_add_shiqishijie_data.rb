class AddShiqishijieData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "猎人",
        :game_id => 86)
GameProfession.create(
        :name => "乐师",
        :game_id => 86)
GameProfession.create(
        :name => "战士",
        :game_id => 86)
GameServer.create(
          :name => "一区（华东电信）",
          :game_id => 86)
GameServer.create(
          :name => "二区（华北网通）",
          :game_id => 86)
GameServer.create(
          :name => "三区（华南电信）",
          :game_id => 86)
GameServer.create(
          :name => "四区（西南电信）",
          :game_id => 86)
  end

  def self.down
  end
end
