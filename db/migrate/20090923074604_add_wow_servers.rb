class AddWowServers < ActiveRecord::Migration
  def self.up
    GameRace.create(
        :name => "德莱尼",
        :game_id => 1)
    GameRace.create(
        :name => "矮人",
        :game_id => 1)
    GameRace.create(
        :name => "侏儒",
        :game_id => 1)
    GameRace.create(
        :name => "人类",
        :game_id => 1)
    GameRace.create(
        :name => "暗夜精灵",
        :game_id => 1)
    GameRace.create(
        :name => "血精灵",
        :game_id => 1)
    GameRace.create(
        :name => "兽人",
        :game_id => 1)
    GameRace.create(
        :name => "牛头人",
        :game_id => 1)
    GameRace.create(
        :name => "巨魔",
        :game_id => 1)
    GameRace.create(
        :name => "亡灵",
        :game_id => 1)
    GameProfession.create(
        :name => "德鲁伊",
        :game_id => 1)
    GameProfession.create(
        :name => "猎人",
        :game_id => 1)
    GameProfession.create(
        :name => "法师",
        :game_id => 1)
    GameProfession.create(
        :name => "圣骑士",
        :game_id => 1)
    GameProfession.create(
        :name => "牧师",
        :game_id => 1)
    GameProfession.create(
        :name => "潜行者",
        :game_id => 1)
    GameProfession.create(
        :name => "萨满祭司",
        :game_id => 1)
    GameProfession.create(
        :name => "术士",
        :game_id => 1)
    GameProfession.create(
        :name => "战士",
        :game_id => 1)
    GameArea.create(
        :name => "1区",
        :game_id => 1)
    GameArea.create(
        :name => "2区",
        :game_id => 1)
    GameArea.create(
        :name => "3区",
        :game_id => 1)
    GameArea.create(
        :name => "4区",
        :game_id => 1)
    GameArea.create(
        :name => "5区",
        :game_id => 1)
    GameArea.create(
        :name => "6区",
        :game_id => 1)
    GameArea.create(
        :name => "7区",
        :game_id => 1)
    GameArea.create(
        :name => "8区",
        :game_id => 1)
    GameArea.create(
        :name => "9区",
        :game_id => 1)
    GameArea.create(
        :name => "10区",
        :game_id => 1)
GameServer.create(
        :name => "阿格拉玛",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "艾苏恩",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "安威玛尔",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "奥达曼",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "奥蕾莉亚",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "白银之手",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "暴风祭坛",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "藏宝海湾",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "尘风峡谷",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "达纳斯",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "迪托马斯",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "国王之谷",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "黑龙军团",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "黑石尖塔",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "红龙军团",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "回音山",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "基尔罗格",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "卡德罗斯",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "卡扎克",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "库德兰",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "蓝龙军团",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "雷霆之王",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "烈焰峰",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "罗宁",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "洛萨",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "玛多兰",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "玛瑟里顿",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "莫德古得",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "耐萨里奥",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "诺莫瑞根",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "普瑞斯托",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "燃烧平原",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "萨格拉斯",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "山丘之王",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "死亡之翼",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "索拉丁",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "索瑞森",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "铜龙军团",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "图拉扬",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "伊瑟拉",
        :game_id => 1,
        :area_id => 1)
GameServer.create(
        :name => "阿迦玛甘",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "阿克蒙德",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "埃加洛尔",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "埃苏雷格",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "艾萨拉",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "艾森娜",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "爱斯特纳",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "暗影之月",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "奥拉基尔",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "冰霜之刃",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "达斯雷玛",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "地狱咆哮",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "地狱之石",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "风暴之怒",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "风行者",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "弗塞雷迦",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "戈古纳斯",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "毁灭之锤",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "火焰之树",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "卡德加",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "拉文凯斯",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "玛法里奥",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "麦维影歌",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "梅尔加尼",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "梦境之树",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "迷雾之海",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "耐普图隆",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "海加尔",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "轻风之语",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "夏维安",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "塞纳里奥",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "闪电之刃",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "石爪峰",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "泰兰德",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "屠魔山谷",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "伊利丹",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "月光林地",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "月神殿",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "战歌",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "主宰之剑",
        :game_id => 1,
        :area_id => 2)
GameServer.create(
        :name => "埃德萨拉",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "奥蕾塞丝",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "布莱克摩",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "杜隆坦",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "符文图腾",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "古雷曼格",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "鬼雾峰",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "黑暗之矛",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "红龙女王",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "红云台地",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "黄金之路",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "火羽山",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "迦罗娜",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "凯恩血蹄",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "狂风峭壁",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "雷斧堡垒",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "雷霆号角",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "鲜血之环",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "血环",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "灰烬使者",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "禁魔监狱",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "雷克萨",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "玛里苟斯",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "纳沙塔尔",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "诺兹多姆",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "普罗德摩",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "千针石林",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "燃烧之刃",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "萨尔",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "圣火神殿",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "死亡之门",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "甜水绿洲",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "熊猫酒仙",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "血牙魔王",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "勇士岛",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "羽月",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "蜘蛛王国",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "自由之风",
        :game_id => 1,
        :area_id => 3)
GameServer.create(
        :name => "阿尔萨斯",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "阿拉索",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "埃雷达尔",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "艾欧纳尔",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "暗影议会",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "奥特兰克",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "巴尔古恩",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "冰风岗",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "达隆米尔",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "耳语海岸",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "古尔丹",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "寒冰皇冠",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "基尔加丹",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "激流堡",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "巨龙之吼",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "拉格纳罗斯",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "莱斯霜语",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "利刃之拳",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "玛诺洛斯",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "麦迪文",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "凯尔萨斯",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "耐奥祖",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "克尔苏加德",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "瑞文戴尔",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "霜狼",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "霜之哀伤",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "斯坦索姆",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "提瑞斯法",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "通灵学院",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "希尔瓦娜斯",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "血色十字军",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "遗忘海岸",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "银松森林",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "银月",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "鹰巢山",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "影牙要塞",
        :game_id => 1,
        :area_id => 4)
