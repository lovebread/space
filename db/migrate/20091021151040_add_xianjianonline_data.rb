class AddXianjianonlineData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "剑侠",
        :game_id => 81)
GameProfession.create(
        :name => "练气士",
        :game_id => 81)
GameProfession.create(
        :name => "蝶衣舞者",
        :game_id => 81)
GameProfession.create(
        :name => "灵蛇刀客",
        :game_id => 81)
GameProfession.create(
        :name => "五灵师",
        :game_id => 81)
GameProfession.create(
        :name => "灵狐夜隐",
        :game_id => 81)
gamearea1 = GameArea.create(
          :name => "电信9区",
          :game_id => 81)
GameServer.create(
          :name => "群雄",
          :game_id => 81,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "争霸",
          :game_id => 81,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信5区（华东）",
          :game_id => 81)
GameServer.create(
          :name => "紫气东来",
          :game_id => 81,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "剑舞长空",
          :game_id => 81,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "电信6区（华东）",
          :game_id => 81)
GameServer.create(
          :name => "沧海追梦",
          :game_id => 81,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "电信7区（华中/华南）",
          :game_id => 81)
GameServer.create(
          :name => "高山流水",
          :game_id => 81,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "金戈铁马",
          :game_id => 81,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "电信8区（西南/西北）",
          :game_id => 81)
GameServer.create(
          :name => "织梦行云",
          :game_id => 81,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "心上眉间",
          :game_id => 81,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "网通3区",
          :game_id => 81)
GameServer.create(
          :name => "凌云",
          :game_id => 81,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "壮志",
          :game_id => 81,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "网通2区",
          :game_id => 81)
GameServer.create(
          :name => "浩然正气",
          :game_id => 81,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "踏雪花海",
          :game_id => 81,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "电信1区（华东）",
          :game_id => 81)
GameServer.create(
          :name => "VIP",
          :game_id => 81,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "电信2区（华东）",
          :game_id => 81)
GameServer.create(
          :name => "VIP",
          :game_id => 81,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "电信3区（华中/华南）",
          :game_id => 81)
GameServer.create(
          :name => "VIP",
          :game_id => 81,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "电信4区（西南/西北）",
          :game_id => 81)
GameServer.create(
          :name => "VIP",
          :game_id => 81,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "网通1区（华北/东北）",
          :game_id => 81)
GameServer.create(
          :name => "VIP",
          :game_id => 81,
          :area_id => gamearea12.id)
  end

  def self.down
  end
end
