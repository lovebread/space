class AddDahaizhan2Data < ActiveRecord::Migration
  def self.up
gamearea1 = GameArea.create(
          :name => "网通区",
          :game_id => 68)
GameServer.create(
          :name => "衣阿华服务器",
          :game_id => 68,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "俾斯麦服务器",
          :game_id => 68,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "中途岛服务器",
          :game_id => 68,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信区",
          :game_id => 68)
GameServer.create(
          :name => "敦刻尔克服务器",
          :game_id => 68,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "皇家方舟服务器",
          :game_id => 68,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "罗德尼服务器",
          :game_id => 68,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "诺曼底服务器",
          :game_id => 68,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "华南区",
          :game_id => 68)
GameServer.create(
          :name => "勇敢服务器",
          :game_id => 68,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "维多利亚服务器",
          :game_id => 68,
          :area_id => gamearea3.id)
  end

  def self.down
  end
end
