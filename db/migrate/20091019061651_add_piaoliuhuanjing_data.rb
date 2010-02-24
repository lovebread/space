class AddPiaoliuhuanjingData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "凡妮莎",
        :game_id => 43)
GameProfession.create(
        :name => "丹尼尔",
        :game_id => 43)
GameProfession.create(
        :name => "贝蒂",
        :game_id => 43)
GameProfession.create(
        :name => "洛克",
        :game_id => 43)
GameProfession.create(
        :name => "席德",
        :game_id => 43)
GameProfession.create(
        :name => "莫尔",
        :game_id => 43)
GameProfession.create(
        :name => "莉可",
        :game_id => 43)
GameProfession.create(
        :name => "绀野鹤子",
        :game_id => 43)
GameProfession.create(
        :name => "爱丽丝",
        :game_id => 43)
GameProfession.create(
        :name => "玛利亚",
        :game_id => 43)
GameProfession.create(
        :name => "杰西卡",
        :game_id => 43)
GameProfession.create(
        :name => "",
        :game_id => 43)
GameServer.create(
          :name => "仙魔乐园",
          :game_id => 43)
GameServer.create(
          :name => "月光海湾",
          :game_id => 43)
GameServer.create(
          :name => "晨曦湖畔",
          :game_id => 43)
GameServer.create(
          :name => "天使&花园",
          :game_id => 43)
GameServer.create(
          :name => "水晶&公主",
          :game_id => 43)
GameServer.create(
          :name => "梦幻&仙踪",
          :game_id => 43)
GameServer.create(
          :name => "魔法&星辰",
          :game_id => 43)
GameServer.create(
          :name => "月宫仙境",
          :game_id => 43)
GameServer.create(
          :name => "森林&河畔",
          :game_id => 43)
GameServer.create(
          :name => "爱琴&空间",
          :game_id => 43)
  end

  def self.down
  end
end
