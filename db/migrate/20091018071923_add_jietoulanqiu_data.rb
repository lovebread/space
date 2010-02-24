class AddJietoulanqiuData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "组织后卫",
        :game_id => 16)
GameProfession.create(
        :name => "得分后卫",
        :game_id => 16)
GameProfession.create(
        :name => "小前锋",
        :game_id => 16)
GameProfession.create(
        :name => "大前锋",
        :game_id => 16)
GameProfession.create(
        :name => "中锋",
        :game_id => 16)
gamearea1 = GameArea.create(
          :name => "电信区",
          :game_id => 16)
GameServer.create(
          :name => "街球地带",
          :game_id => 16,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "涂鸦区域",
          :game_id => 16,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "斗牛圣地",
          :game_id => 16,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "街舞公园",
          :game_id => 16,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "凤凰涅槃",
          :game_id => 16,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "岭南急速",
          :game_id => 16,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "飞跃秦关",
          :game_id => 16,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通区",
          :game_id => 16)
GameServer.create(
          :name => "嘻哈部落",
          :game_id => 16,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "自由天空",
          :game_id => 16,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "冰城沸点",
          :game_id => 16,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "商都篮球",
          :game_id => 16,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
