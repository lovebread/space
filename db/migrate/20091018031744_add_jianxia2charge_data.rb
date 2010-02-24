class AddJianxia2chargeData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "五毒",
        :game_id => 7)
GameProfession.create(
        :name => "丐帮",
        :game_id => 7)
GameProfession.create(
        :name => "少林",
        :game_id => 7)
GameProfession.create(
        :name => "峨嵋",
        :game_id => 7)
GameProfession.create(
        :name => "杨门",
        :game_id => 7)
GameProfession.create(
        :name => "武当",
        :game_id => 7)
GameProfession.create(
        :name => "唐门",
        :game_id => 7)
gamearea1 = GameArea.create(
          :name => "1区（华东电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "6服",
          :game_id => 7,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "2区（华中电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "3区（华北网通）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "6服",
          :game_id => 7,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "4区（华南电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "6服",
          :game_id => 7,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "7服",
          :game_id => 7,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "5区（西南电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "6服",
          :game_id => 7,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "6区（东北网通）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "6服",
          :game_id => 7,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "7区（西北电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "8区（云南电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "9区（华东电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "6服",
          :game_id => 7,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "10区（西南电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "11区（华中电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "12区（华北网通）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "13区（华东电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea13.id)
gamearea14 = GameArea.create(
          :name => "14区（华南电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea14.id)
gamearea15 = GameArea.create(
          :name => "15区（华东电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea15.id)
gamearea16 = GameArea.create(
          :name => "16区（东北网通）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea16.id)
gamearea17 = GameArea.create(
          :name => "17区（华中电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "6服",
          :game_id => 7,
          :area_id => gamearea17.id)
gamearea18 = GameArea.create(
          :name => "18区（华北网通）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea18.id)
gamearea19 = GameArea.create(
          :name => "19区（西南电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea19.id)
gamearea20 = GameArea.create(
          :name => "20区（华南电信）",
          :game_id => 7)
GameServer.create(
          :name => "1区",
          :game_id => 7,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "2区",
          :game_id => 7,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "3区",
          :game_id => 7,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "4区",
          :game_id => 7,
          :area_id => gamearea20.id)
gamearea21 = GameArea.create(
          :name => "21区（华东电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea21.id)
gamearea22 = GameArea.create(
          :name => "22区（西北电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea22.id)
gamearea23 = GameArea.create(
          :name => "23区（西南电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea23.id)
gamearea24 = GameArea.create(
          :name => "24区（华南电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea24.id)
gamearea25 = GameArea.create(
          :name => "25区（华北网通）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea25.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea25.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea25.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea25.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea25.id)
gamearea26 = GameArea.create(
          :name => "26区（华中电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea26.id)
gamearea27 = GameArea.create(
          :name => "27区（华东电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea27.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea27.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea27.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea27.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea27.id)
gamearea28 = GameArea.create(
          :name => "28区（吉林网通）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea28.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea28.id)
gamearea29 = GameArea.create(
          :name => "29区（西南电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea29.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea29.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea29.id)
gamearea30 = GameArea.create(
          :name => "30区（华南电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea30.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea30.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea30.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea30.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea30.id)
gamearea31 = GameArea.create(
          :name => "31区（北京网通）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea31.id)
gamearea32 = GameArea.create(
          :name => "32区（铁通专区）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea32.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea32.id)
gamearea33 = GameArea.create(
          :name => "33区（华东电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea33.id)
gamearea34 = GameArea.create(
          :name => "34区（ 内蒙网通）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea34.id)
gamearea35 = GameArea.create(
          :name => "35区（黑龙江网通）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea35.id)
gamearea36 = GameArea.create(
          :name => "36区（江西电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea36.id)
gamearea37 = GameArea.create(
          :name => "37区（河南网通）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea37.id)
gamearea38 = GameArea.create(
          :name => "38区（湖北电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea38.id)
gamearea39 = GameArea.create(
          :name => "39区（西南电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea39.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea39.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea39.id)
gamearea40 = GameArea.create(
          :name => "40区（华中电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea40.id)
gamearea41 = GameArea.create(
          :name => "41区（山东网通）",
          :game_id => 7)
GameServer.create(
          :name => "1区",
          :game_id => 7,
          :area_id => gamearea41.id)
gamearea42 = GameArea.create(
          :name => "42区（华南电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea42.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea42.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea42.id)
GameServer.create(
          :name => "4服",
          :game_id => 7,
          :area_id => gamearea42.id)
GameServer.create(
          :name => "5服",
          :game_id => 7,
          :area_id => gamearea42.id)
gamearea43 = GameArea.create(
          :name => "43区（江苏电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea43.id)
gamearea44 = GameArea.create(
          :name => "44区（河南电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea44.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea44.id)
gamearea45 = GameArea.create(
          :name => "45区（华东电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea45.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea45.id)
GameServer.create(
          :name => "3服",
          :game_id => 7,
          :area_id => gamearea45.id)
gamearea46 = GameArea.create(
          :name => "46区（福建电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea46.id)
gamearea47 = GameArea.create(
          :name => "47区（湖南电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea47.id)
gamearea48 = GameArea.create(
          :name => "48区（西北电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea48.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea48.id)
gamearea49 = GameArea.create(
          :name => "49区（华东电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea49.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea49.id)
gamearea50 = GameArea.create(
          :name => "50区（华南电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea50.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea50.id)
gamearea51 = GameArea.create(
          :name => "51区（华北电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea51.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea51.id)
gamearea52 = GameArea.create(
          :name => "52区（东北电信）",
          :game_id => 7)
GameServer.create(
          :name => "1服",
          :game_id => 7,
          :area_id => gamearea52.id)
GameServer.create(
          :name => "2服",
          :game_id => 7,
          :area_id => gamearea52.id)
  end

  def self.down
  end
end
