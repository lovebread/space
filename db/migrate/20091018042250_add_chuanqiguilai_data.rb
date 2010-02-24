class AddChuanqiguilaiData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "战士",
        :game_id => 8)
GameProfession.create(
        :name => "法师",
        :game_id => 8)
GameProfession.create(
        :name => "道士",
        :game_id => 8)
gamearea1 = GameArea.create(
          :name => "一区（电信）",
          :game_id => 8)
GameServer.create(
          :name => "光芒",
          :game_id => 8,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "烈焰",
          :game_id => 8,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "雷霆",
          :game_id => 8,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "疾风",
          :game_id => 8,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "二区（网通）",
          :game_id => 8)
GameServer.create(
          :name => "渝州",
          :game_id => 8,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "峨嵋",
          :game_id => 8,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "海鼎",
          :game_id => 8,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
