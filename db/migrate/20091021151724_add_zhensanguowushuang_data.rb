class AddZhensanguowushuangData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "董卓",
        :game_id => 82)
GameProfession.create(
        :name => "袁绍",
        :game_id => 82)
GameProfession.create(
        :name => "孙坚",
        :game_id => 82)
GameProfession.create(
        :name => "曹操",
        :game_id => 82)
GameProfession.create(
        :name => "刘备",
        :game_id => 82)
GameServer.create(
          :name => "电信一区",
          :game_id => 82)
GameServer.create(
          :name => "电信二区",
          :game_id => 82)
GameServer.create(
          :name => "网通一区",
          :game_id => 82)
GameServer.create(
          :name => "网通二区",
          :game_id => 82)
GameServer.create(
          :name => "电信四区",
          :game_id => 82)
GameServer.create(
          :name => "电信五区",
          :game_id => 82)
  end

  def self.down
  end
end
