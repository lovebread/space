class AddFengshenbang2Data < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "甲士",
        :game_id => 59)
GameProfession.create(
        :name => "道士",
        :game_id => 59)
GameProfession.create(
        :name => "异人",
        :game_id => 59)
gamearea1 = GameArea.create(
          :name => "电信",
          :game_id => 59)
GameServer.create(
          :name => "巫山神女",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "凤鸣岐山",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "百鸟朝凤",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天女散花",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "一笑倾城",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "后羿射日",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "开天辟地",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "嫦娥奔月",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "妲己",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "女娲补天",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "周文王",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "姜子牙",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "道人兵车",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "铁嘴神鹰",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "九曲黄河阵",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "斩仙飞刀",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "雾露乾坤网",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "如意乾坤袋",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "水火花篮",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "三宝玉如意",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "七擒五火扇",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "七宝玲珑塔",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "诛仙阵图",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "七香车",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "混元伞",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "番天印",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "打神鞭",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "乾坤图",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "定海珠",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "琉璃灯",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "方天戟",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "开天珠",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "混元珠",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "劈地珠",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "青云剑",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "风雷翼",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "混天绫",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "吴钩剑",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "风火轮",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "火尖枪",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "哮天犬",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "乾坤圈",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "首阳山",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "东海",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "渭水",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "昆仑",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "九功山",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "龙德殿",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "金霞洞",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "乾元山",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "盘古",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "原始天尊",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "太上老君",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "南极仙翁",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "普贤真人",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "文殊广法天尊",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "黄龙真人",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "玉鼎真人",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "道行天尊",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "燃灯道人",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "柏鉴",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "黄飞虎",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "崇黑虎",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "黄天化",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "慈航道人",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "赵公明",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "南宫适",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "姬叔明",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "雷震子",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "准提道人",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "接引道人",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "无当圣母",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "火灵圣母",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "金灵圣母",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "土行孙",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "闻聘",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "广成子",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "苏护",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "黄飞豹",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "惧留孙",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "陈奇",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "朝歌",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "瑶池",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "三山关",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "殷洪",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "杜远铣",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "千里眼",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "顺风耳",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "邓蝉玉",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "碧霄娘娘",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "云霄娘娘",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "琼霄娘娘",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "魔礼红",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "魔礼寿",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "魔礼海",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "魔礼青",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "金吒",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "乌云仙",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "金光仙",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "玉清道人",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "上清道人",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "龙吉公主",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "敖广",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "商容首相",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "比干亚相",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "北海",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "潼关",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "万仙阵",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "千仞沟",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "碧游宫",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天姥山",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "玉屋洞",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "虎儿崖",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "霓彩湾",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "青峰山",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "飞云阁",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "珊瑚滩",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "镇国府",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "元阳洞",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "金光洞",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "白鹤洞",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "神农",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "孟津",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "太华山",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "九仙山",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "绝龙岭",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "蚩尤",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "后羿",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "青龙关",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "云霄洞",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "汜水关",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "陈塘关",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "武夷山",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "普陀山",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "玉峰山",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "金庭山",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "大禹",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "黄帝",
          :game_id => 59,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "刑天",
          :game_id => 59,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "网通",
          :game_id => 59)
GameServer.create(
          :name => "烽火诸侯",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "大禹治水",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "哪吒闹海",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "哪吒",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "清净琉璃瓶",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "龙虎如意",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "玉琵琶",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "五色华光羽",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "通天神火柱",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "九黎",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "蚩尤墓",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "摘星楼",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "太师府",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "女娲",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "通天教主",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "太乙真人",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "清虚道德真君",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "杨戬",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "崇侯虎",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "蒋雄",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "郑伦",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "陆压道人",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "闻仲",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "李靖",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "崔英",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "木吒",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "殷郊",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "陈桐",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "赵丙",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "黄天禄",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "孙焰红",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "金光圣母",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "灵宝大法师",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "太清道人",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "西王母",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "西伯侯姬昌",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "遁龙桩",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "四象塔",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "捆仙绳",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "山河社稷图",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "定风珠",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "十绝阵",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "风电枪",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "乾坤尺",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "琉璃瓶",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "潜龙湾",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "盘丝洞",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "商皇陵",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "佳梦关",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "夸父",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "炎帝",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "火云洞",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "女娲宫",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "金鸡岭",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "蓬莱山",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "万丈岛",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "西岐",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "五龙山",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "临潼关",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "紫阳洞",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "二仙山",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "麒麟崖",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "夹龙山",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "飞云洞",
          :game_id => 59,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "桃源洞",
          :game_id => 59,
          :area_id => gamearea2.id)
  end

  def self.down
  end
end
