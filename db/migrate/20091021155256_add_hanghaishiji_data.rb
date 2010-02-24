class AddHanghaishijiData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "商人",
        :game_id => 84)
GameProfession.create(
        :name => "探险家",
        :game_id => 84)
GameProfession.create(
        :name => "战士",
        :game_id => 84)
GameProfession.create(
        :name => "海盗",
        :game_id => 84)
gamearea1 = GameArea.create(
          :name => "电信服务器",
          :game_id => 84)
GameServer.create(
          :name => "电信30区（亚特兰蒂斯号）",
          :game_id => 84,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "电信23区（勇者号）",
          :game_id => 84,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "电信6区（圣地亚哥号）",
          :game_id => 84,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "电信3区（超越者号）",
          :game_id => 84,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "电信2区（海魂号）",
          :game_id => 84,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "电信1区（荣耀号）",
          :game_id => 84,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "电信7区（闪耀者号）",
          :game_id => 84,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通服务器",
          :game_id => 84)
GameServer.create(
          :name => "网通10区（极地冻原号）",
          :game_id => 84,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "网通8区（伊比利亚号）",
          :game_id => 84,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "网通2区（新天地号）",
          :game_id => 84,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "网通1区（荣誉号）",
          :game_id => 84,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
