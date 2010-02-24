class AddJianxiaqingyuanfreeData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "武当",
        :game_id => 28)
GameProfession.create(
        :name => "天王",
        :game_id => 28)
GameProfession.create(
        :name => "峨嵋",
        :game_id => 28)
GameProfession.create(
        :name => "天忍",
        :game_id => 28)
GameProfession.create(
        :name => "唐门",
        :game_id => 28)
GameProfession.create(
        :name => "翠烟",
        :game_id => 28)
GameProfession.create(
        :name => "丐帮",
        :game_id => 28)
GameProfession.create(
        :name => "昆仑",
        :game_id => 28)
GameProfession.create(
        :name => "五毒",
        :game_id => 28)
GameProfession.create(
        :name => "少林",
        :game_id => 28)
gamearea1 = GameArea.create(
          :name => "烽火连城100区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "2服",
          :game_id => 58,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "3服",
          :game_id => 58,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "4服",
          :game_id => 58,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "烽火连城101区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "2服",
          :game_id => 58,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "烽火连城102区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "烽火连城103区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "烽火连城104区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "烽火连城105区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "烽火连城106区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "烽火连城107区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "烽火连城108区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "烽火连城109区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "烽火连城110区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "烽火连城111区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "烽火连城112区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea13.id)
gamearea14 = GameArea.create(
          :name => "烽火连城113区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea14.id)
gamearea15 = GameArea.create(
          :name => "烽火连城114区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea15.id)
gamearea16 = GameArea.create(
          :name => "烽火连城115区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea16.id)
gamearea17 = GameArea.create(
          :name => "烽火连城116区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea17.id)
gamearea18 = GameArea.create(
          :name => "烽火连城117区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea18.id)
gamearea19 = GameArea.create(
          :name => "烽火连城118区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea19.id)
gamearea20 = GameArea.create(
          :name => "烽火连城119区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea20.id)
gamearea21 = GameArea.create(
          :name => "烽火连城120区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea21.id)
gamearea22 = GameArea.create(
          :name => "烽火连城121区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea22.id)
gamearea23 = GameArea.create(
          :name => "烽火连城122区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea23.id)
gamearea24 = GameArea.create(
          :name => "烽火连城123区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea24.id)
gamearea25 = GameArea.create(
          :name => "烽火连城124区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea25.id)
gamearea26 = GameArea.create(
          :name => "烽火连城125区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea26.id)
gamearea27 = GameArea.create(
          :name => "烽火连城126区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea27.id)
gamearea28 = GameArea.create(
          :name => "烽火连城127区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea28.id)
gamearea29 = GameArea.create(
          :name => "烽火连城128区",
          :game_id => 58)
GameServer.create(
          :name => "1服",
          :game_id => 58,
          :area_id => gamearea29.id)
  end

  def self.down
  end
end
