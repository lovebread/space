class AddMofazhimenData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "战士",
        :game_id => 80)
GameProfession.create(
        :name => "骑士",
        :game_id => 80)
GameProfession.create(
        :name => "法师",
        :game_id => 80)
GameProfession.create(
        :name => "游侠",
        :game_id => 80)
GameProfession.create(
        :name => "影行者",
        :game_id => 80)
GameProfession.create(
        :name => "祭祀",
        :game_id => 80)
gamearea1 = GameArea.create(
          :name => "电信区",
          :game_id => 80)
GameServer.create(
          :name => "伊斯般那",
          :game_id => 80,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通区",
          :game_id => 80)
GameServer.create(
          :name => "网通",
          :game_id => 80,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
