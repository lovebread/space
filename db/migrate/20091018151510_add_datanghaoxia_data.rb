class AddDatanghaoxiaData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "少林",
        :game_id => 29)
GameProfession.create(
        :name => "蜀山剑派",
        :game_id => 29)
GameProfession.create(
        :name => "百花宫",
        :game_id => 29)
GameProfession.create(
        :name => "寒冰门",
        :game_id => 29)
GameProfession.create(
        :name => "天煞盟",
        :game_id => 29)
gamearea1 = GameArea.create(
          :name => "广东1区",
          :game_id => 29)
GameServer.create(
          :name => "胜者为王",
          :game_id => 29,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "粤海风云",
          :game_id => 29,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "浙江1区",
          :game_id => 29)
GameServer.create(
          :name => "月映天一",
          :game_id => 29,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "四川1区",
          :game_id => 29)
GameServer.create(
          :name => "剑耀西南",
          :game_id => 29,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "上海1区",
          :game_id => 29)
GameServer.create(
          :name => "风舞浦江",
          :game_id => 29,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "华北1区",
          :game_id => 29)
GameServer.create(
          :name => "倾城之战",
          :game_id => 29,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "卧虎藏龙",
          :game_id => 29,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "新网通1区",
          :game_id => 29)
GameServer.create(
          :name => "傲视四海",
          :game_id => 29,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "新电信1区",
          :game_id => 29)
GameServer.create(
          :name => "纵横江湖",
          :game_id => 29,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "威震八荒",
          :game_id => 29,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "新电信2区",
          :game_id => 29)
GameServer.create(
          :name => "剑寒九州",
          :game_id => 29,
          :area_id => gamearea8.id)
  end

  def self.down
  end
end
