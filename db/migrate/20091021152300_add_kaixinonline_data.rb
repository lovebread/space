class AddKaixinonlineData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "密宗",
        :game_id => 83)
GameProfession.create(
        :name => "望月",
        :game_id => 83)
GameProfession.create(
        :name => "修罗",
        :game_id => 83)
GameProfession.create(
        :name => "蓬莱",
        :game_id => 83)
GameProfession.create(
        :name => "蜀山",
        :game_id => 83)
gamearea1 = GameArea.create(
          :name => "福建1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "2服",
          :game_id => 83,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "3服",
          :game_id => 83,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "5服",
          :game_id => 83,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "山东1服",
          :game_id => 83)
gamearea2 = GameArea.create(
          :name => "Area",
          :game_id => 83)
gamearea2 = GameArea.create(
          :name => "1服",
          :game_id => 83)
gamearea2 = GameArea.create(
          :name => "2服",
          :game_id => 83)
gamearea2 = GameArea.create(
          :name => "3服",
          :game_id => 83)
gamearea2 = GameArea.create(
          :name => "5服",
          :game_id => 83)
gamearea2 = GameArea.create(
          :name => "Area",
          :game_id => 83)
gamearea2 = GameArea.create(
          :name => "山东1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "2服",
          :game_id => 83,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "3服",
          :game_id => 83,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "5服",
          :game_id => 83,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "6服",
          :game_id => 83,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "7服",
          :game_id => 83,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "8服",
          :game_id => 83,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "广东2区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "电信1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "2服",
          :game_id => 83,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "3服",
          :game_id => 83,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "5服",
          :game_id => 83,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "北京1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "2服",
          :game_id => 83,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "3服",
          :game_id => 83,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "5服",
          :game_id => 83,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "6服",
          :game_id => 83,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "7服",
          :game_id => 83,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "上海1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "2服",
          :game_id => 83,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "3服",
          :game_id => 83,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "5服",
          :game_id => 83,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "6服",
          :game_id => 83,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "7服",
          :game_id => 83,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "江苏1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "2服",
          :game_id => 83,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "3服",
          :game_id => 83,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "5服",
          :game_id => 83,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "6服",
          :game_id => 83,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "7服",
          :game_id => 83,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "东北1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "2服",
          :game_id => 83,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "3服",
          :game_id => 83,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "四川1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "2服",
          :game_id => 83,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "3服",
          :game_id => 83,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "湖北1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "2服",
          :game_id => 83,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "河南1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "2服",
          :game_id => 83,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "安徽1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "广西1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea13.id)
gamearea14 = GameArea.create(
          :name => "湖南1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "2服",
          :game_id => 83,
          :area_id => gamearea14.id)
gamearea15 = GameArea.create(
          :name => "湖北1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "2服",
          :game_id => 83,
          :area_id => gamearea15.id)
gamearea16 = GameArea.create(
          :name => "香港大区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea16.id)
gamearea17 = GameArea.create(
          :name => "云南1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea17.id)
gamearea18 = GameArea.create(
          :name => "江西1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea18.id)
gamearea19 = GameArea.create(
          :name => "陕西1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea19.id)
gamearea20 = GameArea.create(
          :name => "黑龙江1区",
          :game_id => 83)
GameServer.create(
          :name => "1服",
          :game_id => 83,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "2服",
          :game_id => 83,
          :area_id => gamearea20.id)
  end

  def self.down
  end
end
