class AddKuailexiyouData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "力士",
        :game_id => 22)
GameProfession.create(
        :name => "猎手",
        :game_id => 22)
GameProfession.create(
        :name => "仙童",
        :game_id => 22)
GameProfession.create(
        :name => "变化师",
        :game_id => 22)
GameServer.create(
          :name => "电信一区",
          :game_id => 22)
GameServer.create(
          :name => "电信二区",
          :game_id => 22)
GameServer.create(
          :name => "广寒宫（网通）",
          :game_id => 22)
  end

  def self.down
  end
end
