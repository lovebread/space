class AddXunxianData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "金刚力士",
        :game_id => 32)
GameProfession.create(
        :name => "罗刹力士",
        :game_id => 32)
GameProfession.create(
        :name => "奇门游侠",
        :game_id => 32)
GameProfession.create(
        :name => "驭剑游侠",
        :game_id => 32)
GameProfession.create(
        :name => "掌电法师",
        :game_id => 32)
GameProfession.create(
        :name => "控火法师",
        :game_id => 32)
GameProfession.create(
        :name => "天君咒符师",
        :game_id => 32)
GameProfession.create(
        :name => "幽冥咒符师",
        :game_id => 32)
gamearea1 = GameArea.create(
          :name => "东北区",
          :game_id => 32)
GameServer.create(
          :name => "葫芦山",
          :game_id => 32,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "沙子洲",
          :game_id => 32,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "锦绣林",
          :game_id => 32,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "宁阳观",
          :game_id => 32,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "江苏区",
          :game_id => 32)
GameServer.create(
          :name => "钱宁河",
          :game_id => 32,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "天枢观",
          :game_id => 32,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "兰陵道",
          :game_id => 32,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "上海区",
          :game_id => 32)
GameServer.create(
          :name => "喇叭口",
          :game_id => 32,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "仙君阁",
          :game_id => 32,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "西南区",
          :game_id => 32)
GameServer.create(
          :name => "落雁破",
          :game_id => 32,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "虎跳峡",
          :game_id => 32,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "浙江区",
          :game_id => 32)
GameServer.create(
          :name => "东坡林",
          :game_id => 32,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "混水洞",
          :game_id => 32,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "湖北区",
          :game_id => 32)
GameServer.create(
          :name => "黄石岗",
          :game_id => 32,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "福建区",
          :game_id => 32)
GameServer.create(
          :name => "盘陀岭",
          :game_id => 32,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "西北区",
          :game_id => 32)
GameServer.create(
          :name => "不周山",
          :game_id => 32,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "四川区",
          :game_id => 32)
GameServer.create(
          :name => "白龙湖",
          :game_id => 32,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "两界山",
          :game_id => 32,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "玉峰山",
          :game_id => 32,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "安徽区",
          :game_id => 32)
GameServer.create(
          :name => "紫岚山",
          :game_id => 32,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "湖南区",
          :game_id => 32)
GameServer.create(
          :name => "七星山",
          :game_id => 32,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "广西区",
          :game_id => 32)
GameServer.create(
          :name => "九曲湾",
          :game_id => 32,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "江西区",
          :game_id => 32)
GameServer.create(
          :name => "玉华山",
          :game_id => 32,
          :area_id => gamearea13.id)
gamearea14 = GameArea.create(
          :name => "华南区",
          :game_id => 32)
GameServer.create(
          :name => "晓月庄",
          :game_id => 32,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "碧波潭",
          :game_id => 32,
          :area_id => gamearea14.id)
gamearea15 = GameArea.create(
          :name => "华中区",
          :game_id => 32)
GameServer.create(
          :name => "观星台",
          :game_id => 32,
          :area_id => gamearea15.id)
gamearea16 = GameArea.create(
          :name => "华东区",
          :game_id => 32)
GameServer.create(
          :name => "东山岛",
          :game_id => 32,
          :area_id => gamearea16.id)
gamearea17 = GameArea.create(
          :name => "北京区",
          :game_id => 32)
GameServer.create(
          :name => "凌霄殿",
          :game_id => 32,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "通天河",
          :game_id => 32,
          :area_id => gamearea17.id)
gamearea18 = GameArea.create(
          :name => "华北区",
          :game_id => 32)
GameServer.create(
          :name => "白云洞",
          :game_id => 32,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "小君观",
          :game_id => 32,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "五宁宫",
          :game_id => 32,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "五丈坡",
          :game_id => 32,
          :area_id => gamearea18.id)
gamearea19 = GameArea.create(
          :name => "东北区",
          :game_id => 32)
GameServer.create(
          :name => "黎阳道",
          :game_id => 32,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "摩云山",
          :game_id => 32,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "黑风岭",
          :game_id => 32,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "龙吟湾",
          :game_id => 32,
          :area_id => gamearea19.id)
gamearea20 = GameArea.create(
          :name => "河南区",
          :game_id => 32)
GameServer.create(
          :name => "青濡口",
          :game_id => 32,
          :area_id => gamearea20.id)
gamearea21 = GameArea.create(
          :name => "山东区",
          :game_id => 32)
GameServer.create(
          :name => "蓬莱岛",
          :game_id => 32,
          :area_id => gamearea21.id)
  end

  def self.down
  end
end
