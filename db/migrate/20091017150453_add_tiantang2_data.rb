class AddTiantang2Data < ActiveRecord::Migration
  def self.up
GameRace.create(
        :name => "人类",
        :game_id => 4)
GameRace.create(
        :name => "精灵",
        :game_id => 4)
GameRace.create(
        :name => "黑精灵",
        :game_id => 4)
GameRace.create(
        :name => "半兽人",
        :game_id => 4)
GameRace.create(
        :name => "矮人",
        :game_id => 4)
GameProfession.create(
        :name => "战士",
        :game_id => 4)
GameProfession.create(
        :name => "法师",
        :game_id => 4)
GameServer.create(
          :name => "巴拉卡斯",
          :game_id => 4)
GameServer.create(
          :name => "象牙之塔",
          :game_id => 4)
GameServer.create(
          :name => "亚提鲍德",
          :game_id => 4)
GameServer.create(
          :name => "爱丽克斯",
          :game_id => 4)
GameServer.create(
          :name => "巴赤",
          :game_id => 4)
GameServer.create(
          :name => "安娜金",
          :game_id => 4)
GameServer.create(
          :name => "林德拜尔",
          :game_id => 4)
GameServer.create(
          :name => "史魁得",
          :game_id => 4)
GameServer.create(
          :name => "安塔瑞斯",
          :game_id => 4)
  end

  def self.down
  end
end
