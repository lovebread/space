class AddJurenData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "突击系",
        :game_id => 37)
GameProfession.create(
        :name => "爆破系",
        :game_id => 37)
GameProfession.create(
        :name => "狙击系",
        :game_id => 37)
GameProfession.create(
        :name => "医生系",
        :game_id => 37)
GameProfession.create(
        :name => "指挥系",
        :game_id => 37)
GameProfession.create(
        :name => "特务系",
        :game_id => 37)
GameProfession.create(
        :name => "特工系",
        :game_id => 37)
GameProfession.create(
        :name => "工程系",
        :game_id => 37)
GameProfession.create(
        :name => "商人系",
        :game_id => 37)
GameProfession.create(
        :name => "驯兽系",
        :game_id => 37)
GameProfession.create(
        :name => "武术系",
        :game_id => 37)
GameProfession.create(
        :name => "舞娘系",
        :game_id => 37)
GameProfession.create(
        :name => "乐师系",
        :game_id => 37)
GameProfession.create(
        :name => "魔术系",
        :game_id => 37)
gamearea1 = GameArea.create(
          :name => "电信区",
          :game_id => 37)
GameServer.create(
          :name => "普天同庆",
          :game_id => 37,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "辉光流火",
          :game_id => 37,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "傲视群雄",
          :game_id => 37,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "铁马荒沙",
          :game_id => 37,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "醉卧沙场",
          :game_id => 37,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "核子风云",
          :game_id => 37,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "尽忠报国",
          :game_id => 37,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "擎天柱石",
          :game_id => 37,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "风雨激扬",
          :game_id => 37,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "千秋霸业",
          :game_id => 37,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "风掣雷行",
          :game_id => 37,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "浩瀚苍穹",
          :game_id => 37,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通区",
          :game_id => 37)
GameServer.create(
          :name => "四海欢腾",
          :game_id => 37,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "暴风骤雨",
          :game_id => 37,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "气吞河岳",
          :game_id => 37,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "霜剑沐雪",
          :game_id => 37,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "边关谍影",
          :game_id => 37,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "碧血丹心",
          :game_id => 37,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "威震天下",
          :game_id => 37,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "铁血军魂",
          :game_id => 37,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "剑胆琴心",
          :game_id => 37,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "双线区",
          :game_id => 37)
GameServer.create(
          :name => "傲视英豪",
          :game_id => 37,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "虎啸风生",
          :game_id => 37,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "九州龙腾",
          :game_id => 37,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "铁马扬威",
          :game_id => 37,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "九州风云",
          :game_id => 37,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "风云万里",
          :game_id => 37,
          :area_id => gamearea3.id)
  end

  def self.down
  end
end