GameServer.create(
        :name => "狂热之刃",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "卡珊德拉",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "迅捷微风",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "守护之剑",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "泰坦之拳",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "斩魔者",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "布兰卡德",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "世界之树",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "玛格索尔",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "恶魔之翼",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "万色星辰",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "激流之傲",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "加兹鲁维",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "水晶之刺",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "苏塔恩",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "雏龙之翼",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "黑暗魅影",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "寒霜皇冠",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "浸毒之骨",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "阴影之刺",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "大地之怒",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "伊森利恩",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "神圣之歌",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "午夜之镰",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "暮色森林",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "元素之力",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "加拉德尔",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "日落沼泽",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "踏梦者",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "密林游侠",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "芬里斯",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "加德纳尔",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "伊萨里奥斯",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "安多哈尔",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "风暴之眼",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "提尔之手",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "永夜港",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "金色平原",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "朵丹尼尔",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "法拉希姆",
        :game_id => 1,
        :area_id => 5)
GameServer.create(
        :name => "安其拉",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "安纳塞隆",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "阿努巴拉克",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "阿拉希",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "瓦里玛萨斯",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "巴纳扎尔",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "黑手军团",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "血羽",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "燃烧军团",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "克洛玛古斯",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "破碎岭",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "克苏恩",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "阿纳克洛斯",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "雷霆之怒",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "桑德兰",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "黑翼之巢",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "德拉诺",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "龙骨平原",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "卡拉赞",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "熔火之心",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "格瑞姆巴托",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "古拉巴什",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "哈卡",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "海克泰尔",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "库尔提拉斯",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "洛丹伦",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "奈法利安",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "奎尔萨拉斯",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "拉贾克斯",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "拉文霍德",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "森金",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "范达尔鹿盔",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "泰拉尔",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "瓦拉斯塔兹",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "永恒之井",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "海达希亚",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "萨菲隆",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "纳克萨玛斯",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "无尽之海",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "莱索恩",
        :game_id => 1,
        :area_id => 6)
GameServer.create(
        :name => "阿卡玛",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "阿扎达斯",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "灰谷",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "艾维娜",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "巴瑟拉斯",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "血顶",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "恐怖图腾",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "古加尔",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "达文格尔",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "黑铁",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "恶魔之魂",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "迪瑟洛克",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "丹莫德",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "艾莫莉丝",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "埃克索图斯",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "菲拉斯",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "加基森",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "加里索斯",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "格雷迈恩",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "布莱恩",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "伊莫塔尔",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "大漩涡",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "诺森德",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "奥妮克希亚",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "奥斯里安",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "外域",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "天空之墙",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "风暴之鳞",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "荆棘谷",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "逐日者",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "塔纳利斯",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "瑟莱德丝",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "塞拉赞恩",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "托塞德林",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "黑暗虚空",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "安戈洛",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "维克尼拉斯",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "祖尔金",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "祖鲁希德",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "达卡尼",
        :game_id => 1,
        :area_id => 7)
GameServer.create(
        :name => "冰川之拳",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "刺骨利刃",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "深渊之巢",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "迪塔格",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "巨槌",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "火烟之谷",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "伊兰尼库斯",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "火喉",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "戈杜尼",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "艾隆纳亚",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "迦玛兰",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "金度",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "邪恶颅壳",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "巫妖之王",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "玛加萨",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "米奈希尔",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "莫格莱尼",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "莫什奥格",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "噬灵沼泽",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "幽暗沼泽",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "耐克鲁斯",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "匹瑞诺德",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "破碎之手",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "碎颅者",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "烈焰荆棘",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "夺灵者",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "岩石巨塔",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "破裂之拳",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "石锤",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "风暴裂隙",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "塞拉摩",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "瑟玛普拉格",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "奥丹姆",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "维克洛尔",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "邪枝",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "怀特迈恩",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "冬泉谷",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "伊森德雷",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "扎拉赞恩",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "亚雷戈斯",
        :game_id => 1,
        :area_id => 8)
GameServer.create(
        :name => "阿古斯",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "戴索姆",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "迪门修斯",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "凤凰之神",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "格鲁尔",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "黑暗之门",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "火焰之地",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "军团要塞",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "深渊之喉",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "死亡熔炉",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "鲜血熔炉",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "血槌",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "范克里夫",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "翡翠梦境",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "风暴要塞",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "雷德",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "摩摩尔",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "破碎大厅",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "塞泰克",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "试炼之环",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "太阳之井",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "提克迪奥斯",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "希雷诺斯",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "祖阿曼",
        :game_id => 1,
        :area_id => 9)
GameServer.create(
        :name => "阿比迪斯",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "阿曼尼",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "阿斯塔洛",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "安苏",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "白骨荒野",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "壁炉谷",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "布鲁塔卢斯",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "达尔坎",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "达基萨斯",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "盖斯",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "戈提克",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "加尔",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "迦顿",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "末日行者",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "能源舰",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "贫瘠之地",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "熵魔",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "生态船",
        :game_id => 1,
        :area_id => 10)
GameServer.create(
        :name => "血吼",
        :game_id => 1,
        :area_id => 10)
  end

  def self.down
  end
end
