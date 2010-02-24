class AddBawang2Data < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "法师",                                                          
        :game_id => 65)
GameProfession.create(
        :name => "骑士",                                                          
        :game_id => 65)
GameProfession.create(
        :name => "弓箭手",                                                          
        :game_id => 65)
GameProfession.create(
        :name => "猎人",                                                          
        :game_id => 65)
GameProfession.create(
        :name => "狂战士",                                                          
        :game_id => 65)
GameProfession.create(
        :name => "术士",                                                          
        :game_id => 65)
GameProfession.create(
        :name => "召唤使",                                                          
        :game_id => 65)
GameProfession.create(
        :name => "游侠",                                                          
        :game_id => 65)
GameProfession.create(
        :name => "剑客",                                                          
        :game_id => 65)
gamearea1 = GameArea.create(
          :name => "电信",
          :game_id => 65)
GameServer.create(
          :name => "电信一区",
          :game_id => 65,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "电信二区",
          :game_id => 65,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "上古英雄",
          :game_id => 65,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通",
          :game_id => 65)
GameServer.create(
          :name => "网通一区",
          :game_id => 65,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
