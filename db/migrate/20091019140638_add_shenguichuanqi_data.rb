class AddShenguichuanqiData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "战士",
        :game_id => 51)
GameProfession.create(
        :name => "骑士",
        :game_id => 51)
GameProfession.create(
        :name => "刺客",
        :game_id => 51)
GameProfession.create(
        :name => "法师",
        :game_id => 51)
GameProfession.create(
        :name => "牧师",
        :game_id => 51)
gamearea1 = GameArea.create(
          :name => "电信一区",
          :game_id => 51)
GameServer.create(
          :name => "加勒比",
          :game_id => 51,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "黄金岛",
          :game_id => 51,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "威尼斯",
          :game_id => 51,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "狮鹫崖",
          :game_id => 51,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "斯巴达",
          :game_id => 51,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "复活岛",
          :game_id => 51,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "冰雪城",
          :game_id => 51,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "英雄岛",
          :game_id => 51,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "龙帝陵",
          :game_id => 51,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "国王谷",
          :game_id => 51,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "秦皇陵",
          :game_id => 51,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "玛雅城",
          :game_id => 51,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信二区",
          :game_id => 51)
GameServer.create(
          :name => "勇士岛",
          :game_id => 51,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "苏伊士",
          :game_id => 51,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "金银岛",
          :game_id => 51,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "皇后岛",
          :game_id => 51,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "灵魂岛",
          :game_id => 51,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "梦世界",
          :game_id => 51,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "电信三区",
          :game_id => 51)
GameServer.create(
          :name => "雅典城",
          :game_id => 51,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "凤凰城",
          :game_id => 51,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "通天塔",
          :game_id => 51,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "好望角",
          :game_id => 51,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "狮心城",
          :game_id => 51,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "六芒星",
          :game_id => 51,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "双子星",
          :game_id => 51,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "世界树",
          :game_id => 51,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "凡尔赛",
          :game_id => 51,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "修罗殿",
          :game_id => 51,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "宙斯庙",
          :game_id => 51,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "电信四区",
          :game_id => 51)
GameServer.create(
          :name => "拜占庭",
          :game_id => 51,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "罗浮宫",
          :game_id => 51,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "马其顿",
          :game_id => 51,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "无冬城",
          :game_id => 51,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "凯旋门",
          :game_id => 51,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "华南电信",
          :game_id => 51)
GameServer.create(
          :name => "雅典娜",
          :game_id => 51,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "阿瑞斯",
          :game_id => 51,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "网通一区",
          :game_id => 51)
GameServer.create(
          :name => "莱茵河",
          :game_id => 51,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "坦丁堡",
          :game_id => 51,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "月光湖",
          :game_id => 51,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "雾之国",
          :game_id => 51,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "黄金城",
          :game_id => 51,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "生命树",
          :game_id => 51,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "网通二区",
          :game_id => 51)
GameServer.create(
          :name => "雷神锤",
          :game_id => 51,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "黄金龙",
          :game_id => 51,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "魔导师",
          :game_id => 51,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "光明神",
          :game_id => 51,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "魔幻岛",
          :game_id => 51,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "铁剑湾",
          :game_id => 51,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "珊瑚岛",
          :game_id => 51,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "火羽峰",
          :game_id => 51,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "网通三区",
          :game_id => 51)
GameServer.create(
          :name => "冥斗士",
          :game_id => 51,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "圣斗士",
          :game_id => 51,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "角斗士",
          :game_id => 51,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "狮子王",
          :game_id => 51,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "人马王",
          :game_id => 51,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "黑暗神",
          :game_id => 51,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "太阳神",
          :game_id => 51,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "圣骑士",
          :game_id => 51,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "鹰身人",
          :game_id => 51,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "网通四区",
          :game_id => 51)
GameServer.create(
          :name => "所罗门",
          :game_id => 51,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "火焰神",
          :game_id => 51,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "亚瑟王",
          :game_id => 51,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "暗影王",
          :game_id => 51,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "电信西部区",
          :game_id => 51)
GameServer.create(
          :name => "创世纪",
          :game_id => 51,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "多瑙河",
          :game_id => 51,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "撒哈拉",
          :game_id => 51,
          :area_id => gamearea10.id)
  end

  def self.down
  end
end
