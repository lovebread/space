class AddTianlongbabuData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "少林",
        :game_id => 55)
GameProfession.create(
        :name => "武当",
        :game_id => 55)
GameProfession.create(
        :name => "峨嵋",
        :game_id => 55)
GameProfession.create(
        :name => "明教",
        :game_id => 55)
GameProfession.create(
        :name => "天龙",
        :game_id => 55)
GameProfession.create(
        :name => "天山",
        :game_id => 55)
GameProfession.create(
        :name => "逍遥",
        :game_id => 55)
GameProfession.create(
        :name => "丐帮",
        :game_id => 55)
GameProfession.create(
        :name => "星宿",
        :game_id => 55)
gamearea1 = GameArea.create(
          :name => "东部电信",
          :game_id => 55)
GameServer.create(
          :name => "九阴真经",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "玉女心经",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "雁翎枪",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "北冥神功",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "大力金刚指",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "七伤拳",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "蓝砂手",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "亢龙有悔",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "葵花宝典",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "飞龙在天",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "神龙摆尾",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "含沙射影",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "斗转星移",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "寒冰掌",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "蛤蟆功",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "莫邪剑",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "贪狼剑",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "慕容博",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "无崖子",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "叶二娘",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "鸠摩智",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天界",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "枯荣长老",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "仙人醉",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "花雕",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "冻顶乌龙",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "云雾茶",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "珊瑚珠",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "富贵竹",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "自习室",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "扬子江",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天宁寺",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "2008",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "万松书院",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "寒山寺",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "长蛇阵",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "栖霞山",
          :game_id => 55,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "同桌的你",
          :game_id => 55,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "南部电信",
          :game_id => 55)
GameServer.create(
          :name => "九阳真经",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "凌波微步",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "白虹剑",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "辟邪剑谱",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "玄冥神掌",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "逍遥游",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "生死符",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "一指禅",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "冰蚕掌",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "乾坤大挪移",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "无影脚",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "龙泉剑",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "天机棒",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "鱼肠剑",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "丁春秋",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "17173",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "岳老三",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "人界",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "高粱白",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "老白干",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "太白饮",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "铁观音",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "寂寞高手",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "摇钱树",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "鸳鸯佩",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "相逢桥",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "阳春白雪",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "越秀山",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "亚龙湾",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "明秀园",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "榕城书院",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "广济桥",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "锋矢阵",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "篮球馆",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "冰淇淋",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "金蛇锥",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "双鱼座",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "万山宗",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "沙场点兵",
          :game_id => 55,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "潇湘夜雨",
          :game_id => 55,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "中西部电信",
          :game_id => 55)
GameServer.create(
          :name => "关中书院",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "六脉神剑",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "五毒秘传",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "齐眉棍",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "一阳指",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "罗汉拳",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "龙爪手",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "泥鳅功",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "金钟罩",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "弹指神通",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "真武七截阵",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "李庄古镇",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "太阿剑",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "苏星河",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "李秋水",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "云中鹤",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "地界",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "竹叶青",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "黑血神针",
          :game_id => 55,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "盛世长安",
          :game_id => 55,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "西南电信一区",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "蜀南竹海",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "梅里雪山",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "天池龙宫",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "西双版纳",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "香格里拉",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "茶马古道",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "剑门蜀道",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "九寨沟",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "黄果树",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "峨嵋山",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "蝴蝶泉",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "都江堰",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "千寻塔",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "无量山",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "阿紫",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "甘露酒",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "普洱茶",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "功夫茶",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "平安扣",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "宝葫芦",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "相思河",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "忘忧谷",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "乐山大佛",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "束河古镇",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "朝天门",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "临江书院",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "鹤翼阵",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "第二食堂",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "棉花糖",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "铁莲子",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "巨蟹座",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "处女座",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "桃花阵",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "天蝎座",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "乾坤无极",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "Area",
          :game_id => 55)
gamearea4 = GameArea.create(
          :name => "华东电信一区",
          :game_id => 55)
GameServer.create(
          :name => "太湖仙岛",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "三潭印月",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "东方明珠",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "断桥残雪",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "外滩夜色",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "莲峰云海",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "崇明春色",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "枫桥夜泊",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "虎丘剑池",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "风雨钟山",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "黄浦江",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "钱塘江",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "雨花台",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "九华山",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "千岛湖",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "花果山",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "雁荡山",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "琅琊山",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "双龙洞",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "上海滩",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "烟雨楼",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "普陀山",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "城隍庙",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "雷锋塔",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "玄武岛",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "燕子坞",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "阿朱",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "冥界",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "游坦之",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "状元红",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "猴儿酒",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "西湖龙井",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "行者无双",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "玉如意",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "龙凤镯",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "连理枝",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "月牙泉",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "天目山",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "东林书院",
          :game_id => 55,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "浔阳楼",
          :game_id => 55,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "华南电信一区",
          :game_id => 55)
GameServer.create(
          :name => "天涯海角",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "桂林山水",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "漓江春色",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "九曲溪泾",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "鼓浪闻涛",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "双溪明月",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "丹霞晨曦",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "七星岩",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "五指山",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "丹霞山",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "罗浮山",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "清源山",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "黄龙洞",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "百花洲",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "阿碧",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "聚宝盆",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "象鼻山",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "灵龟塔",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "南华禅寺",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "东坡书院",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "隐贤山庄",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "九宫阵",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "牛肉干",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "梅花镖",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "深渊战场",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "狮子座",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "琼华殿",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "熊猫天天",
          :game_id => 55,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "秋水长天",
          :game_id => 55,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "华中电信一区",
          :game_id => 55)
