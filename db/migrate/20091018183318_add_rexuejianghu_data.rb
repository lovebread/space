class AddRexuejianghuData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "刀客",
        :game_id => 38)
GameProfession.create(
        :name => "剑士",
        :game_id => 38)
GameProfession.create(
        :name => "医生",
        :game_id => 38)
GameProfession.create(
        :name => "枪客",
        :game_id => 38)
gamearea1 = GameArea.create(
          :name => "电信一区",
          :game_id => 38)
GameServer.create(
          :name => "惊雷",
          :game_id => 38,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "长空",
          :game_id => 38,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "傲雪",
          :game_id => 38,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "寒雨",
          :game_id => 38,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "九天",
          :game_id => 38,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信二区",
          :game_id => 38)
GameServer.create(
          :name => "东岳",
          :game_id => 38,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "无极",
          :game_id => 38,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "浩天",
          :game_id => 38,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "天籁",
          :game_id => 38,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "电信三区",
          :game_id => 38)
GameServer.create(
          :name => "巫山",
          :game_id => 38,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "神地",
          :game_id => 38,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "沧海",
          :game_id => 38,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "玄湖",
          :game_id => 38,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "天涯",
          :game_id => 38,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "电信四区",
          :game_id => 38)
GameServer.create(
          :name => "惊鸿",
          :game_id => 38,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "紫月",
          :game_id => 38,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "烟雨",
          :game_id => 38,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "旭日",
          :game_id => 38,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "电信五区",
          :game_id => 38)
GameServer.create(
          :name => "盘龙",
          :game_id => 38,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "倾城",
          :game_id => 38,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "风灵",
          :game_id => 38,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "锦绣",
          :game_id => 38,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "青虹",
          :game_id => 38,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "沉香",
          :game_id => 38,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "电信六区",
          :game_id => 38)
GameServer.create(
          :name => "苍月",
          :game_id => 38,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "星霜",
          :game_id => 38,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "网通一区",
          :game_id => 38)
GameServer.create(
          :name => "纵横",
          :game_id => 38,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "冰宫",
          :game_id => 38,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "赤峰",
          :game_id => 38,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "雪原",
          :game_id => 38,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "天池",
          :game_id => 38,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "网通二区",
          :game_id => 38)
GameServer.create(
          :name => "盛世",
          :game_id => 38,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "苍穹",
          :game_id => 38,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "雄霸",
          :game_id => 38,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "天下",
          :game_id => 38,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "网通三区",
          :game_id => 38)
GameServer.create(
          :name => "",
          :game_id => 38,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "瑶华",
          :game_id => 38,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "轩辕",
          :game_id => 38,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "灵天",
          :game_id => 38,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "寒月",
          :game_id => 38,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "网通四区",
          :game_id => 38)
GameServer.create(
          :name => "碧海",
          :game_id => 38,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "啸天",
          :game_id => 38,
          :area_id => gamearea10.id)
  end

  def self.down
  end
end
