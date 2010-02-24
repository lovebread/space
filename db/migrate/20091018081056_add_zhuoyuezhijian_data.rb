class AddZhuoyuezhijianData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "战士",
        :game_id => 20)
GameProfession.create(
        :name => "巫师",
        :game_id => 20)
GameProfession.create(
        :name => "道具师",
        :game_id => 20)
GameProfession.create(
        :name => "火枪手",
        :game_id => 20)
GameProfession.create(
        :name => "元素师",
        :game_id => 20)
gamearea1 = GameArea.create(
          :name => "卓越战场",
          :game_id => 20)
GameServer.create(
          :name => "命运赞歌",
          :game_id => 20,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "缤纷道具版电信大区",
          :game_id => 20)
GameServer.create(
          :name => "雷波多",
          :game_id => 20,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "太阳城",
          :game_id => 20,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "缤纷道具版网通大区",
          :game_id => 20)
GameServer.create(
          :name => "月亮城",
          :game_id => 20,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "畅爽包月办",
          :game_id => 20)
GameServer.create(
          :name => "据点风云",
          :game_id => 20,
          :area_id => gamearea4.id)
  end

  def self.down
  end
end
