class AddQijiData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "剑士",
        :game_id => 60)
GameProfession.create(
        :name => "魔法师",
        :game_id => 60)
GameProfession.create(
        :name => "弓箭手",
        :game_id => 60)
GameProfession.create(
        :name => "魔剑士",
        :game_id => 60)
GameProfession.create(
        :name => "圣导师",
        :game_id => 60)
gamearea1 = GameArea.create(
          :name => "华东电信",
          :game_id => 60)
GameServer.create(
          :name => "冰霜之城",
          :game_id => 60,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "华南电信",
          :game_id => 60)
GameServer.create(
          :name => "龙虎之争",
          :game_id => 60,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "西南电信",
          :game_id => 60)
GameServer.create(
          :name => "龙啸九天",
          :game_id => 60,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "全国电信",
          :game_id => 60)
GameServer.create(
          :name => "黄金军团",
          :game_id => 60,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "天涯聚首",
          :game_id => 60,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "VIP",
          :game_id => 60,
          :area_id => gamearea4.id)
  end

  def self.down
  end
end
