class AddTianziData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "刀",
        :game_id => 70)
GameProfession.create(
        :name => "剑",
        :game_id => 70)
GameProfession.create(
        :name => "笛",
        :game_id => 70)
GameProfession.create(
        :name => "弓",
        :game_id => 70)
GameProfession.create(
        :name => "符",
        :game_id => 70)
GameProfession.create(
        :name => "扇",
        :game_id => 70)
gamearea1 = GameArea.create(
          :name => "电信一",
          :game_id => 70)
GameServer.create(
          :name => "电信1-3区 风云四海",
          :game_id => 70,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "电信4-24区 群侠四方",
          :game_id => 70,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信二",
          :game_id => 70)
GameServer.create(
          :name => "电信25-43区 敦煌晨曦",
          :game_id => 70,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "电信三",
          :game_id => 70)
GameServer.create(
          :name => "电信44-50区 壮志逍遥",
          :game_id => 70,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "电信51-63区 风云群星",
          :game_id => 70,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "电信64-67区 勇气长存",
          :game_id => 70,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "电信68区 胜者为王",
          :game_id => 70,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "电信69区 鱼跃龙门",
          :game_id => 70,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "电信70区 天之骄子",
          :game_id => 70,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "网通一",
          :game_id => 70)
GameServer.create(
          :name => "网通1-20区 盛世山河",
          :game_id => 70,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "网通三",
          :game_id => 70)
GameServer.create(
          :name => "网通21-27区 霹雳风云",
          :game_id => 70,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "网通28-29区 落花天地",
          :game_id => 70,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "网通30区 洪福齐天",
          :game_id => 70,
          :area_id => gamearea5.id)
  end

  def self.down
  end
end
