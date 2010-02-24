class AddBaobeitankeData < ActiveRecord::Migration
  def self.up
GameRace.create(
        :name => "战士",
        :game_id => 74)
GameRace.create(
        :name => "法师",
        :game_id => 74)
GameRace.create(
        :name => "术士",
        :game_id => 74)
GameProfession.create(
        :name => "剑",
        :game_id => 74)
GameProfession.create(
        :name => "笔",
        :game_id => 74)
GameProfession.create(
        :name => "拳",
        :game_id => 74)
GameProfession.create(
        :name => "刀",
        :game_id => 74)
GameProfession.create(
        :name => "枪",
        :game_id => 74)
GameProfession.create(
        :name => "佛家",
        :game_id => 74)
GameProfession.create(
        :name => "道家",
        :game_id => 74)
GameProfession.create(
        :name => "儒家",
        :game_id => 74)
GameProfession.create(
        :name => "阴阳",
        :game_id => 74)
GameProfession.create(
        :name => "巫术",
        :game_id => 74)
GameServer.create(
          :name => "电信区",
          :game_id => 74)
GameServer.create(
          :name => "网通区",
          :game_id => 74)
  end

  def self.down
  end
end
