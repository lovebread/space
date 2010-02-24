class AddYingxiongwudionlineData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "人类",
        :game_id => 64)
GameProfession.create(
        :name => "精灵",
        :game_id => 64)
GameProfession.create(
        :name => "塔楼",
        :game_id => 64)
GameProfession.create(
        :name => "地狱",
        :game_id => 64)
GameProfession.create(
        :name => "亡灵",
        :game_id => 64)
GameProfession.create(
        :name => "野蛮",
        :game_id => 64)
GameProfession.create(
        :name => "沼泽",
        :game_id => 64)
GameProfession.create(
        :name => "地下城",
        :game_id => 64)
gamearea1 = GameArea.create(
          :name => "电信一区",
          :game_id => 64)
GameServer.create(
          :name => "1服-冰霜平原",
          :game_id => 64,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "2服-东方部落",
          :game_id => 64,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "3服-翡翠丘陵",
          :game_id => 64,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "5服-低鸣猎场",
          :game_id => 64,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "6服-不夜城",
          :game_id => 64,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "7服-寂静沼泽",
          :game_id => 64,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "8服-燃烧海岸",
          :game_id => 64,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "9服-斯塔德威尔",
          :game_id => 64,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信二区",
          :game_id => 64)
GameServer.create(
          :name => "1服-冰封高原",
          :game_id => 64,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "2服-天空之城",
          :game_id => 64,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "3服-天使联盟",
          :game_id => 64,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "5服-丰收之角",
          :game_id => 64,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "6服-泰坦之箭",
          :game_id => 64,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "7服-巫妖之王",
          :game_id => 64,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "8服-勇者无敌",
          :game_id => 64,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "网通一区",
          :game_id => 64)
GameServer.create(
          :name => "1服-德尔干河",
          :game_id => 64,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "2服-宝藏之井",
          :game_id => 64,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "3服-桥梁之丘",
          :game_id => 64,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "5服-侵蚀之地",
          :game_id => 64,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "6服-龙王神力",
          :game_id => 64,
          :area_id => gamearea3.id)
  end

  def self.down
  end
end
