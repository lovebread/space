class AddXiyouqjiData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "御林军",
        :game_id => 87)
GameProfession.create(
        :name => "三星洞",
        :game_id => 87)
GameProfession.create(
        :name => "化生寺",
        :game_id => 87)
GameProfession.create(
        :name => "胭脂村",
        :game_id => 87)
GameProfession.create(
        :name => "天庭",
        :game_id => 87)
GameProfession.create(
        :name => "五庄观",
        :game_id => 87)
GameProfession.create(
        :name => "水晶宫",
        :game_id => 87)
GameProfession.create(
        :name => "普陀山",
        :game_id => 87)
GameProfession.create(
        :name => "幽冥界",
        :game_id => 87)
GameProfession.create(
        :name => "兽神山",
        :game_id => 87)
GameProfession.create(
        :name => "狮驼洞",
        :game_id => 87)
GameProfession.create(
        :name => "盘丝岭",
        :game_id => 87)
gamearea1 = GameArea.create(
          :name => "电信一区",
          :game_id => 87)
GameServer.create(
          :name => "瑶池会",
          :game_id => 87,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "水帘洞",
          :game_id => 87,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "凌霄殿",
          :game_id => 87,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "火焰山",
          :game_id => 87,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "女儿国",
          :game_id => 87,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "火云洞",
          :game_id => 87,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "高老庄",
          :game_id => 87,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "莲花洞",
          :game_id => 87,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "通天河",
          :game_id => 87,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "南天门",
          :game_id => 87,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天竺山",
          :game_id => 87,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "丹霞山",
          :game_id => 87,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "七星岩",
          :game_id => 87,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "悬空寺",
          :game_id => 87,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "光明顶",
          :game_id => 87,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信二区",
          :game_id => 87)
GameServer.create(
          :name => "太和殿",
          :game_id => 87,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "烟雨楼",
          :game_id => 87,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "雨花台",
          :game_id => 87,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "玉女峰",
          :game_id => 87,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "仙女湖",
          :game_id => 87,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "九宫山",
          :game_id => 87,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "峨眉山",
          :game_id => 87,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "青云山",
          :game_id => 87,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "紫金山",
          :game_id => 87,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "网通一区",
          :game_id => 87)
GameServer.create(
          :name => "花果山",
          :game_id => 87,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "雷音寺",
          :game_id => 87,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "广寒宫",
          :game_id => 87,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "紫竹林",
          :game_id => 87,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "五行山",
          :game_id => 87,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "流沙河",
          :game_id => 87,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "凤仙郡",
          :game_id => 87,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "麒麟山",
          :game_id => 87,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "碧波潭",
          :game_id => 87,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "三魔林",
          :game_id => 87,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "桃花源",
          :game_id => 87,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "忘忧谷",
          :game_id => 87,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "金牛山",
          :game_id => 87,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "摘星台",
          :game_id => 87,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "金沙湾",
          :game_id => 87,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "网通二区",
          :game_id => 87)
GameServer.create(
          :name => "净月潭",
          :game_id => 87,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "定军山",
          :game_id => 87,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "蓬莱阁",
          :game_id => 87,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "黑风洞",
          :game_id => 87,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "仙景台",
          :game_id => 87,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "三清观",
          :game_id => 87,
          :area_id => gamearea4.id)
  end

  def self.down
  end
end
