class AddCaihongdaoonlineData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "战士",
        :game_id => 48)
GameProfession.create(
        :name => "盾卫",
        :game_id => 48)
GameProfession.create(
        :name => "法师",
        :game_id => 48)
GameProfession.create(
        :name => "游侠",
        :game_id => 48)
gamearea1 = GameArea.create(
          :name => "1区上海电信",
          :game_id => 48)
GameServer.create(
          :name => "哈密瓜",
          :game_id => 48,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "水蜜桃",
          :game_id => 48,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "甜蜜橙",
          :game_id => 48,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "黄香蕉",
          :game_id => 48,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "红樱桃",
          :game_id => 48,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "蓝草莓",
          :game_id => 48,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "青苹果",
          :game_id => 48,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "紫葡萄",
          :game_id => 48,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "2区网通专区",
          :game_id => 48)
GameServer.create(
          :name => "新浪网通",
          :game_id => 48,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "蓝田玉",
          :game_id => 48,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "3区/23区",
          :game_id => 48)
GameServer.create(
          :name => "黄玫瑰",
          :game_id => 48,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "彩云之南",
          :game_id => 48,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "4区西安电信",
          :game_id => 48)
GameServer.create(
          :name => "小金猪",
          :game_id => 48,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "5区/12区",
          :game_id => 48)
GameServer.create(
          :name => "虎头鲍",
          :game_id => 48,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "富贵虾",
          :game_id => 48,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "彩玲珑",
          :game_id => 48,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "6区/16区/20区",
          :game_id => 48)
GameServer.create(
          :name => "洞庭湖",
          :game_id => 48,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "芙蓉国",
          :game_id => 48,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "7区/19区",
          :game_id => 48)
GameServer.create(
          :name => "蓝地球",
          :game_id => 48,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "8区/13区/21区",
          :game_id => 48)
GameServer.create(
          :name => "醉西湖",
          :game_id => 48,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "10区重庆电信",
          :game_id => 48)
GameServer.create(
          :name => "解放碑",
          :game_id => 48,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "洪崖洞",
          :game_id => 48,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "11区/14区",
          :game_id => 48)
GameServer.create(
          :name => "人参果",
          :game_id => 48,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "15区湖北",
          :game_id => 48)
GameServer.create(
          :name => "紫贝壳",
          :game_id => 48,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "17区假日专区",
          :game_id => 48)
GameServer.create(
          :name => "欢乐谷",
          :game_id => 48,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "18区缤纷世界",
          :game_id => 48)
GameServer.create(
          :name => "摩天轮",
          :game_id => 48,
          :area_id => gamearea13.id)
  end

  def self.down
  end
end
