class AddJianxiashijieData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "天王",
        :game_id => 77)
GameProfession.create(
        :name => "少林",
        :game_id => 77)
GameProfession.create(
        :name => "五毒",
        :game_id => 77)
GameProfession.create(
        :name => "唐门",
        :game_id => 77)
GameProfession.create(
        :name => "明教",
        :game_id => 77)
GameProfession.create(
        :name => "段氏",
        :game_id => 77)
GameProfession.create(
        :name => "峨眉",
        :game_id => 77)
GameProfession.create(
        :name => "翠烟",
        :game_id => 77)
GameProfession.create(
        :name => "天忍",
        :game_id => 77)
GameProfession.create(
        :name => "丐帮",
        :game_id => 77)
GameProfession.create(
        :name => "武当",
        :game_id => 77)
GameProfession.create(
        :name => "昆仑",
        :game_id => 77)
gamearea1 = GameArea.create(
          :name => "如意区",
          :game_id => 77)
GameServer.create(
          :name => "降龙伏虎",
          :game_id => 77,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天地无极",
          :game_id => 77,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "金戈铁马",
          :game_id => 77,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "西山晴雪",
          :game_id => 77,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "卢沟晓月",
          :game_id => 77,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "情意江湖",
          :game_id => 77,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "金麟区",
          :game_id => 77)
GameServer.create(
          :name => "青玉案",
          :game_id => 77,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "秦楼月",
          :game_id => 77,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "清平乐",
          :game_id => 77,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "水龙吟",
          :game_id => 77,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "忆江南",
          :game_id => 77,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "双飞燕",
          :game_id => 77,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "浪淘沙",
          :game_id => 77,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "如梦令",
          :game_id => 77,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "蝶恋花",
          :game_id => 77,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "吉祥区",
          :game_id => 77)
GameServer.create(
          :name => "望仙楼",
          :game_id => 77,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "踏青游",
          :game_id => 77,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "葬花吟",
          :game_id => 77,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "东风寒",
          :game_id => 77,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "潇湘曲",
          :game_id => 77,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "点绛唇",
          :game_id => 77,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "醉红妆",
          :game_id => 77,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "满庭芳",
          :game_id => 77,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "沁园春",
          :game_id => 77,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "北斗",
          :game_id => 77)
GameServer.create(
          :name => "阳关曲",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "鸣沙山",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "九龙山",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "凤凰山",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "汨罗江",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "翠竹溪",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "华清池",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "蓬莱阁",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "镜泊湖",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "齐仙岭",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "清心潭",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "雁门关",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "白帝城",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "蟠龙谷",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "莫高窟",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "卧龙坡",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "鸳鸯溪",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "滕王阁",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "栖霞宫",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "日月潭",
          :game_id => 77,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "青城山",
          :game_id => 77,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "紫薇区",
          :game_id => 77)
GameServer.create(
          :name => "天涯海角",
          :game_id => 77,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "苏提春晓",
          :game_id => 77,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "长白天池",
          :game_id => 77,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "楼兰古城",
          :game_id => 77,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "碧潭幽谷",
          :game_id => 77,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "天波杨府",
          :game_id => 77,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "居庸叠翠",
          :game_id => 77,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "华山绝顶",
          :game_id => 77,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "匠心别院",
          :game_id => 77,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "汉水古渡",
          :game_id => 77,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "蜀南竹海",
          :game_id => 77,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "春梅雅筑",
          :game_id => 77,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "云麓水居",
          :game_id => 77,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "悦来客栈",
          :game_id => 77,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "逍遥客栈",
          :game_id => 77,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "玄武区",
          :game_id => 77)
GameServer.create(
          :name => "西江月",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "念奴娇",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "天仙子",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "满江红",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "昆仑山",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "苍龙岭",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "金刚岭",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "罗霄山",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "杏花村",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "忘情溪",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "二龙山",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "快活林",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "千琼宫",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "轩辕谷",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "岚岳村",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "清水村",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "甘露谷",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "凌绝峰",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "摘星坪",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "云梦泽",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "飞龙堡",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "灵宝山",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "紫霞岭",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "醉仙楼",
          :game_id => 77,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "藏云轩",
          :game_id => 77,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "朱雀区",
          :game_id => 77)
GameServer.create(
          :name => "雁鸣湖",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "桃花岛",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "黄鹤楼",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "锁云渊",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "月牙泉",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "岳阳楼",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "采石矶",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "梁山泊",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "武陵山",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "南岳镇",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "寒波谷",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "樱花谷",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "无忧岛",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "大禹台",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "剑门关",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "武夷山",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "伏牛山",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "药王谷",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "桃花源",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "朱仙镇",
          :game_id => 77,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "落叶谷",
          :game_id => 77,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "白虎区",
          :game_id => 77)
GameServer.create(
          :name => "太行古道",
          :game_id => 77,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "姑苏水榭",
          :game_id => 77,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "茶马古道",
          :game_id => 77,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "龙虎幻境",
          :game_id => 77,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "怡情山庄",
          :game_id => 77,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "藏剑山庄",
          :game_id => 77,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "暮雪山庄",
          :game_id => 77,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "长江河谷",
          :game_id => 77,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "雁荡龙湫",
          :game_id => 77,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "洞庭湖畔",
          :game_id => 77,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "淮水沙洲",
          :game_id => 77,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "龙门客栈",
          :game_id => 77,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "湖畔竹林",
          :game_id => 77,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "松涛别院",
          :game_id => 77,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "风池山庄",
          :game_id => 77,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "青龙区",
          :game_id => 77)
GameServer.create(
          :name => "江津村",
          :game_id => 77,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "翡翠湖",
          :game_id => 77,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "青螺岛",
          :game_id => 77,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "居延泽",
          :game_id => 77,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "云中镇",
          :game_id => 77,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "石鼓镇",
          :game_id => 77,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "龙泉村",
          :game_id => 77,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "巴陵村",
          :game_id => 77,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "铸剑坊",
          :game_id => 77,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "九老峰",
          :game_id => 77,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "燕子坞",
          :game_id => 77,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "浣花溪",
          :game_id => 77,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "响水洞",
          :game_id => 77,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "点苍山",
          :game_id => 77,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "风陵渡",
          :game_id => 77,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "永乐镇",
          :game_id => 77,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "龙门镇",
          :game_id => 77,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "稻香村",
          :game_id => 77,
          :area_id => gamearea9.id)
  end

  def self.down
  end
end
