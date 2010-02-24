class AddZhengtuData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "武术系",
        :game_id => 57)
GameProfession.create(
        :name => "射术系",
        :game_id => 57)
GameProfession.create(
        :name => "法术系",
        :game_id => 57)
GameProfession.create(
        :name => "召唤系",
        :game_id => 57)
GameProfession.create(
        :name => "仙术系",
        :game_id => 57)
GameProfession.create(
        :name => "刺客系",
        :game_id => 57)
GameProfession.create(
        :name => "卫士系",
        :game_id => 57)
gamearea1 = GameArea.create(
          :name => "电信区",
          :game_id => 57)
GameServer.create(
          :name => "少年英雄",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "挥师西征",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "畅游天下",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "上古神器",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "驰骋九州",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "大漠之剑",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "梦想成真",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天之骄子",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "王者传奇",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "争雄十国",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "幻海奇缘",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "创世春秋",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "情深四起",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "漫步无双",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "万剑紫甲",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "长弓傲啸",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "诛仙英雄",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "烽火豪侠",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "春秋百战",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "风起江湖",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "烽火群儒",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "锋芒岁月",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "九州弈剑",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "龙战赤炎",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "九龙乘风",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "大旗飘扬",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "横刀立马",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "逐鹿雷霆",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "江湖千里",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "扇舞奇兵",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "封测区",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "比武专用区",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "西岭飘雪",
          :game_id => 57,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "倚天峨峰",
          :game_id => 57,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通区",
          :game_id => 57)
GameServer.create(
          :name => "壮志天涯",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "混沌世界",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "英雄争锋",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "云游天下",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "花雨家园",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "天地霸主",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "雪域天火",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "天地明月",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "共济盛世",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "星月奇侠",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "五琴飞虹",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "烽烟再起",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "把酒当歌",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "大地飞鹰",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "石破天惊",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "狂啸九天",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "风云至尊",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "幸福之旅",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "月明山青",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "楚河汉界",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "中原侠骨",
          :game_id => 57,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "比武专用区",
          :game_id => 57,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "新世界",
          :game_id => 57)
GameServer.create(
          :name => "白山黑水",
          :game_id => 57,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "皇天后土",
          :game_id => 57,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "鱼米之乡",
          :game_id => 57,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "天上人间",
          :game_id => 57,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "丝绸之路",
          :game_id => 57,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "江南水乡",
          :game_id => 57,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "滨海之都",
          :game_id => 57,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "新世界",
          :game_id => 57,
          :area_id => gamearea3.id)
  end

  def self.down
  end
end
