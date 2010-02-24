class AddDnfData < ActiveRecord::Migration
  def self.up
GameRace.create(
        :name => "神枪手",
        :game_id => 3)
GameRace.create(
        :name => "鬼剑士",
        :game_id => 3)
GameRace.create(
        :name => "格斗家",
        :game_id => 3)
GameRace.create(
        :name => "魔法师",
        :game_id => 3)
GameRace.create(
        :name => "圣职者",
        :game_id => 3)
GameProfession.create(
        :name => "狂战士",
        :game_id => 2)
GameProfession.create(
        :name => "阿修罗",
        :game_id => 2)
GameProfession.create(
        :name => "鬼泣",
        :game_id => 2)
GameProfession.create(
        :name => "剑魂",
        :game_id => 2)
GameProfession.create(
        :name => "气功师",
        :game_id => 2)
GameProfession.create(
        :name => "柔道家",
        :game_id => 2)
GameProfession.create(
        :name => "散打",
        :game_id => 2)
GameProfession.create(
        :name => "街霸",
        :game_id => 2)
GameProfession.create(
        :name => "魔道学者",
        :game_id => 2)
GameProfession.create(
        :name => "召唤师",
        :game_id => 2)
GameProfession.create(
        :name => "元素师",
        :game_id => 2)
GameProfession.create(
        :name => "战斗法师",
        :game_id => 2)
GameProfession.create(
        :name => "圣骑士",
        :game_id => 2)
GameProfession.create(
        :name => "驱魔师",
        :game_id => 2)
GameProfession.create(
        :name => "蓝拳圣使",
        :game_id => 2)
gamearea1 = GameArea.create(
          :name => "西北区",
          :game_id => 47)
GameServer.create(
          :name => "西北1区",
          :game_id => 47,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "西北2区",
          :game_id => 47,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "西北3区",
          :game_id => 47,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "西南区",
          :game_id => 47)
GameServer.create(
          :name => "西南1区",
          :game_id => 47,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "西南2区",
          :game_id => 47,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "西南3区",
          :game_id => 47,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "陕西区",
          :game_id => 47)
GameServer.create(
          :name => "陕西1区",
          :game_id => 47,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "陕西2区",
          :game_id => 47,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "四川区",
          :game_id => 47)
GameServer.create(
          :name => "四川1区",
          :game_id => 47,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "四川2区",
          :game_id => 47,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "四川3区",
          :game_id => 47,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "四川4区",
          :game_id => 47,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "四川5区",
          :game_id => 47,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "四川6区",
          :game_id => 47,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "重庆区",
          :game_id => 47)
GameServer.create(
          :name => "重庆1区",
          :game_id => 47,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "重庆2区",
          :game_id => 47,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "江西区",
          :game_id => 47)
GameServer.create(
          :name => "江西1区",
          :game_id => 47,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "江西2区",
          :game_id => 47,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "广东区",
          :game_id => 47)
GameServer.create(
          :name => "广东1区",
          :game_id => 47,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "广东2区",
          :game_id => 47,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "广东3区",
          :game_id => 47,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "广东4区",
          :game_id => 47,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "广东5区",
          :game_id => 47,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "广东6区",
          :game_id => 47,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "广东7区",
          :game_id => 47,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "广东8区",
          :game_id => 47,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "广东9区",
          :game_id => 47,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "广东10区",
          :game_id => 47,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "广东11区",
          :game_id => 47,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "广州1区",
          :game_id => 47,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "广州2区",
          :game_id => 47,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "广西区",
          :game_id => 47)
GameServer.create(
          :name => "广西1区",
          :game_id => 47,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "广西2区",
          :game_id => 47,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "广西3区",
          :game_id => 47,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "福建区",
          :game_id => 47)
GameServer.create(
          :name => "福建1区",
          :game_id => 47,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "福建2区",
          :game_id => 47,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "福建3区",
          :game_id => 47,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "湖北区",
          :game_id => 47)
GameServer.create(
          :name => "湖北1区",
          :game_id => 47,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "湖北2区",
          :game_id => 47,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "湖北3区",
          :game_id => 47,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "湖北4区",
          :game_id => 47,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "湖北5区",
          :game_id => 47,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "湖北6区",
          :game_id => 47,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "湖南区",
          :game_id => 47)
GameServer.create(
          :name => "湖南1区",
          :game_id => 47,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "湖南2区",
          :game_id => 47,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "湖南3区",
          :game_id => 47,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "湖南4区",
          :game_id => 47,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "湖南5区",
          :game_id => 47,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "湖南6区",
          :game_id => 47,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "安徽区",
          :game_id => 47)
