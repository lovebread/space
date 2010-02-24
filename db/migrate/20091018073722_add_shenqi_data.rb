class AddShenqiData < ActiveRecord::Migration
  def self.up
GameProfession.create(
          :name => "人类战士",
          :game_id => 17)
GameProfession.create(
          :name => "人类圣骑士",
          :game_id => 17)
GameProfession.create(
          :name => "人类牧师",
          :game_id => 17)
GameProfession.create(
          :name => "白精灵刺客",
          :game_id => 17)
GameProfession.create(
          :name => "白精灵弓箭手",
          :game_id => 17)
GameProfession.create(
          :name => "白精灵魔法师",
          :game_id => 17)
GameProfession.create(
          :name => "暗精灵潜行者",
          :game_id => 17)
GameProfession.create(
          :name => "暗精灵巫师",
          :game_id => 17)
GameProfession.create(
          :name => "暗精灵祭祀",
          :game_id => 17)
GameProfession.create(
          :name => "野蛮人护卫",
          :game_id => 17)
GameProfession.create(
          :name => "野蛮人斗士",
          :game_id => 17)
GameProfession.create(
          :name => "野蛮人猎人",
          :game_id => 17)
gamearea1 = GameArea.create(
          :name => "一区-艾尔玛娜",
          :game_id => 17)
GameServer.create(
          :name => "艾泽林",
          :game_id => 17,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "艾尔博格",
          :game_id => 17,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "威尼庭",
          :game_id => 17,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "贝儿卡",
          :game_id => 17,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "风之丛林",
          :game_id => 17,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "塞尔玛伊姆",
          :game_id => 17,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "科洛斯",
          :game_id => 17,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "克劳伦",
          :game_id => 17,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "二区-威勒斯",
          :game_id => 17)
GameServer.create(
          :name => "法迪恩",
          :game_id => 17,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "白沙港",
          :game_id => 17,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "风暴海湾",
          :game_id => 17,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "埃尔顿",
          :game_id => 17,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "阿克图斯",
          :game_id => 17,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "西尔瓦伦",
          :game_id => 17,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "麦特雷安",
          :game_id => 17,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "三区-艾德里亚",
          :game_id => 17)
GameServer.create(
          :name => "幽暗镇",
          :game_id => 17,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "蓝柯丘陵",
          :game_id => 17,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "烙印地穴",
          :game_id => 17,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "利伯斯镇",
          :game_id => 17,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "亚古拉遗址",
          :game_id => 17,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "莫亚丛林",
          :game_id => 17,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "罗帕蒂安海湾",
          :game_id => 17,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "黑格伦要塞",
          :game_id => 17,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "五区-克拉伊利安",
          :game_id => 17)
GameServer.create(
          :name => "莫里斯林地",
          :game_id => 17,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "阿拉其林地",
          :game_id => 17,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "永绝湿地",
          :game_id => 17,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "海伦湿地",
          :game_id => 17,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "无际沼泽",
          :game_id => 17,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "火焰之塔",
          :game_id => 17,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "沃笛湿地",
          :game_id => 17,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "赤色混沌",
          :game_id => 17,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "六区-亚德里安",
          :game_id => 17)
GameServer.create(
          :name => "弗鲁威斯",
          :game_id => 17,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "弗特希斯",
          :game_id => 17,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "奥利森废墟",
          :game_id => 17,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "普马特斯",
          :game_id => 17,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "艾伦纳",
          :game_id => 17,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "烈火神殿",
          :game_id => 17,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "艾塔利亚",
          :game_id => 17,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "赫卡特",
          :game_id => 17,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "八区-阿普伦",
          :game_id => 17)
GameServer.create(
          :name => "伊泽拉",
          :game_id => 17,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "克林麦克",
          :game_id => 17,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "约拿屋",
          :game_id => 17,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "贝纳特",
          :game_id => 17,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "布鲁南",
          :game_id => 17,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "洛佩兹",
          :game_id => 17,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "哈罗德",
          :game_id => 17,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "麦克法兰",
          :game_id => 17,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "九区-伊利斯",
          :game_id => 17)
GameServer.create(
          :name => "阿尔姆斯",
          :game_id => 17,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "浙江创想",
          :game_id => 17,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "上海骏网",
          :game_id => 17,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "温迪亚",
          :game_id => 17,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "普利顿",
          :game_id => 17,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "贝斯提亚",
          :game_id => 17,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "帕缇姆",
          :game_id => 17,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "金陵德亿",
          :game_id => 17,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "十一区-亚斯特纳",
          :game_id => 17)
GameServer.create(
          :name => "元素洞穴",
          :game_id => 17,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "幻想巢穴",
          :game_id => 17,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "恩迪亚",
          :game_id => 17,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "克鲁西安",
          :game_id => 17,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "十二区-斯坦伯勒",
          :game_id => 17)
GameServer.create(
          :name => "黑暗狱齿",
          :game_id => 17,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "剑冢",
          :game_id => 17,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "征战南岳",
          :game_id => 17,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "十三区-沙漠之渊",
          :game_id => 17)
