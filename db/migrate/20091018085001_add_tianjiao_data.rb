class AddTianjiaoData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "游侠",
        :game_id => 21)
GameProfession.create(
        :name => "巫师",
        :game_id => 21)
GameProfession.create(
        :name => "术士",
        :game_id => 21)
GameProfession.create(
        :name => "力士",
        :game_id => 21)
GameProfession.create(
        :name => "刺客",
        :game_id => 21)
GameServer.create(
          :name => "免费一区",
          :game_id => 21)
GameServer.create(
          :name => "免费二区",
          :game_id => 21)
GameServer.create(
          :name => "免费三区",
          :game_id => 21)
GameServer.create(
          :name => "免费四，八区",
          :game_id => 21)
GameServer.create(
          :name => "免费五区",
          :game_id => 21)
GameServer.create(
          :name => "免费六，七区",
          :game_id => 21)
GameServer.create(
          :name => "免费九区",
          :game_id => 21)
GameServer.create(
          :name => "免费十区",
          :game_id => 21)
  end

  def self.down
  end
end