GameServer.create(
          :name => "赤壁怀古",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "洞庭秋月",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "白马禅寺",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "湘江月色",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "庐山飞瀑",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "秀峰梦境",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "黄鹤楼",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "滕王阁",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "张家界",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "聚贤庄",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "檀香扇",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "浏阳河",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "芙蓉镇",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "天心阁",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "石鼓书院",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "南湖书院",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "劫火焚杀",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "八卦阵",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "巧克力",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "烤鱼片",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "花装弩",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "时空裂缝",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "天帝城",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "梦回连营",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "逐鹿中原",
          :game_id => 55,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "乔峰",
          :game_id => 55,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "西北电信一区",
          :game_id => 55)
GameServer.create(
          :name => "楼兰古城",
          :game_id => 55,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "大漠孤烟",
          :game_id => 55,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "敦煌飞天",
          :game_id => 55,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "昆仑山",
          :game_id => 55,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "火焰山",
          :game_id => 55,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "星宿海",
          :game_id => 55,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "夜明珠",
          :game_id => 55,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "镇北堡",
          :game_id => 55,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "兰山书院",
          :game_id => 55,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "梨花针",
          :game_id => 55,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "虚竹",
          :game_id => 55,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "华东电信二区",
          :game_id => 55)
GameServer.create(
          :name => "五峰书院",
          :game_id => 55,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "天一阁",
          :game_id => 55,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "极冰凝杀",
          :game_id => 55,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "鱼鳞阵",
          :game_id => 55,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "女生宿舍",
          :game_id => 55,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "开心果",
          :game_id => 55,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "飞蝗石",
          :game_id => 55,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "盘龙",
          :game_id => 55,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "白羊座",
          :game_id => 55,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "瑶池仙境",
          :game_id => 55,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "彩云之南",
          :game_id => 55,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "王语嫣",
          :game_id => 55,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "回风舞雪",
          :game_id => 55,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "东部电信二区",
          :game_id => 55)
GameServer.create(
          :name => "金钱镖",
          :game_id => 55,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "金牛座",
          :game_id => 55,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "射手座",
          :game_id => 55,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "雪莲花",
          :game_id => 55,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "剑舞江南",
          :game_id => 55,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "华北网通一区",
          :game_id => 55)
GameServer.create(
          :name => "紫禁之巅",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "白云古洞",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "蓬莱仙境",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "云岗石窟",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "桃园仙谷",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "马踏飞燕",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "塞外蟠龙",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "水泊梁山",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "少室晴雪",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "八达岭",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "少林寺",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "五台山",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "山海关",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "汔蒙山",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "悬空寺",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "北戴河",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "颐和园",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "光明顶",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "雁门关",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "二锅头",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "雄黄酒",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "香露茶",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "盖碗茶",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "玉扳指",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "吉祥锁",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "鸣沙山",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "什刹海",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "太行山",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "居庸关",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "清风楼",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "漳南书院",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "晋阳书院",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "秦皇古道",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "雁行阵",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "足球场",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "玉蜂针",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "摩羯座",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "天秤座",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "不冻泉",
          :game_id => 55,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "熊猫龙龙",
          :game_id => 55,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "东北网通一区",
          :game_id => 55)
GameServer.create(
          :name => "林海雪原",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "长白天池",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "官马溶洞",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "白山黑水",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "雾松翠柏",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "松花江畔",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "鸭绿江",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "兴安岭",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "凤凰山",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "珍宝岛",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "奉天府",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "水晶湖",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "老虎滩",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "中国节",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "金元宝",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "镜泊湖",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "玉佛苑",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "大乘寺",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "银冈书院",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "会宁府",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "七星阵",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "恋曲2009",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "血滴子",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "水瓶座",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "玉虚幻境",
          :game_id => 55,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "潜龙之渊",
          :game_id => 55,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "网通专区",
          :game_id => 55)
GameServer.create(
          :name => "百泉书院",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "杏花村",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "玄慈",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "君山银针",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "碧螺春",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "太祖长拳",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "紫霞秘籍",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "打狗棒法",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "易筋经",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "独孤九剑",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "落英剑法",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "太极剑法",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "小无相功",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "八卦掌",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "达摩棍",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "狮子吼",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "梯云纵",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "铁砂掌",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "拈花指",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "般若掌",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "九阴白骨爪",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "擒拿手",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "穿云刀",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "孔雀翎",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "碧血剑",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "干将剑",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "双节棍",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "萧远山",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "天山童姥",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "段延庆",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "慕容华",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "修罗",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "妖界",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "杜康",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "女儿红",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "比翼鸟",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "三生石",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "问情崖",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "汉宫秋月",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "大明湖",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "金石滩",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "万佛园",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "避暑山庄",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "百泉书院",
          :game_id => 55,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "嵩阳书院",
          :game_id => 55,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "网通二区",
          :game_id => 55)
GameServer.create(
          :name => "太清宫",
          :game_id => 55,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "玄雷击杀",
          :game_id => 55,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "偃月阵",
          :game_id => 55,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "玫瑰花",
          :game_id => 55,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "爆米花",
          :game_id => 55,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "透骨钉",
          :game_id => 55,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "永恒",
          :game_id => 55,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "双子座",
          :game_id => 55,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "许愿树",
          :game_id => 55,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "段誉",
          :game_id => 55,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "锦绣中华",
          :game_id => 55,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "长河落日",
          :game_id => 55,
          :area_id => gamearea13.id)
gamearea14 = GameArea.create(
          :name => "华北网通二区",
          :game_id => 55)
GameServer.create(
          :name => "木婉清",
          :game_id => 55,
          :area_id => gamearea14.id)
  end

  def self.down
  end
end
