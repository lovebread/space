class AddYaoguaiamengData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "战士",
        :game_id => 62)
GameProfession.create(
        :name => "法师",
        :game_id => 62)
GameProfession.create(
        :name => "牧师",
        :game_id => 62)
GameProfession.create(
        :name => "异魔",
        :game_id => 62)
GameProfession.create(
        :name => "守护",
        :game_id => 62)
GameProfession.create(
        :name => "游侠",
        :game_id => 62)
gamearea1 = GameArea.create(
          :name => "优惠区",
          :game_id => 62)
GameServer.create(
          :name => "花好月圆",
          :game_id => 62,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通区",
          :game_id => 62)
GameServer.create(
          :name => "锦绣山河",
          :game_id => 62,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "金色庄园",
          :game_id => 62,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "电信区",
          :game_id => 62)
GameServer.create(
          :name => "世外桃源",
          :game_id => 62,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "珠联璧合",
          :game_id => 62,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "荷塘月色",
          :game_id => 62,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "阳光牧场",
          :game_id => 62,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "河北联通",
          :game_id => 62)
GameServer.create(
          :name => "山海雄关",
          :game_id => 62,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "北京联通",
          :game_id => 62)
GameServer.create(
          :name => "卢沟晓月",
          :game_id => 62,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "江西电信",
          :game_id => 62)
GameServer.create(
          :name => "三清圣经",
          :game_id => 62,
          :area_id => gamearea6.id)
  end

  def self.down
  end
end
