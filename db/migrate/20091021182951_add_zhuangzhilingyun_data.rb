class AddZhuangzhilingyunData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "I型战机",
        :game_id => 101)
GameProfession.create(
        :name => "M型战机",
        :game_id => 101)
GameProfession.create(
        :name => "A型战机",
        :game_id => 101)
GameProfession.create(
        :name => "B型战机",
        :game_id => 101)
gamearea1 = GameArea.create(
          :name => "电信区",
          :game_id => 101)
GameServer.create(
          :name => "麒麟座",
          :game_id => 101,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "璀璨之翼",
          :game_id => 101,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "裁决之镰",
          :game_id => 101,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通区",
          :game_id => 101)
GameServer.create(
          :name => "黄金之翼",
          :game_id => 101,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
