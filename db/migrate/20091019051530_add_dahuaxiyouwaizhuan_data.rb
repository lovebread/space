class AddDahuaxiyouwaizhuanData < ActiveRecord::Migration
  def self.up
GameRace.create(
        :name => "人",
        :game_id => 41)
GameRace.create(
        :name => "仙",
        :game_id => 41)
GameRace.create(
        :name => "妖",
        :game_id => 41)
GameProfession.create(
        :name => "方寸",
        :game_id => 41)
GameProfession.create(
        :name => "大唐",
        :game_id => 41)
GameProfession.create(
        :name => "瑶池",
        :game_id => 41)
GameProfession.create(
        :name => "普陀",
        :game_id => 41)
GameProfession.create(
        :name => "白骨",
        :game_id => 41)
GameProfession.create(
        :name => "地府",
        :game_id => 41)
gamearea1 = GameArea.create(
          :name => "广东",
          :game_id => 41)
GameServer.create(
          :name => "丹霞旭日",
          :game_id => 41,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "鼎湖秀色",
          :game_id => 41,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "浙江",
          :game_id => 41)
GameServer.create(
          :name => "烟雨江南",
          :game_id => 41,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "山东",
          :game_id => 41)
GameServer.create(
          :name => "水波梁山",
          :game_id => 41,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "岱宗如何",
          :game_id => 41,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "河北",
          :game_id => 41)
GameServer.create(
          :name => "逐鹿天下",
          :game_id => 41,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "燕赵豪情",
          :game_id => 41,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "陕西",
          :game_id => 41)
GameServer.create(
          :name => "梦回长安",
          :game_id => 41,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "秦时明月",
          :game_id => 41,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "江苏",
          :game_id => 41)
GameServer.create(
          :name => "姑苏寒月",
          :game_id => 41,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "河南",
          :game_id => 41)
GameServer.create(
          :name => "问鼎中原",
          :game_id => 41,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "少林传说",
          :game_id => 41,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "山西",
          :game_id => 41)
GameServer.create(
          :name => "竹叶杏花",
          :game_id => 41,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "福建",
          :game_id => 41)
GameServer.create(
          :name => "武夷旧梦",
          :game_id => 41,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "湖北",
          :game_id => 41)
GameServer.create(
          :name => "武当之巅",
          :game_id => 41,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "川渝",
          :game_id => 41)
GameServer.create(
          :name => "蜀王春恨",
          :game_id => 41,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "内蒙",
          :game_id => 41)
GameServer.create(
          :name => "纵马牧歌",
          :game_id => 41,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "辽宁",
          :game_id => 41)
GameServer.create(
          :name => "关东往事",
          :game_id => 41,
          :area_id => gamearea13.id)
  end

  def self.down
  end
end
