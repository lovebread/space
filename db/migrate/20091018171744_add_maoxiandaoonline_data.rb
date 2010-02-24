class AddMaoxiandaoonlineData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "战士",
        :game_id => 36)
GameProfession.create(
        :name => "魔法师",
        :game_id => 36)
GameProfession.create(
        :name => "弓弩手",
        :game_id => 36)
GameProfession.create(
        :name => "飞侠",
        :game_id => 36)
gamearea1 = GameArea.create(
          :name => "暗之大陆",
          :game_id => 36)
GameServer.create(
          :name => "七星剑",
          :game_id => 36,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "云之大陆",
          :game_id => 36)
GameServer.create(
          :name => "玛利亚",
          :game_id => 36,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "阿勒斯",
          :game_id => 36,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "薇薇安",
          :game_id => 36,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "风之大陆",
          :game_id => 36)
GameServer.create(
          :name => "蓝蜗牛",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "蘑菇仔",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "绿水灵",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "漂漂猪",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "小青蛇",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "红螃蟹",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "大海龟",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "章鱼怪",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "顽皮猴",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "星精灵",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "胖企鹅",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "白雪人",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "石头人",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "紫色猫",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "大灰狼",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "小白兔",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "喷火龙",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "火野猪",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "青鳄鱼",
          :game_id => 36,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "花蘑菇",
          :game_id => 36,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "水之大陆",
          :game_id => 36)
GameServer.create(
          :name => "明珠港",
          :game_id => 36,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "童话村",
          :game_id => 36,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "玩具城",
          :game_id => 36,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "光之大陆",
          :game_id => 36)
GameServer.create(
          :name => "祖母绿",
          :game_id => 36,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "黑水晶",
          :game_id => 36,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "水晶钻",
          :game_id => 36,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "黄水晶",
          :game_id => 36,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "蓝水晶",
          :game_id => 36,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "紫水晶",
          :game_id => 36,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "海蓝石",
          :game_id => 36,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "蛋白石",
          :game_id => 36,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "石榴石",
          :game_id => 36,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "月石",
          :game_id => 36,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "星石",
          :game_id => 36,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "黄金",
          :game_id => 36,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "黑珍珠",
          :game_id => 36,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "猫眼石",
          :game_id => 36,
          :area_id => gamearea5.id)
  end

  def self.down
  end
end
