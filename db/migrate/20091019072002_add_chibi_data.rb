class AddChibiData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "刀",
        :game_id => 46)
GameProfession.create(
        :name => "剑",
        :game_id => 46)
GameProfession.create(
        :name => "斧",
        :game_id => 46)
GameProfession.create(
        :name => "棍",
        :game_id => 46)
GameProfession.create(
        :name => "弓",
        :game_id => 46)
GameProfession.create(
        :name => "环",
        :game_id => 46)
GameProfession.create(
        :name => "枪",
        :game_id => 46)
GameProfession.create(
        :name => "扇",
        :game_id => 46)
GameProfession.create(
        :name => "镗",
        :game_id => 46)
GameProfession.create(
        :name => "戟",
        :game_id => 46)
GameProfession.create(
        :name => "钺",
        :game_id => 46)
GameProfession.create(
        :name => "钩",
        :game_id => 46)
GameProfession.create(
        :name => "爪",
        :game_id => 46)
GameProfession.create(
        :name => "杖",
        :game_id => 46)
GameProfession.create(
        :name => "盾",
        :game_id => 46)
GameProfession.create(
        :name => "舞",
        :game_id => 46)
GameProfession.create(
        :name => "锤",
        :game_id => 46)
GameProfession.create(
        :name => "锏",
        :game_id => 46)
gamearea1 = GameArea.create(
          :name => "电信一区",
          :game_id => 46)
GameServer.create(
          :name => "飞龙",
          :game_id => 46,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "神域",
          :game_id => 46,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "神兵",
          :game_id => 46,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "荣耀",
          :game_id => 46,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "青天",
          :game_id => 46,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "武魂",
          :game_id => 46,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "英豪",
          :game_id => 46,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "白帝",
          :game_id => 46,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "龙战",
          :game_id => 46,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "凤鸣",
          :game_id => 46,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "皇朝",
          :game_id => 46,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信二区",
          :game_id => 46)
GameServer.create(
          :name => "剑门",
          :game_id => 46,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "太乙",
          :game_id => 46,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "五岳",
          :game_id => 46,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "武神",
          :game_id => 46,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "花海",
          :game_id => 46,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "神武",
          :game_id => 46,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "天羽",
          :game_id => 46,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "网通一区",
          :game_id => 46)
GameServer.create(
          :name => "逐风",
          :game_id => 46,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "鹰扬",
          :game_id => 46,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "龙尊",
          :game_id => 46,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "巅峰",
          :game_id => 46,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "奇门",
          :game_id => 46,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "卧龙",
          :game_id => 46,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "中医",
          :game_id => 46,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "神威",
          :game_id => 46,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "太极",
          :game_id => 46,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "雷帝",
          :game_id => 46,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "跨服竞技区",
          :game_id => 46)
GameServer.create(
          :name => "谁与争锋",
          :game_id => 46,
          :area_id => gamearea4.id)
  end

  def self.down
  end
end
