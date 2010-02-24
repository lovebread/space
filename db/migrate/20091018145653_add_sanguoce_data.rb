class AddSanguoceData < ActiveRecord::Migration
  def self.up
gamearea1 = GameArea.create(
          :name => "电信一区",
          :game_id => 27)
GameServer.create(
          :name => "名扬四海",
          :game_id => 27,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "群英会",
          :game_id => 27,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "定军山",
          :game_id => 27,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "神亭岭",
          :game_id => 27,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "卧龙岗",
          :game_id => 27,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信二区",
          :game_id => 27)
GameServer.create(
          :name => "洛神赋",
          :game_id => 27,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "逍遥津",
          :game_id => 27,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "将军令",
          :game_id => 27,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "战官渡",
          :game_id => 27,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "虎牢关",
          :game_id => 27,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "赤壁赋",
          :game_id => 27,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "连环计",
          :game_id => 27,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "铜雀台",
          :game_id => 27,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "电信三区",
          :game_id => 27)
GameServer.create(
          :name => "天荡山",
          :game_id => 27,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "博望坡",
          :game_id => 27,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "网通一区",
          :game_id => 27)
GameServer.create(
          :name => "金戈铁马",
          :game_id => 27,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "出师表",
          :game_id => 27,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "浪淘沙",
          :game_id => 27,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "网通二区",
          :game_id => 27)
GameServer.create(
          :name => "青梅煮酒",
          :game_id => 27,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "綿竹关",
          :game_id => 27,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "兵书峡",
          :game_id => 27,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "云梦泽",
          :game_id => 27,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "网通三区",
          :game_id => 27)
GameServer.create(
          :name => "观沧海",
          :game_id => 27,
          :area_id => gamearea6.id)
  end

  def self.down
  end
end
