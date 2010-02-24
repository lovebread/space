class AddMolibaobei2Data < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "士兵",
        :game_id => 97)
GameProfession.create(
        :name => "骑士",
        :game_id => 97)
GameProfession.create(
        :name => "弓手",
        :game_id => 97)
GameProfession.create(
        :name => "法师",
        :game_id => 97)
GameProfession.create(
        :name => "传教",
        :game_id => 97)
GameProfession.create(
        :name => "风来",
        :game_id => 97)
GameProfession.create(
        :name => "封印师",
        :game_id => 97)
GameProfession.create(
        :name => "鉴定师",
        :game_id => 97)
GameProfession.create(
        :name => "厨师",
        :game_id => 97)
GameProfession.create(
        :name => "药师",
        :game_id => 97)
GameProfession.create(
        :name => "樵夫",
        :game_id => 97)
GameProfession.create(
        :name => "猎师",
        :game_id => 97)
GameProfession.create(
        :name => "矿工",
        :game_id => 97)
GameProfession.create(
        :name => "武器师",
        :game_id => 97)
GameProfession.create(
        :name => "防具师",
        :game_id => 97)
gamearea1 = GameArea.create(
          :name => "电信大区",
          :game_id => 97)
GameServer.create(
          :name => "李贝留斯（华东）",
          :game_id => 97,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "犹大（华南）",
          :game_id => 97,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "阿鲁巴斯（西南西北）",
          :game_id => 97,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通大区",
          :game_id => 97)
GameServer.create(
          :name => "里雍（华北）",
          :game_id => 97,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
