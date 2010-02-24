class AddTiantangData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "王族",
        :game_id => 85)
GameProfession.create(
        :name => "骑士",
        :game_id => 85)
GameProfession.create(
        :name => "妖精",
        :game_id => 85)
GameProfession.create(
        :name => "魔法师",
        :game_id => 85)
GameProfession.create(
        :name => "黑暗精灵",
        :game_id => 85)
gamearea1 = GameArea.create(
          :name => "免费区",
          :game_id => 85)
GameServer.create(
          :name => "天堂世纪",
          :game_id => 85,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "永恒经典",
          :game_id => 85,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "梦幻战场",
          :game_id => 85,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "龙腾辉煌",
          :game_id => 85,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "生命英雄",
          :game_id => 85,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "时间区",
          :game_id => 85)
GameServer.create(
          :name => "善神殷海萨",
          :game_id => 85,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "邪神格兰肯",
          :game_id => 85,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "水神伊娃",
          :game_id => 85,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "暗龙艾里克鲁尼",
          :game_id => 85,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "王子特洛斯",
          :game_id => 85,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "骑士朱利安",
          :game_id => 85,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
