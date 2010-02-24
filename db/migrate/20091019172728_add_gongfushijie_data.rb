class AddGongfushijieData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "枪宗师",
        :game_id =>61)
GameProfession.create(
        :name => "棍宗师",
        :game_id =>61)
GameProfession.create(
        :name => "锤斧宗师",
        :game_id =>61)
GameProfession.create(
        :name => "弓宗师",
        :game_id =>61)
GameProfession.create(
        :name => "拳宗师",
        :game_id =>61)
GameProfession.create(
        :name => "刀宗师",
        :game_id =>61)
GameProfession.create(
        :name => "扇宗师",
        :game_id =>61)
GameProfession.create(
        :name => "剑宗师",
        :game_id =>61)
GameProfession.create(
        :name => "钩宗师",
        :game_id =>61)
GameProfession.create(
        :name => "心宗师",
        :game_id =>61)
gamearea1 = GameArea.create(
          :name => "绿色电信区",
          :game_id => 61)
GameServer.create(
          :name => "炎黄传人+巅峰计划",
          :game_id => 61,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "龙行天下+全面进化",
          :game_id => 61,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "绿色网通区",
          :game_id => 61)
GameServer.create(
          :name => "众志成城+津武+逐鹿",
          :game_id => 61,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "官方电信一",
          :game_id => 61)
GameServer.create(
          :name => "承影风云+无双+剑蝶",
          :game_id => 61,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "官方电信二·官方电信三",
          :game_id => 61)
GameServer.create(
          :name => "今古传奇+赤壁+神兵",
          :game_id => 61,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "官方网通一",
          :game_id => 61)
GameServer.create(
          :name => "沉鱼落雁+至尊+画心",
          :game_id => 61,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "盛大电信一",
          :game_id => 61)
GameServer.create(
          :name => "别有洞天",
          :game_id => 61,
          :area_id => gamearea6.id)
  end

  def self.down
  end
end
