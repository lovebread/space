class AddWanmeishijieData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "武侠",
        :game_id => 39)
GameProfession.create(
        :name => "法师",
        :game_id => 39)
GameProfession.create(
        :name => "妖兽",
        :game_id => 39)
GameProfession.create(
        :name => "羽灵",
        :game_id => 39)
gamearea1 = GameArea.create(
          :name => "华东区",
          :game_id => 39)
GameServer.create(
          :name => "万里",
          :game_id => 39,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "飞花",
          :game_id => 39,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "故乡",
          :game_id => 39,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "雪龙",
          :game_id => 39,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "华北区",
          :game_id => 39)
GameServer.create(
          :name => "辉耀",
          :game_id => 39,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "逆鳞",
          :game_id => 39,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "华中区",
          :game_id => 39)
GameServer.create(
          :name => "白鸟",
          :game_id => 39,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "圣音",
          :game_id => 39,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "东北区",
          :game_id => 39)
GameServer.create(
          :name => "卧龙",
          :game_id => 39,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "华南区",
          :game_id => 39)
GameServer.create(
          :name => "银河",
          :game_id => 39,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "骤雨",
          :game_id => 39,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "星辰",
          :game_id => 39,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "校园网",
          :game_id => 39)
GameServer.create(
          :name => "金缕",
          :game_id => 39,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "西南区",
          :game_id => 39)
GameServer.create(
          :name => "威武",
          :game_id => 39,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "剑阁",
          :game_id => 39,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "西北区",
          :game_id => 39)
GameServer.create(
          :name => "长天",
          :game_id => 39,
          :area_id => gamearea8.id)
  end

  def self.down
  end
end
