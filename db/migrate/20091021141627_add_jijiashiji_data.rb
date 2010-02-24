class AddJijiashijiData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "强化人重装冲锋型",
        :game_id => 78)
GameProfession.create(
        :name => "强化人强殖装甲型",
        :game_id => 78)
GameProfession.create(
        :name => "自然人生化突击型",
        :game_id => 78)
GameProfession.create(
        :name => "自然人医疗防护型",
        :game_id => 78)
GameProfession.create(
        :name => "新人类电子对抗型",
        :game_id => 78)
GameProfession.create(
        :name => "新人类幽灵狙击型",
        :game_id => 78)
gamearea1 = GameArea.create(
          :name => "电信",
          :game_id => 78)
GameServer.create(
          :name => "王者",
          :game_id => 78,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "幻爵",
          :game_id => 78,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天箭星系",
          :game_id => 78,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天鹤星系",
          :game_id => 78,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通",
          :game_id => 78)
GameServer.create(
          :name => "俯冲",
          :game_id => 78,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
