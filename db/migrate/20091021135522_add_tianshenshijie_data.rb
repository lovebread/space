class AddTianshenshijieData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "神秘骑士",
        :game_id => 76)
GameProfession.create(
        :name => "风之冒险家",
        :game_id => 76)
GameProfession.create(
        :name => "土精灵",
        :game_id => 76)
GameProfession.create(
        :name => "水精灵",
        :game_id => 76)
GameServer.create(
          :name => "极地雪原",
          :game_id => 76)
GameServer.create(
          :name => "水晶矿山",
          :game_id => 76)
GameServer.create(
          :name => "冰封溪谷",
          :game_id => 76)
GameServer.create(
          :name => "龙之迷宫",
          :game_id => 76)
GameServer.create(
          :name => "幻影神殿",
          :game_id => 76)
  end

  def self.down
  end
end
