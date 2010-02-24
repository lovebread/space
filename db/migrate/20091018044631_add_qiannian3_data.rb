class AddQiannian3Data < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "拳法",
        :game_id => 9)
GameProfession.create(
        :name => "剑法",
        :game_id => 9)
GameProfession.create(
        :name => "刀法",
        :game_id => 9)
GameProfession.create(
        :name => "槌法",
        :game_id => 9)
GameProfession.create(
        :name => "枪法",
        :game_id => 9)
GameProfession.create(
        :name => "弓术",
        :game_id => 9)
GameProfession.create(
        :name => "投法",
        :game_id => 9)
gamearea1 = GameArea.create(
          :name => "1区",
          :game_id => 9)
GameServer.create(
          :name => "千年",
          :game_id => 9,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "轮回",
          :game_id => 9,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "2区",
          :game_id => 9)
GameServer.create(
          :name => "创造",
          :game_id => 9,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "神话",
          :game_id => 9,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "3区",
          :game_id => 9)
GameServer.create(
          :name => "辉煌",
          :game_id => 9,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "永恒",
          :game_id => 9,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "4区",
          :game_id => 9)
GameServer.create(
          :name => "傲视",
          :game_id => 9,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "天下",
          :game_id => 9,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "五区",
          :game_id => 9)
GameServer.create(
          :name => "浩瀚",
          :game_id => 9,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "至尊",
          :game_id => 9,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "6区",
          :game_id => 9)
GameServer.create(
          :name => "傲天",
          :game_id => 9,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "泰斗",
          :game_id => 9,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "7区",
          :game_id => 9)
GameServer.create(
          :name => "龙腾",
          :game_id => 9,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "8区",
          :game_id => 9)
GameServer.create(
          :name => "虎跃",
          :game_id => 9,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "9区",
          :game_id => 9)
GameServer.create(
          :name => "太极",
          :game_id => 9,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "10区",
          :game_id => 9)
GameServer.create(
          :name => "征服",
          :game_id => 9,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "11区",
          :game_id => 9)
GameServer.create(
          :name => "沧海",
          :game_id => 9,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "12区",
          :game_id => 9)
GameServer.create(
          :name => "炎黄",
          :game_id => 9,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "13区",
          :game_id => 9)
GameServer.create(
          :name => "苍穹",
          :game_id => 9,
          :area_id => gamearea13.id)
gamearea14 = GameArea.create(
          :name => "15区",
          :game_id => 9)
GameServer.create(
          :name => "奇迹",
          :game_id => 9,
          :area_id => gamearea14.id)
gamearea15 = GameArea.create(
          :name => "16区",
          :game_id => 9)
GameServer.create(
          :name => "传说",
          :game_id => 9,
          :area_id => gamearea15.id)
gamearea16 = GameArea.create(
          :name => "17区",
          :game_id => 9)
GameServer.create(
          :name => "蓝天",
          :game_id => 9,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "白云",
          :game_id => 9,
          :area_id => gamearea16.id)
gamearea17 = GameArea.create(
          :name => "18区",
          :game_id => 9)
GameServer.create(
          :name => "兄弟",
          :game_id => 9,
          :area_id => gamearea17.id)
gamearea18 = GameArea.create(
          :name => "19区",
          :game_id => 9)
GameServer.create(
          :name => "天涯",
          :game_id => 9,
          :area_id => gamearea18.id)
gamearea19 = GameArea.create(
          :name => "20区",
          :game_id => 9)
GameServer.create(
          :name => "春秋",
          :game_id => 9,
          :area_id => gamearea19.id)
gamearea20 = GameArea.create(
          :name => "21区",
          :game_id => 9)
GameServer.create(
          :name => "战国",
          :game_id => 9,
          :area_id => gamearea20.id)
gamearea21 = GameArea.create(
          :name => "22区",
          :game_id => 9)
GameServer.create(
          :name => "生命",
          :game_id => 9,
          :area_id => gamearea21.id)
gamearea22 = GameArea.create(
          :name => "23区",
          :game_id => 9)
GameServer.create(
          :name => "诞生",
          :game_id => 9,
          :area_id => gamearea22.id)
gamearea23 = GameArea.create(
          :name => "24区",
          :game_id => 9)
GameServer.create(
          :name => "宏图",
          :game_id => 9,
          :area_id => gamearea23.id)
gamearea24 = GameArea.create(
          :name => "25区",
          :game_id => 9)
GameServer.create(
          :name => "霸业",
          :game_id => 9,
          :area_id => gamearea24.id)
  end

  def self.down
  end
end
