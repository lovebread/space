class AddTunshitiandiData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "游侠",
        :game_id => 13)
GameProfession.create(
        :name => "黄巾",
        :game_id => 13)
GameProfession.create(
        :name => "蜀汉",
        :game_id => 13)
GameProfession.create(
        :name => "曹魏",
        :game_id => 13)
GameProfession.create(
        :name => "东吴",
        :game_id => 13)
GameServer.create(
          :name => "吞食天地",
          :game_id => 13)
  end

  def self.down
  end
end
