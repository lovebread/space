class AddJianxia2freeData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "五毒",
        :game_id => 3)
GameProfession.create(
        :name => "丐帮",
        :game_id => 3)
GameProfession.create(
        :name => "少林",
        :game_id => 3)
GameProfession.create(
        :name => "峨嵋",
        :game_id => 3)
GameProfession.create(
        :name => "杨门",
        :game_id => 3)
GameProfession.create(
        :name => "武当",
        :game_id => 3)
GameProfession.create(
        :name => "唐门",
        :game_id => 3)
gamearea1 = GameArea.create(
          :name => "100区（华东电信）",
          :game_id => 3)
GameServer.create(
          :name => "1服",
          :game_id => 3,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "2服",
          :game_id => 3,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "3服",
          :game_id => 3,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "4服",
          :game_id => 3,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "101区（华东电信）",
          :game_id => 3)
GameServer.create(
          :name => "1服",
          :game_id => 3,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "2服",
          :game_id => 3,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "3服",
          :game_id => 3,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "4服",
          :game_id => 3,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "5服",
          :game_id => 3,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "102区（华北网通）",
          :game_id => 3)
GameServer.create(
          :name => "1服",
          :game_id => 3,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "2服",
          :game_id => 3,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "3服",
          :game_id => 3,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "4服",
          :game_id => 3,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "5服",
          :game_id => 3,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "103区（华中电信）",
          :game_id => 3)
GameServer.create(
          :name => "1服",
          :game_id => 3,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "2服",
          :game_id => 3,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "3服",
          :game_id => 3,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "4服",
          :game_id => 3,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "5服",
          :game_id => 3,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "6服",
          :game_id => 3,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "7服",
          :game_id => 3,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "8服",
          :game_id => 3,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "9服",
          :game_id => 3,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "10服",
          :game_id => 3,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "104区（华东电信）",
          :game_id => 3)
GameServer.create(
          :name => "1服",
          :game_id => 3,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "2服",
          :game_id => 3,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "3服",
          :game_id => 3,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "4服",
          :game_id => 3,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "105区（华北网通）",
          :game_id => 3)
GameServer.create(
          :name => "1服",
          :game_id => 3,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "2服",
          :game_id => 3,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "3服",
          :game_id => 3,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "4服",
          :game_id => 3,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "5服",
          :game_id => 3,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "6服",
          :game_id => 3,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "7服",
          :game_id => 3,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "8服",
          :game_id => 3,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "9服",
          :game_id => 3,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "106区（华东电信）",
          :game_id => 3)
GameServer.create(
          :name => "1服",
          :game_id => 3,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "2服",
          :game_id => 3,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "3服",
          :game_id => 3,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "4服",
          :game_id => 3,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "107区（华东电信）",
          :game_id => 3)
GameServer.create(
          :name => "1服",
          :game_id => 3,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "2服",
          :game_id => 3,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "3服",
          :game_id => 3,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "4服",
          :game_id => 3,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "108区（东北网通）",
          :game_id => 3)
GameServer.create(
          :name => "1服",
          :game_id => 3,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "2服",
          :game_id => 3,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "3服",
          :game_id => 3,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "4服",
          :game_id => 3,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "5服",
          :game_id => 3,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "6服",
          :game_id => 3,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "7服",
          :game_id => 3,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "8服",
          :game_id => 3,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "9服",
          :game_id => 3,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "10服",
          :game_id => 3,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "109区（西北电信）",
          :game_id => 3)
GameServer.create(
          :name => "1服",
          :game_id => 3,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "2服",
          :game_id => 3,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "3服",
          :game_id => 3,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "4服",
          :game_id => 3,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "5服",
          :game_id => 3,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "6服",
          :game_id => 3,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "7服",
          :game_id => 3,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "8服",
          :game_id => 3,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "9服",
          :game_id => 3,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "10服",
          :game_id => 3,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "11服",
          :game_id => 3,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "110区（华南电信）",
          :game_id => 3)
GameServer.create(
          :name => "1服",
          :game_id => 3,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "2服",
          :game_id => 3,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "3服",
          :game_id => 3,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "4服",
          :game_id => 3,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "5服",
          :game_id => 3,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "6服",
          :game_id => 3,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "7服",
          :game_id => 3,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "8服",
          :game_id => 3,
          :area_id => gamearea11.id)
  end

  def self.down
  end
end
