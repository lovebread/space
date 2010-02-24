class AddHuaxia2Data < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "战士",
        :game_id => 90)
GameProfession.create(
        :name => "法师",
        :game_id => 90)
GameProfession.create(
        :name => "幻师",
        :game_id => 90)
GameProfession.create(
        :name => "暗巫",
        :game_id => 90)
gamearea1 = GameArea.create(
          :name => "一区（华南）",
          :game_id => 90)
GameServer.create(
          :name => "欢乐谷",
          :game_id => 90,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "香蜜湖",
          :game_id => 90,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "红树林",
          :game_id => 90,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "白云山",
          :game_id => 90,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "七星岩",
          :game_id => 90,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "宝芝林",
          :game_id => 90,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "忘忧谷",
          :game_id => 90,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "越秀山",
          :game_id => 90,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "二区（华东）",
          :game_id => 90)
GameServer.create(
          :name => "普陀山",
          :game_id => 90,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "云龙湖",
          :game_id => 90,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "香雪海",
          :game_id => 90,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "日月潭",
          :game_id => 90,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "龙门湾",
          :game_id => 90,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "梅龙镇",
          :game_id => 90,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "滕王阁",
          :game_id => 90,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "莫愁湖",
          :game_id => 90,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "沧浪亭",
          :game_id => 90,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "罗浮山",
          :game_id => 90,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "三区（华中）",
          :game_id => 90)
GameServer.create(
          :name => "晴川阁",
          :game_id => 90,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "滴水洞",
          :game_id => 90,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "雪花洞",
          :game_id => 90,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "黄鹤楼",
          :game_id => 90,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "四区（西南）",
          :game_id => 90)
GameServer.create(
          :name => "望江楼",
          :game_id => 90,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "寻龙山",
          :game_id => 90,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "都江堰",
          :game_id => 90,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "峨眉山",
          :game_id => 90,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "九寨沟",
          :game_id => 90,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "朝阳湖",
          :game_id => 90,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "虎跳峡",
          :game_id => 90,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "五区（华北）",
          :game_id => 90)
GameServer.create(
          :name => "祈愿坛",
          :game_id => 90,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "太和殿",
          :game_id => 90,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "颐和园",
          :game_id => 90,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "紫禁城",
          :game_id => 90,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "八达岭",
          :game_id => 90,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "松花江",
          :game_id => 90,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "太清宫",
          :game_id => 90,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "六区（东北）",
          :game_id => 90)
GameServer.create(
          :name => "山海关",
          :game_id => 90,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "兴安岭",
          :game_id => 90,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "镜泊湖",
          :game_id => 90,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "长白山",
          :game_id => 90,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "鹿鼎山",
          :game_id => 90,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "七区（西北）",
          :game_id => 90)
GameServer.create(
          :name => "钟鼓楼",
          :game_id => 90,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "兵马俑",
          :game_id => 90,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "嘉峪关",
          :game_id => 90,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "八区（华南）",
          :game_id => 90)
GameServer.create(
          :name => "吉祥苑",
          :game_id => 90,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "梧桐山",
          :game_id => 90,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "丹霞山",
          :game_id => 90,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "岳阳楼",
          :game_id => 90,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "鼎湖山",
          :game_id => 90,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "莲花山",
          :game_id => 90,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "鼓浪屿",
          :game_id => 90,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "武夷山",
          :game_id => 90,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "九区（华东）",
          :game_id => 90)
GameServer.create(
          :name => "飞来峰",
          :game_id => 90,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "钓鱼岛",
          :game_id => 90,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "寒山寺",
          :game_id => 90,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "钱塘江",
          :game_id => 90,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "千岛湖",
          :game_id => 90,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "阿里山",
          :game_id => 90,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "百草园",
          :game_id => 90,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "十区（网通）",
          :game_id => 90)
GameServer.create(
          :name => "轩辕城",
          :game_id => 90,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "少林寺",
          :game_id => 90,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "颐在五区",
          :game_id => 90,
          :area_id => gamearea10.id)
  end

  def self.down
  end
end
