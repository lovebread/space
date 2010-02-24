class AddWulinwaizhuan2Data < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "剑圣",
        :game_id => 72)
GameProfession.create(
        :name => "邪皇",
        :game_id => 72)
GameProfession.create(
        :name => "刀君",
        :game_id => 72)
GameProfession.create(
        :name => "戟神",
        :game_id => 72)
GameProfession.create(
        :name => "天师",
        :game_id => 72)
GameProfession.create(
        :name => "蛊王",
        :game_id => 72)
GameProfession.create(
        :name => "医仙",
        :game_id => 72)
GameProfession.create(
        :name => "神算",
        :game_id => 72)
gamearea1 = GameArea.create(
          :name => "电信一区",
          :game_id => 72)
GameServer.create(
          :name => "瑶池",
          :game_id => 72,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "灭世",
          :game_id => 72,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "八卦",
          :game_id => 72,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "混沌",
          :game_id => 72,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "烟雨",
          :game_id => 72,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天殇",
          :game_id => 72,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "无霜",
          :game_id => 72,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "神龙",
          :game_id => 72,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信二区",
          :game_id => 72)
GameServer.create(
          :name => "金陵",
          :game_id => 72,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "追风",
          :game_id => 72,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "万世",
          :game_id => 72,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "升龙",
          :game_id => 72,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "电信三区",
          :game_id => 72)
GameServer.create(
          :name => "化魄",
          :game_id => 72,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "天威",
          :game_id => 72,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "天地",
          :game_id => 72,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "电信四区",
          :game_id => 72)
GameServer.create(
          :name => "血苍穹",
          :game_id => 72,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "天翔",
          :game_id => 72,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "七侠镇",
          :game_id => 72,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "白云烟",
          :game_id => 72,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "碧雪冰",
          :game_id => 72,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "杀破狼",
          :game_id => 72,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "紫星河",
          :game_id => 72,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "荣耀",
          :game_id => 72,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "乱舞",
          :game_id => 72,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "笑苍生",
          :game_id => 72,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "天凤",
          :game_id => 72,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "火龙",
          :game_id => 72,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "网通一区",
          :game_id => 72)
GameServer.create(
          :name => "问天",
          :game_id => 72,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "盘古",
          :game_id => 72,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "无极",
          :game_id => 72,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "楚歌",
          :game_id => 72,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "龙吟",
          :game_id => 72,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "神兵",
          :game_id => 72,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "英雄",
          :game_id => 72,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "无羁",
          :game_id => 72,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "武神",
          :game_id => 72,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "网通二区",
          :game_id => 72)
GameServer.create(
          :name => "靛沧海",
          :game_id => 72,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "灵虚",
          :game_id => 72,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "明镜台",
          :game_id => 72,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "金晨曦",
          :game_id => 72,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "如歌",
          :game_id => 72,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "阳春",
          :game_id => 72,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "雄霸",
          :game_id => 72,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "风灵",
          :game_id => 72,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "无间狱",
          :game_id => 72,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "九天",
          :game_id => 72,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "琴吟",
          :game_id => 72,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "八里庄",
          :game_id => 72,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "天羽",
          :game_id => 72,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "天骄",
          :game_id => 72,
          :area_id => gamearea6.id)
  end

  def self.down
  end
end
