class AddYongqionlineData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "峨眉",
        :game_id => 95)
GameProfession.create(
        :name => "禁军",
        :game_id => 95)
GameProfession.create(
        :name => "崆峒",
        :game_id => 95)
GameProfession.create(
        :name => "昆仑",
        :game_id => 95)
GameProfession.create(
        :name => "茅山",
        :game_id => 95)
GameProfession.create(
        :name => "蜀山",
        :game_id => 95)
GameProfession.create(
        :name => "唐门",
        :game_id => 95)
gamearea1 = GameArea.create(
          :name => "电信一区",
          :game_id => 95)
GameServer.create(
          :name => "新爱意（+缠绵+友情）",
          :game_id => 95,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "夏日嘉年华",
          :game_id => 95,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通一区",
          :game_id => 95)
GameServer.create(
          :name => "暗恋（+热恋）",
          :game_id => 95,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
