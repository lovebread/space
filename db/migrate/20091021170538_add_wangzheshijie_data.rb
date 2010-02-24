class AddWangzheshijieData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "剑士",
        :game_id => 91)
GameProfession.create(
        :name => "枪手",
        :game_id => 91)
GameProfession.create(
        :name => "斧手",
        :game_id => 91)
GameProfession.create(
        :name => "火枪手",
        :game_id => 91)
GameProfession.create(
        :name => "弓手",
        :game_id => 91)
GameProfession.create(
        :name => "炮手",
        :game_id => 91)
GameProfession.create(
        :name => "巫师",
        :game_id => 91)
GameProfession.create(
        :name => "狂战士",
        :game_id => 91)
GameProfession.create(
        :name => "音乐家",
        :game_id => 91)
gamearea1 = GameArea.create(
          :name => "电信一（华东）",
          :game_id => 91)
GameServer.create(
          :name => "恶魔城东海维纳斯",
          :game_id => 91,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "美第奇",
          :game_id => 91,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "阿克比萨瓦尔伊丽",
          :game_id => 91,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "神之手",
          :game_id => 91,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "战神",
          :game_id => 91,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信二（华东）",
          :game_id => 91)
GameServer.create(
          :name => "二区综合",
          :game_id => 91,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "电信三（华南）",
          :game_id => 91)
GameServer.create(
          :name => "电信三",
          :game_id => 91,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "电信四（华南）",
          :game_id => 91)
GameServer.create(
          :name => "电信四区综合",
          :game_id => 91,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "电信五（西南）",
          :game_id => 91)
GameServer.create(
          :name => "五区综合",
          :game_id => 91,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "电信六（西北）",
          :game_id => 91)
GameServer.create(
          :name => "六区综合",
          :game_id => 91,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "网通一（华北）",
          :game_id => 91)
GameServer.create(
          :name => "一区综合",
          :game_id => 91,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "弑龙者",
          :game_id => 91,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "网通二（华北）",
          :game_id => 91)
GameServer.create(
          :name => "二区综合",
          :game_id => 91,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "网通三（东北）",
          :game_id => 91)
GameServer.create(
          :name => "三区综合",
          :game_id => 91,
          :area_id => gamearea9.id)
  end

  def self.down
  end
end
