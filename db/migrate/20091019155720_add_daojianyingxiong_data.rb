class AddDaojianyingxiongData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "人族剑客",
        :game_id => 56)
GameProfession.create(
        :name => "人族双刀",
        :game_id => 56)
GameProfession.create(
        :name => "仙族散仙",
        :game_id => 56)
GameProfession.create(
        :name => "妖族力士",
        :game_id => 56)
gamearea1 = GameArea.create(
          :name => "华北二区",
          :game_id => 56)
GameServer.create(
          :name => "碧血剑",
          :game_id => 56,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "青釭剑",
          :game_id => 56,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "封魔剑",
          :game_id => 56,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "君子剑",
          :game_id => 56,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "连环计",
          :game_id => 56,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "逐日",
          :game_id => 56,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "逆火流星",
          :game_id => 56,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "星辰",
          :game_id => 56,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "东北二区",
          :game_id => 56)
GameServer.create(
          :name => "屠龙刀",
          :game_id => 56,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "星海湾",
          :game_id => 56,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "英雄",
          :game_id => 56,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "西北二区",
          :game_id => 56)
GameServer.create(
          :name => "方天戟",
          :game_id => 56,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "华东二区",
          :game_id => 56)
GameServer.create(
          :name => "古锭刀",
          :game_id => 56,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "淑女剑",
          :game_id => 56,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "凌云",
          :game_id => 56,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "风卷残云",
          :game_id => 56,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "漫天花雨",
          :game_id => 56,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "修罗",
          :game_id => 56,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "华中二区",
          :game_id => 56)
GameServer.create(
          :name => "杀破狼",
          :game_id => 56,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "怒雷天降",
          :game_id => 56,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "刀剑",
          :game_id => 56,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "华南二区",
          :game_id => 56)
GameServer.create(
          :name => "风影刀",
          :game_id => 56,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "轩辕剑",
          :game_id => 56,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "鼎湖山",
          :game_id => 56,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "斗罗",
          :game_id => 56,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "西南二区",
          :game_id => 56)
GameServer.create(
          :name => "射日弓",
          :game_id => 56,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "美人计",
          :game_id => 56,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "美女峰",
          :game_id => 56,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "华北一区",
          :game_id => 56)
GameServer.create(
          :name => "乾坤刀",
          :game_id => 56,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "真武剑",
          :game_id => 56,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "赤焰枪",
          :game_id => 56,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "百战刀",
          :game_id => 56,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "七星剑",
          :game_id => 56,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "东北一区",
          :game_id => 56)
GameServer.create(
          :name => "七杀刀",
          :game_id => 56,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "寒光剑",
          :game_id => 56,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "西北一区",
          :game_id => 56)
GameServer.create(
          :name => "紫金刀",
          :game_id => 56,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "银月剑",
          :game_id => 56,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "华东一区",
          :game_id => 56)
GameServer.create(
          :name => "潜龙刀",
          :game_id => 56,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "七宝珠",
          :game_id => 56,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "绿玉杖",
          :game_id => 56,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "长生剑",
          :game_id => 56,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "碧玉刀",
          :game_id => 56,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "华中一区",
          :game_id => 56)
GameServer.create(
          :name => "卧龙刀",
          :game_id => 56,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "破魔刀",
          :game_id => 56,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "华南一区",
          :game_id => 56)
GameServer.create(
          :name => "鸳鸯剑",
          :game_id => 56,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "九圣刀",
          :game_id => 56,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "苍浪剑",
          :game_id => 56,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "昆吾剑",
          :game_id => 56,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "望月刀",
          :game_id => 56,
          :area_id => gamearea13.id)
gamearea14 = GameArea.create(
          :name => "西南一区",
          :game_id => 56)
GameServer.create(
          :name => "五弦琴",
          :game_id => 56,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "散花雨",
          :game_id => 56,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "孽龙锤",
          :game_id => 56,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "玄武刀",
          :game_id => 56,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "朱雀剑",
          :game_id => 56,
          :area_id => gamearea14.id)
  end

  def self.down
  end
end
