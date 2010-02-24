class AddFenghuozhilvData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "战神",
        :game_id => 5)
GameProfession.create(
        :name => "金刚",
        :game_id => 5)
GameProfession.create(
        :name => "飞翎",
        :game_id => 5)
GameProfession.create(
        :name => "修罗",
        :game_id => 5)
GameProfession.create(
        :name => "灵官",
        :game_id => 5)
GameProfession.create(
        :name => "星君",
        :game_id => 5)
GameProfession.create(
        :name => "天师",
        :game_id => 5)
GameProfession.create(
        :name => "明王",
        :game_id => 5)
gamearea1 = GameArea.create(
          :name => "电信专区（原华东区、西南区）",
          :game_id => 5)
GameServer.create(
          :name => "龙牙（原龙泉、开阳）",
          :game_id => 5,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "华北区",
          :game_id => 5)
GameServer.create(
          :name => "网通1区（原网通1区、2区）-龙雀（原龙雀、回归）",
          :game_id => 5,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "华南/华中区",
          :game_id => 5)
GameServer.create(
          :name => "凝霜（原华南/华中区所有电信服）",
          :game_id => 5,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "东北区",
          :game_id => 5)
GameServer.create(
          :name => "网通21区/4区-裁决（原裁决、梁神）",
          :game_id => 5,
          :area_id => gamearea4.id)
  end

  def self.down
  end
end
