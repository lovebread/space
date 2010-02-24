class AddJinwutuanData < ActiveRecord::Migration
  def self.up
gamearea1 = GameArea.create(
          :name => "电信游戏大区",
          :game_id => 50)
GameServer.create(
          :name => "全国同城专区",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "江苏二区",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "山西二区",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "广东二区",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华中天空sky",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "福建",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "安徽电信",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "甘肃新疆",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "湖南",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "渝都靓影",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "湖北",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "全国电信",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华中一区",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华南三区",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "西南三区",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "西北一区",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华东三区",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "西南二区",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "浙江华数",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华南二区",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "江西名智",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "江苏浪淘沙",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华东",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "陕西",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "广东BOPOMO",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "四川",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华东一区",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华东二区",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华南一区",
          :game_id => 50,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "西南一区",
          :game_id => 50,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通游戏大区",
          :game_id => 50)
GameServer.create(
          :name => "劲舞友情专区",
          :game_id => 50,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "大华北",
          :game_id => 50,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "华北网通",
          :game_id => 50,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "全国网通",
          :game_id => 50,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "华中",
          :game_id => 50,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "山东",
          :game_id => 50,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "河北",
          :game_id => 50,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "华北2区",
          :game_id => 50,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "华东网通",
          :game_id => 50,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "网通东北",
          :game_id => 50,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "黑龙江",
          :game_id => 50,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "华北一区",
          :game_id => 50,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
