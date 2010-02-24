class AddJianxiaonlinechargeData < ActiveRecord::Migration
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
          :name => "1区（华东）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "2服",
          :game_id => 28,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "3服",
          :game_id => 28,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "2区（华东）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "2服",
          :game_id => 28,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "3服",
          :game_id => 28,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "3区（华北）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "2服",
          :game_id => 28,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "3服",
          :game_id => 28,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "4区（华南）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "2服",
          :game_id => 28,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "3服",
          :game_id => 28,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "5区（西南）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "2服",
          :game_id => 28,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "6区（西南）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "2服",
          :game_id => 28,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "3服",
          :game_id => 28,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "7区（华中）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "2服",
          :game_id => 28,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "3服",
          :game_id => 28,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "8区（东北）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "2服",
          :game_id => 28,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "9区（西北）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "2服",
          :game_id => 28,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "10区（西北）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "2服",
          :game_id => 28,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "11区（江苏）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "2服",
          :game_id => 28,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "3服",
          :game_id => 28,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "12区（山东）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "2服",
          :game_id => 28,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "13区（湖北）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "2服",
          :game_id => 28,
          :area_id => gamearea13.id)
gamearea14 = GameArea.create(
          :name => "14区（黑龙江）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea14.id)
gamearea15 = GameArea.create(
          :name => "15区（山西）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea15.id)
gamearea16 = GameArea.create(
          :name => "16区（河南）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea16.id)
gamearea17 = GameArea.create(
          :name => "17区（甘肃）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea17.id)
gamearea18 = GameArea.create(
          :name => "18区（北京）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "2服",
          :game_id => 28,
          :area_id => gamearea18.id)
gamearea19 = GameArea.create(
          :name => "19区（辽宁）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea19.id)
gamearea20 = GameArea.create(
          :name => "20区（华东/华中电信）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "2服",
          :game_id => 28,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "3服",
          :game_id => 28,
          :area_id => gamearea20.id)
gamearea21 = GameArea.create(
          :name => "21区（教育网）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea21.id)
gamearea22 = GameArea.create(
          :name => "22区（华东）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea22.id)
gamearea23 = GameArea.create(
          :name => "23区（华南）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea23.id)
gamearea24 = GameArea.create(
          :name => "24区（华中）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea24.id)
gamearea25 = GameArea.create(
          :name => "25区（华南）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea25.id)
gamearea26 = GameArea.create(
          :name => "26区（华东）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea26.id)
gamearea27 = GameArea.create(
          :name => "27区（华北网通）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea27.id)
gamearea28 = GameArea.create(
          :name => "28区（电信）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea28.id)
gamearea29 = GameArea.create(
          :name => "29区（网通）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea29.id)
gamearea30 = GameArea.create(
          :name => "99区（互联星空）",
          :game_id => 28)
GameServer.create(
          :name => "1服",
          :game_id => 28,
          :area_id => gamearea30.id)
GameServer.create(
          :name => "2服",
          :game_id => 28,
          :area_id => gamearea30.id)
GameServer.create(
          :name => "3服",
          :game_id => 28,
          :area_id => gamearea30.id)
  end

  def self.down
  end
end
