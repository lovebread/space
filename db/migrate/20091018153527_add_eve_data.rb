class AddEveData < ActiveRecord::Migration
  def self.up
GameRace.create(
        :name => "艾玛族",
        :game_id => 30)
GameRace.create(
        :name => "加达里",
        :game_id => 30)
GameRace.create(
        :name => "盖伦特",
        :game_id => 30)
GameRace.create(
        :name => "米玛塔尔",
        :game_id => 30)
GameRace.create(
        :name => "朱庇特",
        :game_id => 30)
GameProfession.create(
        :name => "战士",
        :game_id => 30)
GameProfession.create(
        :name => "矿工",
        :game_id => 30)
GameProfession.create(
        :name => "制造商",
        :game_id => 30)
GameProfession.create(
        :name => "科学家",
        :game_id => 30)
GameProfession.create(
        :name => "飞行指挥官",
        :game_id => 30)
GameProfession.create(
        :name => "军事管理者",
        :game_id => 30)
GameServer.create(
          :name => "晨曦",
          :game_id => 30)
  end

  def self.down
  end
end
