class AddMenghuanzhuxianData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "青云门",
        :game_id => 33)
GameProfession.create(
        :name => "天音寺",
        :game_id => 33)
GameProfession.create(
        :name => "焚香谷",
        :game_id => 33)
GameProfession.create(
        :name => "鬼王宗",
        :game_id => 33)
GameProfession.create(
        :name => "圣巫教",
        :game_id => 33)
GameProfession.create(
        :name => "合欢派",
        :game_id => 33)
gamearea1 = GameArea.create(
          :name => "内测1双线互通",
          :game_id => 33)
GameServer.create(
          :name => "剑荡九州",
          :game_id => 33,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "聚首七峰",
          :game_id => 33,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "内测1电信专区",
          :game_id => 33)
GameServer.create(
          :name => "皓月千里",
          :game_id => 33,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
