class AddXinfeifeiData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "骑士",
        :game_id => 73)
GameProfession.create(
        :name => "战士",
        :game_id => 73)
GameProfession.create(
        :name => "祭祀",
        :game_id => 73)
GameProfession.create(
        :name => "牧师",
        :game_id => 73)
GameProfession.create(
        :name => "法师",
        :game_id => 73)
GameProfession.create(
        :name => "巫师",
        :game_id => 73)
GameProfession.create(
        :name => "弓手",
        :game_id => 73)
GameProfession.create(
        :name => "刺客",
        :game_id => 73)
gamearea1 = GameArea.create(
          :name => "星梦奇缘",
          :game_id => 73)
GameServer.create(
          :name => "修罗座",
          :game_id => 73,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "飞龙座",
          :game_id => 73,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天燕座",
          :game_id => 73,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "蜂后座",
          :game_id => 73,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天马座",
          :game_id => 73,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "冰弦座",
          :game_id => 73,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "海皇座",
          :game_id => 73,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "月神座",
          :game_id => 73,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "仙宫座",
          :game_id => 73,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "极光座",
          :game_id => 73,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "女王座",
          :game_id => 73,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "龙星座",
          :game_id => 73,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "塔罗异界",
          :game_id => 73)
GameServer.create(
          :name => "白羊座",
          :game_id => 73,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "射手座",
          :game_id => 73,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "天枰座",
          :game_id => 73,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "摩羯座",
          :game_id => 73,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "狮子座",
          :game_id => 73,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "双子座",
          :game_id => 73,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "孔雀座",
          :game_id => 73,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "混沌学院",
          :game_id => 73)
gamearea3 = GameArea.create(
          :name => "Area",
          :game_id => 73)
gamearea3 = GameArea.create(
          :name => "南冕座",
          :game_id => 73)
gamearea3 = GameArea.create(
          :name => "赤焰座",
          :game_id => 73)
gamearea3 = GameArea.create(
          :name => "火云座",
          :game_id => 73)
gamearea3 = GameArea.create(
          :name => "北冕座",
          :game_id => 73)
gamearea3 = GameArea.create(
          :name => "北辰座",
          :game_id => 73)
gamearea3 = GameArea.create(
          :name => "双鱼座",
          :game_id => 73)
  end

  def self.down
  end
end
