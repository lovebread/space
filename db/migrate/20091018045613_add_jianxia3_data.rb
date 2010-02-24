class AddJianxia3Data < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "少林",
        :game_id => 10)
GameProfession.create(
        :name => "天策",
        :game_id => 10)
GameProfession.create(
        :name => "纯阳",
        :game_id => 10)
GameProfession.create(
        :name => "万花",
        :game_id => 10)
GameProfession.create(
        :name => "七秀",
        :game_id => 10)
gamearea1 = GameArea.create(
          :name => "电信一区",
          :game_id => 10)
GameServer.create(
          :name => "洛阳城",
          :game_id => 10,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "长安城",
          :game_id => 10,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "扬州城",
          :game_id => 10,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "金水镇",
          :game_id => 10,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "洛道",
          :game_id => 10,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "巴陵县",
          :game_id => 10,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "龙门荒漠",
          :game_id => 10,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "南屏山",
          :game_id => 10,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "昆仑",
          :game_id => 10,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "枫华谷",
          :game_id => 10,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信二区",
          :game_id => 10)
GameServer.create(
          :name => "空雾峰",
          :game_id => 10,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "三才阵",
          :game_id => 10,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "天工坊",
          :game_id => 10,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "灵霄峡",
          :game_id => 10,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "无盐岛",
          :game_id => 10,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "荻花宫",
          :game_id => 10,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "日轮山城",
          :game_id => 10,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "云湖天池",
          :game_id => 10,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "天子峰",
          :game_id => 10,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "白帝城",
          :game_id => 10,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "电信三区",
          :game_id => 10)
GameServer.create(
          :name => "凌烟阁",
          :game_id => 10,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "忆盈楼",
          :game_id => 10,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "三星望月",
          :game_id => 10,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "秦王殿",
          :game_id => 10,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "无极道场",
          :game_id => 10,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "纯阳宫",
          :game_id => 10,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "太极广场",
          :game_id => 10,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "大雄宝殿",
          :game_id => 10,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "达摩院",
          :game_id => 10,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "天王殿",
          :game_id => 10,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "电信四区",
          :game_id => 10)
GameServer.create(
          :name => "千机阁",
          :game_id => 10,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "燕子坞",
          :game_id => 10,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "轩辕台",
          :game_id => 10,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "少室山",
          :game_id => 10,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "午阳岗",
          :game_id => 10,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "老虎关",
          :game_id => 10,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "饮马川",
          :game_id => 10,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "思过崖",
          :game_id => 10,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "藏经阁",
          :game_id => 10,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "论剑峰",
          :game_id => 10,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "网通（一/二）区",
          :game_id => 10)
GameServer.create(
          :name => "吕洞宾",
          :game_id => 10,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "公孙幽",
          :game_id => 10,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "柳风骨",
          :game_id => 10,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "谢云流",
          :game_id => 10,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "叶孟秋",
          :game_id => 10,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "东方宇轩",
          :game_id => 10,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "李忘生",
          :game_id => 10,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "叶芷青",
          :game_id => 10,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "李承恩",
          :game_id => 10,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "玄正",
          :game_id => 10,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "林白轩",
          :game_id => 10,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "于睿",
          :game_id => 10,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "高绛婷",
          :game_id => 10,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "杨宁",
          :game_id => 10,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "僧一行",
          :game_id => 10,
          :area_id => gamearea5.id)
  end

  def self.down
  end
end