GameServer.create(
          :name => "安徽1区",
          :game_id => 47,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "安徽2区",
          :game_id => 47,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "安徽3区",
          :game_id => 47,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "上海区",
          :game_id => 47)
GameServer.create(
          :name => "上海1区",
          :game_id => 47,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "上海2区",
          :game_id => 47,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "上海3区",
          :game_id => 47,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "上海4区",
          :game_id => 47,
          :area_id => gamearea13.id)
gamearea14 = GameArea.create(
          :name => "江苏区",
          :game_id => 47)
GameServer.create(
          :name => "江苏1区",
          :game_id => 47,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "江苏2区",
          :game_id => 47,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "江苏3区",
          :game_id => 47,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "江苏4区",
          :game_id => 47,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "江苏5区",
          :game_id => 47,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "江苏6区",
          :game_id => 47,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "江苏7区",
          :game_id => 47,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "江苏8区",
          :game_id => 47,
          :area_id => gamearea14.id)
gamearea15 = GameArea.create(
          :name => "浙江区",
          :game_id => 47)
GameServer.create(
          :name => "浙江1区",
          :game_id => 47,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "浙江2区",
          :game_id => 47,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "浙江3区",
          :game_id => 47,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "浙江4区",
          :game_id => 47,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "浙江5区",
          :game_id => 47,
          :area_id => gamearea15.id)
gamearea16 = GameArea.create(
          :name => "华北区",
          :game_id => 47)
GameServer.create(
          :name => "华北1区",
          :game_id => 47,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "华北2区",
          :game_id => 47,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "华北3区",
          :game_id => 47,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "华北4区",
          :game_id => 47,
          :area_id => gamearea16.id)
gamearea17 = GameArea.create(
          :name => "河北区",
          :game_id => 47)
GameServer.create(
          :name => "河北1区",
          :game_id => 47,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "河北2区",
          :game_id => 47,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "河北3区",
          :game_id => 47,
          :area_id => gamearea17.id)
gamearea18 = GameArea.create(
          :name => "东北区",
          :game_id => 47)
GameServer.create(
          :name => "东北1区",
          :game_id => 47,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "东北2区",
          :game_id => 47,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "东北3区",
          :game_id => 47,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "东北4区",
          :game_id => 47,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "东北5区",
          :game_id => 47,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "东北6区",
          :game_id => 47,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "东北7区",
          :game_id => 47,
          :area_id => gamearea18.id)
gamearea19 = GameArea.create(
          :name => "北京区",
          :game_id => 47)
GameServer.create(
          :name => "北京1区",
          :game_id => 47,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "北京2区",
          :game_id => 47,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "北京3区",
          :game_id => 47,
          :area_id => gamearea19.id)
gamearea20 = GameArea.create(
          :name => "辽宁区",
          :game_id => 47)
GameServer.create(
          :name => "辽宁1区",
          :game_id => 47,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "辽宁2区",
          :game_id => 47,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "辽宁3区",
          :game_id => 47,
          :area_id => gamearea20.id)
gamearea21 = GameArea.create(
          :name => "吉林区",
          :game_id => 47)
GameServer.create(
          :name => "吉林1区",
          :game_id => 47,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "吉林2区",
          :game_id => 47,
          :area_id => gamearea21.id)
gamearea22 = GameArea.create(
          :name => "黑龙江区",
          :game_id => 47)
GameServer.create(
          :name => "黑龙江1区",
          :game_id => 47,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "黑龙江2区",
          :game_id => 47,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "黑龙江3区",
          :game_id => 47,
          :area_id => gamearea22.id)
gamearea23 = GameArea.create(
          :name => "河南区",
          :game_id => 47)
GameServer.create(
          :name => "河南1区",
          :game_id => 47,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "河南2区",
          :game_id => 47,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "河南3区",
          :game_id => 47,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "河南4区",
          :game_id => 47,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "河南5区",
          :game_id => 47,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "河南6区",
          :game_id => 47,
          :area_id => gamearea23.id)
gamearea24 = GameArea.create(
          :name => "山东区",
          :game_id => 47)
GameServer.create(
          :name => "山东1区",
          :game_id => 47,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "山东2区",
          :game_id => 47,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "山东3区",
          :game_id => 47,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "山东4区",
          :game_id => 47,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "山东5区",
          :game_id => 47,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "山东6区",
          :game_id => 47,
          :area_id => gamearea24.id)
gamearea25 = GameArea.create(
          :name => "山西区",
          :game_id => 47)
GameServer.create(
          :name => "山西1区",
          :game_id => 47,
          :area_id => gamearea25.id)
GameServer.create(
          :name => "山西2区",
          :game_id => 47,
          :area_id => gamearea25.id)
  end

  def self.down
  end
end
