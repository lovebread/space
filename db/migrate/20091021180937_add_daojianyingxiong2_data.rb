class AddDaojianyingxiong2Data < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "人类剑客",
        :game_id => 98)
GameProfession.create(
        :name => "人类游侠",
        :game_id => 98)
GameProfession.create(
        :name => "仙族",
        :game_id => 98)
GameProfession.create(
        :name => "妖族力士",
        :game_id => 98)
GameProfession.create(
        :name => "妖族修罗",
        :game_id => 98)
gamearea1 = GameArea.create(
          :name => "电信一区",
          :game_id => 98)
GameServer.create(
          :name => "刀剑江湖",
          :game_id => 98,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "兄弟情深",
          :game_id => 98,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "铁血英雄",
          :game_id => 98,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "独孤求败",
          :game_id => 98,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "剑舞江南",
          :game_id => 98,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "凤舞九天",
          :game_id => 98,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "五羊城",
          :game_id => 98,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "夫子庙",
          :game_id => 98,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通一区",
          :game_id => 98)
GameServer.create(
          :name => "天地英雄",
          :game_id => 98,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "情意永恒",
          :game_id => 98,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "血战江湖",
          :game_id => 98,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "趵突泉",
          :game_id => 98,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "少林寺",
          :game_id => 98,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "紫禁之巅",
          :game_id => 98,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "斗罗大陆",
          :game_id => 98,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "电信新区",
          :game_id => 98)
GameServer.create(
          :name => "沙场点兵",
          :game_id => 98,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "斗破苍穹",
          :game_id => 98,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "天府之国",
          :game_id => 98,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "潜龙剑",
          :game_id => 98,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "雄霸天下",
          :game_id => 98,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "轩辕剑",
          :game_id => 98,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "惟我独尊",
          :game_id => 98,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "光辉岁月",
          :game_id => 98,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "海阔天空",
          :game_id => 98,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "网通新区",
          :game_id => 98)
GameServer.create(
          :name => "百胜刀",
          :game_id => 98,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "傲视群雄",
          :game_id => 98,
          :area_id => gamearea4.id)
  end

  def self.down
  end
end