GameServer.create(
          :name => "卡普西",
          :game_id => 17,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "卡里西恩",
          :game_id => 17,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "奥里克遗址",
          :game_id => 17,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "艾德斯",
          :game_id => 17,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "皮佩尔",
          :game_id => 17,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "乌兰沙漠地狱",
          :game_id => 17,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "十五区-潘多拉之眼",
          :game_id => 17)
GameServer.create(
          :name => "猩红之怨",
          :game_id => 17,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "地狱怒啸",
          :game_id => 17,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "龙之怒啸",
          :game_id => 17,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "灰烬封印",
          :game_id => 17,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "灵魂低鸣",
          :game_id => 17,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "神圣守护",
          :game_id => 17,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "十七区-天使神殿",
          :game_id => 17)
GameServer.create(
          :name => "灵魂梦幻",
          :game_id => 17,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "地域壁垒",
          :game_id => 17,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "血腥杀戮",
          :game_id => 17,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "永恒之翼",
          :game_id => 17,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "野性怒吼",
          :game_id => 17,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "天使守护",
          :game_id => 17,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "十九区-天空之城",
          :game_id => 17)
GameServer.create(
          :name => "光明祝福",
          :game_id => 17,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "神圣之光",
          :game_id => 17,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "血泣战歌",
          :game_id => 17,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "堕落天使",
          :game_id => 17,
          :area_id => gamearea13.id)
gamearea14 = GameArea.create(
          :name => "二十区-血色天空",
          :game_id => 17)
GameServer.create(
          :name => "战神沙场",
          :game_id => 17,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "探索之域",
          :game_id => 17,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "血腥海角",
          :game_id => 17,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "征服洪荒",
          :game_id => 17,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "星域光芒",
          :game_id => 17,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "欲望黑洞",
          :game_id => 17,
          :area_id => gamearea14.id)
gamearea15 = GameArea.create(
          :name => "二十二区-永恒之巅",
          :game_id => 17)
GameServer.create(
          :name => "决战",
          :game_id => 17,
          :area_id => gamearea15.id)
gamearea16 = GameArea.create(
          :name => "四区-雷克萨斯",
          :game_id => 17)
GameServer.create(
          :name => "利斯特之屋",
          :game_id => 17,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "弗莱特镇",
          :game_id => 17,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "安其拉废墟",
          :game_id => 17,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "昏鸦沼泽",
          :game_id => 17,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "亚尔顿",
          :game_id => 17,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "苏特伦",
          :game_id => 17,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "格利特",
          :game_id => 17,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "泰坦废墟",
          :game_id => 17,
          :area_id => gamearea16.id)
gamearea17 = GameArea.create(
          :name => "七区-丽水边境",
          :game_id => 17)
GameServer.create(
          :name => "安帝斯圣地",
          :game_id => 17,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "赫拉斯圣地",
          :game_id => 17,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "麦迪亚斯圣地",
          :game_id => 17,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "路西法圣地",
          :game_id => 17,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "茵菲鲁斯圣地",
          :game_id => 17,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "雷米逊圣地",
          :game_id => 17,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "艾格城",
          :game_id => 17,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "弗拉格伦斯圣地",
          :game_id => 17,
          :area_id => gamearea17.id)
gamearea18 = GameArea.create(
          :name => "十区-斯克伦",
          :game_id => 17)
GameServer.create(
          :name => "津门华艺",
          :game_id => 17,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "冰城风致",
          :game_id => 17,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "拉佩奥鲁迷宫",
          :game_id => 17,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "琵罗斯神殿",
          :game_id => 17,
          :area_id => gamearea18.id)
gamearea19 = GameArea.create(
          :name => "十四区-克里普特",
          :game_id => 17)
GameServer.create(
          :name => "纳塔里奥斯",
          :game_id => 17,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "伊丝莉",
          :game_id => 17,
          :area_id => gamearea19.id)
gamearea20 = GameArea.create(
          :name => "十六区-艾尔顿森林",
          :game_id => 17)
GameServer.create(
          :name => "战神之泉",
          :game_id => 17,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "暮色沼泽",
          :game_id => 17,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "龙之丘陵",
          :game_id => 17,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "流光瀑布",
          :game_id => 17,
          :area_id => gamearea20.id)
gamearea21 = GameArea.create(
          :name => "十八区-伊泰纳斯",
          :game_id => 17)
GameServer.create(
          :name => "愤怒之巅",
          :game_id => 17,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "嗜血龙魂",
          :game_id => 17,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "光明之峰",
          :game_id => 17,
          :area_id => gamearea21.id)
gamearea22 = GameArea.create(
          :name => "二十一区-欲望海岛",
          :game_id => 17)
GameServer.create(
          :name => "普鲁斯链锤",
          :game_id => 17,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "普兰尼利刃",
          :game_id => 17,
          :area_id => gamearea22.id)
  end

  def self.down
  end
end
