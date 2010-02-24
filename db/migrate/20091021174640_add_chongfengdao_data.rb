class AddChongfengdaoData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "人类",
        :game_id => 96)
GameProfession.create(
        :name => "龙人",
        :game_id => 96)
GameProfession.create(
        :name => "精灵",
        :game_id => 96)
gamearea1 = GameArea.create(
          :name => "电信区",
          :game_id => 96)
GameServer.create(
          :name => "海市蜃楼",
          :game_id => 96,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "勇者要塞",
          :game_id => 96,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "种子森林",
          :game_id => 96,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "水晶庭院",
          :game_id => 96,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "魔法密林",
          :game_id => 96,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "细语丘陵",
          :game_id => 96,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通",
          :game_id => 96)
GameServer.create(
          :name => "路易斯",
          :game_id => 96,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "雷迪诺",
          :game_id => 96,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "海尔斯",
          :game_id => 96,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
