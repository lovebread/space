class AddXinqijishijieData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "狂战士",
        :game_id => 49)
GameProfession.create(
        :name => "龙骑士",
        :game_id => 49)
GameProfession.create(
        :name => "圣射手",
        :game_id => 49)
GameProfession.create(
        :name => "魔法师",
        :game_id => 49)
GameProfession.create(
        :name => "暗影",
        :game_id => 49)
gamearea1 = GameArea.create(
          :name => "新电信一区",
          :game_id => 49)
GameServer.create(
          :name => "塞利安特",
          :game_id => 49,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "新网通一区",
          :game_id => 49)
GameServer.create(
          :name => "布拉齐恩",
          :game_id => 49,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "新电信二区",
          :game_id => 49)
GameServer.create(
          :name => "亚特兰蒂斯",
          :game_id => 49,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "新电信三区",
          :game_id => 49)
GameServer.create(
          :name => "辉煌成就",
          :game_id => 49,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "卓越战区",
          :game_id => 49)
GameServer.create(
          :name => "恶魔广场",
          :game_id => 49,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "伊瑟琳战区",
          :game_id => 49)
GameServer.create(
          :name => "伊瑟琳战区1服",
          :game_id => 49,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "伊瑟琳战区2服",
          :game_id => 49,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "特林格战区",
          :game_id => 49)
GameServer.create(
          :name => "特林格战区1服",
          :game_id => 49,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "特林格战区2服",
          :game_id => 49,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "沃德战区",
          :game_id => 49)
GameServer.create(
          :name => "沃德战区1服",
          :game_id => 49,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "沃德战区2服",
          :game_id => 49,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "火龙谷战区",
          :game_id => 49)
GameServer.create(
          :name => "伊瑟琳战区1服",
          :game_id => 49,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "伊瑟琳战区2服",
          :game_id => 49,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "血色战区",
          :game_id => 49)
GameServer.create(
          :name => "沃德战区1服",
          :game_id => 49,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "沃德战区2服",
          :game_id => 49,
          :area_id => gamearea10.id)
  end

  def self.down
  end
end
