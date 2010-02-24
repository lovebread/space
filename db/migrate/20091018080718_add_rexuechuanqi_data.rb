class AddRexuechuanqiData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "战士",
        :game_id => 19)
GameProfession.create(
        :name => "法师",
        :game_id => 19)
GameProfession.create(
        :name => "道士",
        :game_id => 19)
gamearea1 = GameArea.create(
          :name => "传奇一区",
          :game_id => 19)
GameServer.create(
          :name => "光芒",
          :game_id => 19,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "雷霆",
          :game_id => 19,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "烈焰",
          :game_id => 19,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "新浪",
          :game_id => 19,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "流云",
          :game_id => 19,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "疾风",
          :game_id => 19,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "联通",
          :game_id => 19,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "蜀山",
          :game_id => 19,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "传奇二区",
          :game_id => 19)
GameServer.create(
          :name => "传奇二区",
          :game_id => 19,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "海鼎",
          :game_id => 19,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "传奇三区",
          :game_id => 19)
GameServer.create(
          :name => "雄狮",
          :game_id => 19,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "天府",
          :game_id => 19,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "天堂",
          :game_id => 19,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "飞鸿",
          :game_id => 19,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "传奇三区",
          :game_id => 19,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "天空•传奇（四区）",
          :game_id => 19)
GameServer.create(
          :name => "天空传奇",
          :game_id => 19,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "传奇五区",
          :game_id => 19)
GameServer.create(
          :name => "传奇五区",
          :game_id => 19,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "传奇六区",
          :game_id => 19)
GameServer.create(
          :name => "传奇六区",
          :game_id => 19,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "长白",
          :game_id => 19,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "长白二",
          :game_id => 19,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "传奇七区",
          :game_id => 19)
GameServer.create(
          :name => "长宽皓月Ⅰ",
          :game_id => 19,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "长宽皓月Ⅱ",
          :game_id => 19,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "传奇八区",
          :game_id => 19)
GameServer.create(
          :name => "传奇八区",
          :game_id => 19,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "传奇九区",
          :game_id => 19)
GameServer.create(
          :name => "传奇九区",
          :game_id => 19,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "联通",
          :game_id => 19,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "传奇十区",
          :game_id => 19)
GameServer.create(
          :name => "传奇十区",
          :game_id => 19,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "渝州",
          :game_id => 19,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "峨嵋",
          :game_id => 19,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "经典之国(11区)",
          :game_id => 19)
GameServer.create(
          :name => "经典之国Ⅰ",
          :game_id => 19,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "经典之国Ⅱ",
          :game_id => 19,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "西部圣域（12区）",
          :game_id => 19)
GameServer.create(
          :name => "西部圣域",
          :game_id => 19,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "英雄之门（13区）",
          :game_id => 19)
GameServer.create(
          :name => "英雄之门Ⅰ",
          :game_id => 19,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "英雄之门Ⅱ",
          :game_id => 19,
          :area_id => gamearea13.id)
gamearea14 = GameArea.create(
          :name => "王者大陆（14区）",
          :game_id => 19)
GameServer.create(
          :name => "王者大陆",
          :game_id => 19,
          :area_id => gamearea14.id)
gamearea15 = GameArea.create(
          :name => "移动天下（15区）",
          :game_id => 19)
GameServer.create(
          :name => "华夏神州四海",
          :game_id => 19,
          :area_id => gamearea15.id)
gamearea16 = GameArea.create(
          :name => "侠骨丹心（16区）",
          :game_id => 19)
GameServer.create(
          :name => "侠骨丹心",
          :game_id => 19,
          :area_id => gamearea16.id)
gamearea17 = GameArea.create(
          :name => "风云专区（17区）",
          :game_id => 19)
GameServer.create(
          :name => "风云专区",
          :game_id => 19,
          :area_id => gamearea17.id)
gamearea18 = GameArea.create(
          :name => "赤月•广电星空（18区）",
          :game_id => 19)
GameServer.create(
          :name => "广电星空",
          :game_id => 19,
          :area_id => gamearea18.id)
gamearea19 = GameArea.create(
          :name => "西部圣域Ⅱ（19区）",
          :game_id => 19)
GameServer.create(
          :name => "西部圣域Ⅱ",
          :game_id => 19,
          :area_id => gamearea19.id)
gamearea20 = GameArea.create(
          :name => "光明世界（20区）",
          :game_id => 19)
GameServer.create(
          :name => "光明世界",
          :game_id => 19,
          :area_id => gamearea20.id)
gamearea21 = GameArea.create(
          :name => "江山如画（21区）",
          :game_id => 19)
GameServer.create(
          :name => "江山如画",
          :game_id => 19,
          :area_id => gamearea21.id)
gamearea22 = GameArea.create(
          :name => "网通宽带（22区）",
          :game_id => 19)
GameServer.create(
          :name => "网通宽带",
          :game_id => 19,
          :area_id => gamearea22.id)
gamearea23 = GameArea.create(
          :name => "群雄逐鹿（23区）",
          :game_id => 19)
GameServer.create(
          :name => "群雄逐鹿",
          :game_id => 19,
          :area_id => gamearea23.id)
gamearea24 = GameArea.create(
          :name => "西部圣域Ⅲ（24区）",
          :game_id => 19)
GameServer.create(
          :name => "西部圣域Ⅲ",
          :game_id => 19,
          :area_id => gamearea24.id)
gamearea25 = GameArea.create(
          :name => "风云Ⅱ（25区）",
          :game_id => 19)
GameServer.create(
          :name => "风云Ⅱ",
          :game_id => 19,
          :area_id => gamearea25.id)
gamearea26 = GameArea.create(
          :name => "仙女湖（26区）",
          :game_id => 19)
GameServer.create(
          :name => "仙女湖",
          :game_id => 19,
          :area_id => gamearea26.id)
gamearea27 = GameArea.create(
          :name => "网通宽带Ⅱ（27区）",
          :game_id => 19)
GameServer.create(
          :name => "网通宽带Ⅱ",
          :game_id => 19,
          :area_id => gamearea27.id)
gamearea28 = GameArea.create(
          :name => "中游传奇（28区）",
          :game_id => 19)
GameServer.create(
          :name => "中游传奇",
          :game_id => 19,
          :area_id => gamearea28.id)
gamearea29 = GameArea.create(
          :name => "东海风暴(29区）",
          :game_id => 19)
GameServer.create(
          :name => "东海风暴",
          :game_id => 19,
          :area_id => gamearea29.id)
gamearea30 = GameArea.create(
          :name => "安徽热线(30区）",
          :game_id => 19)
GameServer.create(
          :name => "安徽热线",
          :game_id => 19,
          :area_id => gamearea30.id)
gamearea31 = GameArea.create(
          :name => "甲天下(31区）",
          :game_id => 19)
GameServer.create(
          :name => "甲天下Ⅰ",
          :game_id => 19,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "甲天下Ⅱ",
          :game_id => 19,
          :area_id => gamearea31.id)
gamearea32 = GameArea.create(
          :name => "英雄天地(32区）",
          :game_id => 19)
GameServer.create(
          :name => "英雄天地",
          :game_id => 19,
          :area_id => gamearea32.id)
gamearea33 = GameArea.create(
          :name => "西部圣域IV(33区）",
          :game_id => 19)
GameServer.create(
          :name => "西部圣域IV",
          :game_id => 19,
          :area_id => gamearea33.id)
gamearea34 = GameArea.create(
          :name => "五里河（34区）",
          :game_id => 19)
GameServer.create(
          :name => "鹰翔",
          :game_id => 19,
          :area_id => gamearea34.id)
GameServer.create(
          :name => "翱翔九天",
          :game_id => 19,
          :area_id => gamearea34.id)
gamearea35 = GameArea.create(
          :name => "江苏电信（35区）",
          :game_id => 19)
GameServer.create(
          :name => "虎踞",
          :game_id => 19,
          :area_id => gamearea35.id)
GameServer.create(
          :name => "江苏电信",
          :game_id => 19,
          :area_id => gamearea35.id)
gamearea36 = GameArea.create(
          :name => "网通宽带III （36区）",
          :game_id => 19)
GameServer.create(
          :name => "网通宽带III",
          :game_id => 19,
          :area_id => gamearea36.id)
gamearea37 = GameArea.create(
          :name => "古城热线（37区）",
          :game_id => 19)
GameServer.create(
          :name => "古城热线",
          :game_id => 19,
          :area_id => gamearea37.id)
gamearea38 = GameArea.create(
          :name => "风云III （38区）",
          :game_id => 19)
GameServer.create(
          :name => "风云III",
          :game_id => 19,
          :area_id => gamearea38.id)
gamearea39 = GameArea.create(
          :name => "风云IV（39区）",
          :game_id => 19)
GameServer.create(
          :name => "风云IV",
          :game_id => 19,
          :area_id => gamearea39.id)
gamearea40 = GameArea.create(
          :name => "传奇四十区",
          :game_id => 19)
GameServer.create(
          :name => "传奇四十区",
          :game_id => 19,
          :area_id => gamearea40.id)
gamearea41 = GameArea.create(
          :name => "仁者无敌（41区）",
          :game_id => 19)
GameServer.create(
          :name => "仁者无敌",
          :game_id => 19,
          :area_id => gamearea41.id)
gamearea42 = GameArea.create(
          :name => "风云V（42区）",
          :game_id => 19)
GameServer.create(
          :name => "风云V",
          :game_id => 19,
          :area_id => gamearea42.id)
gamearea43 = GameArea.create(
          :name => "原教育网43区（上海网通）",
          :game_id => 19)
GameServer.create(
          :name => "防沉迷组",
          :game_id => 19,
          :area_id => gamearea43.id)
GameServer.create(
          :name => "百家争鸣",
          :game_id => 19,
          :area_id => gamearea43.id)
gamearea44 = GameArea.create(
          :name => "潇湘圣域（44区）",
          :game_id => 19)
GameServer.create(
          :name => "湘江",
          :game_id => 19,
          :area_id => gamearea44.id)
GameServer.create(
          :name => "洞庭",
          :game_id => 19,
          :area_id => gamearea44.id)
GameServer.create(
          :name => "衡山",
          :game_id => 19,
          :area_id => gamearea44.id)
GameServer.create(
          :name => "武陵",
          :game_id => 19,
          :area_id => gamearea44.id)
gamearea45 = GameArea.create(
          :name => "西部圣域V（45区）",
          :game_id => 19)
GameServer.create(
          :name => "西部圣域V",
          :game_id => 19,
          :area_id => gamearea45.id)
gamearea46 = GameArea.create(
          :name => "逐鹿中原（46区）",
          :game_id => 19)
GameServer.create(
          :name => "逐鹿中原Ⅰ",
          :game_id => 19,
          :area_id => gamearea46.id)
GameServer.create(
          :name => "逐鹿中原Ⅱ",
          :game_id => 19,
          :area_id => gamearea46.id)
gamearea47 = GameArea.create(
          :name => "西部圣域VI（47区）",
          :game_id => 19)
GameServer.create(
          :name => "西部圣域VI",
          :game_id => 19,
          :area_id => gamearea47.id)
gamearea48 = GameArea.create(
          :name => "网通宽带IV（48区）",
          :game_id => 19)
GameServer.create(
          :name => "网通宽带IV",
          :game_id => 19,
          :area_id => gamearea48.id)
gamearea49 = GameArea.create(
          :name => "广电星空II（49区）",
          :game_id => 19)
GameServer.create(
          :name => "广电星空II",
          :game_id => 19,
          :area_id => gamearea49.id)
gamearea50 = GameArea.create(
          :name => "天津宽带（50区）",
          :game_id => 19)
GameServer.create(
          :name => "英雄",
          :game_id => 19,
          :area_id => gamearea50.id)
gamearea51 = GameArea.create(
          :name => "吉林通信专区（51区）",
          :game_id => 19)
GameServer.create(
          :name => "吉林通信专区",
          :game_id => 19,
          :area_id => gamearea51.id)
gamearea52 = GameArea.create(
          :name => "浙江电信专区（52区）",
          :game_id => 19)
GameServer.create(
          :name => "浙江电信专区",
          :game_id => 19,
          :area_id => gamearea52.id)
gamearea53 = GameArea.create(
          :name => "天使之城（53区）",
          :game_id => 19)
GameServer.create(
          :name => "天使之城",
          :game_id => 19,
          :area_id => gamearea53.id)
gamearea54 = GameArea.create(
          :name => "齐鲁风云(55区 )",
          :game_id => 19)
GameServer.create(
          :name => "齐鲁风云",
          :game_id => 19,
          :area_id => gamearea54.id)
gamearea55 = GameArea.create(
          :name => "长城宽带(56区)",
          :game_id => 19)
GameServer.create(
          :name => "长城宽带",
          :game_id => 19,
          :area_id => gamearea55.id)
gamearea56 = GameArea.create(
          :name => "新疆电信(57区)",
          :game_id => 19)
GameServer.create(
          :name => "新疆电信",
          :game_id => 19,
          :area_id => gamearea56.id)
gamearea57 = GameArea.create(
          :name => "铁通专区(58区)",
          :game_id => 19)
GameServer.create(
          :name => "冰山沙漠",
          :game_id => 19,
          :area_id => gamearea57.id)
GameServer.create(
          :name => "典雅优雅",
          :game_id => 19,
          :area_id => gamearea57.id)
gamearea58 = GameArea.create(
          :name => "冰城(59区)",
          :game_id => 19)
GameServer.create(
          :name => "冰城",
          :game_id => 19,
          :area_id => gamearea58.id)
gamearea59 = GameArea.create(
          :name => "西部圣域VII(60区)",
          :game_id => 19)
GameServer.create(
          :name => "西部圣域VII",
          :game_id => 19,
          :area_id => gamearea59.id)
gamearea60 = GameArea.create(
          :name => "龙行天下(61区)",
          :game_id => 19)
GameServer.create(
          :name => "龙行天下",
          :game_id => 19,
          :area_id => gamearea60.id)
gamearea61 = GameArea.create(
          :name => "豫晋传奇(62区)",
          :game_id => 19)
GameServer.create(
          :name => "豫晋传奇",
          :game_id => 19,
          :area_id => gamearea61.id)
gamearea62 = GameArea.create(
          :name => "傲视传奇(63区)",
          :game_id => 19)
GameServer.create(
          :name => "傲视传奇",
          :game_id => 19,
          :area_id => gamearea62.id)
gamearea63 = GameArea.create(
          :name => "天下太平(64区)",
          :game_id => 19)
GameServer.create(
          :name => "天下太平",
          :game_id => 19,
          :area_id => gamearea63.id)
GameServer.create(
          :name => "四季",
          :game_id => 19,
          :area_id => gamearea63.id)
gamearea64 = GameArea.create(
          :name => "八闽在线(65区)",
          :game_id => 19)
GameServer.create(
          :name => "八闽在线",
          :game_id => 19,
          :area_id => gamearea64.id)
gamearea65 = GameArea.create(
          :name => "南粤魔界(66区)",
          :game_id => 19)
GameServer.create(
          :name => "南粤魔界",
          :game_id => 19,
          :area_id => gamearea65.id)
gamearea66 = GameArea.create(
          :name => "互联星空(67区)",
          :game_id => 19)
GameServer.create(
          :name => "互联星空",
          :game_id => 19,
          :area_id => gamearea66.id)
gamearea67 = GameArea.create(
          :name => "金榜题名(68区)",
          :game_id => 19)
GameServer.create(
          :name => "金榜题名",
          :game_id => 19,
          :area_id => gamearea67.id)
gamearea68 = GameArea.create(
          :name => "江山无限(69区)",
          :game_id => 19)
GameServer.create(
          :name => "白塔",
          :game_id => 19,
          :area_id => gamearea68.id)
GameServer.create(
          :name => "泉城",
          :game_id => 19,
          :area_id => gamearea68.id)
GameServer.create(
          :name => "江山无限",
          :game_id => 19,
          :area_id => gamearea68.id)
gamearea69 = GameArea.create(
          :name => "超级玩家区(仅供超级玩家)",
          :game_id => 19)
GameServer.create(
          :name => "vip区",
          :game_id => 19,
          :area_id => gamearea69.id)
gamearea70 = GameArea.create(
          :name => "绝代风华(70区)",
          :game_id => 19)
GameServer.create(
          :name => "绝代风华",
          :game_id => 19,
          :area_id => gamearea70.id)
gamearea71 = GameArea.create(
          :name => "锦绣江南(71区)",
          :game_id => 19)
GameServer.create(
          :name => "锦绣江南",
          :game_id => 19,
          :area_id => gamearea71.id)
gamearea72 = GameArea.create(
          :name => "沁园春(72区)",
          :game_id => 19)
GameServer.create(
          :name => "沁园春",
          :game_id => 19,
          :area_id => gamearea72.id)
gamearea73 = GameArea.create(
          :name => "倾国倾城(75区 )",
          :game_id => 19)
GameServer.create(
          :name => "倾国倾城",
          :game_id => 19,
          :area_id => gamearea73.id)
gamearea74 = GameArea.create(
          :name => "辽沈专区(76区)",
          :game_id => 19)
GameServer.create(
          :name => "辽沈专区",
          :game_id => 19,
          :area_id => gamearea74.id)
gamearea75 = GameArea.create(
          :name => "水泊梁山(77区)",
          :game_id => 19)
GameServer.create(
          :name => "水泊梁山",
          :game_id => 19,
          :area_id => gamearea75.id)
gamearea76 = GameArea.create(
          :name => "东方热线(78区)",
          :game_id => 19)
GameServer.create(
          :name => "东方热线",
          :game_id => 19,
          :area_id => gamearea76.id)
gamearea77 = GameArea.create(
          :name => "热血天涯(79区)",
          :game_id => 19)
GameServer.create(
          :name => "热血天涯",
          :game_id => 19,
          :area_id => gamearea77.id)
gamearea78 = GameArea.create(
          :name => "新丝路(80区)",
          :game_id => 19)
GameServer.create(
          :name => "新丝路",
          :game_id => 19,
          :area_id => gamearea78.id)
gamearea79 = GameArea.create(
          :name => "宽带鹿城(81区)",
          :game_id => 19)
GameServer.create(
          :name => "宽带鹿城",
          :game_id => 19,
          :area_id => gamearea79.id)
gamearea80 = GameArea.create(
          :name => "水泊梁山II(82区)",
          :game_id => 19)
GameServer.create(
          :name => "水泊梁山II",
          :game_id => 19,
          :area_id => gamearea80.id)
gamearea81 = GameArea.create(
          :name => "英雄之都(83区)",
          :game_id => 19)
GameServer.create(
          :name => "英雄之都",
          :game_id => 19,
          :area_id => gamearea81.id)
gamearea82 = GameArea.create(
          :name => "三晋争霸(84区)",
          :game_id => 19)
GameServer.create(
          :name => "三晋争霸",
          :game_id => 19,
          :area_id => gamearea82.id)
gamearea83 = GameArea.create(
          :name => "楚雄风云(85区)",
          :game_id => 19)
GameServer.create(
          :name => "楚雄风云",
          :game_id => 19,
          :area_id => gamearea83.id)
gamearea84 = GameArea.create(
          :name => "宽带e线(86区)",
          :game_id => 19)
GameServer.create(
          :name => "宽带e线",
          :game_id => 19,
          :area_id => gamearea84.id)
gamearea85 = GameArea.create(
          :name => "笑傲江湖(87区)",
          :game_id => 19)
GameServer.create(
          :name => "笑傲江湖",
          :game_id => 19,
          :area_id => gamearea85.id)
gamearea86 = GameArea.create(
          :name => "大话天涯(88区)",
          :game_id => 19)
GameServer.create(
          :name => "大话天涯",
          :game_id => 19,
          :area_id => gamearea86.id)
gamearea87 = GameArea.create(
          :name => "情比金坚(89区)",
          :game_id => 19)
GameServer.create(
          :name => "冰河",
          :game_id => 19,
          :area_id => gamearea87.id)
GameServer.create(
          :name => "瑞雪",
          :game_id => 19,
          :area_id => gamearea87.id)
GameServer.create(
          :name => "皇朝",
          :game_id => 19,
          :area_id => gamearea87.id)
GameServer.create(
          :name => "万豪",
          :game_id => 19,
          :area_id => gamearea87.id)
gamearea88 = GameArea.create(
          :name => "王者无敌(90区)",
          :game_id => 19)
GameServer.create(
          :name => "王者无敌",
          :game_id => 19,
          :area_id => gamearea88.id)
gamearea89 = GameArea.create(
          :name => "雄霸天下(91区)",
          :game_id => 19)
GameServer.create(
          :name => "雄霸天下",
          :game_id => 19,
          :area_id => gamearea89.id)
gamearea90 = GameArea.create(
          :name => "风云千里(92区)",
          :game_id => 19)
GameServer.create(
          :name => "风云千里",
          :game_id => 19,
          :area_id => gamearea90.id)
gamearea91 = GameArea.create(
          :name => "侠骨柔情(93区)",
          :game_id => 19)
GameServer.create(
          :name => "侠骨柔情",
          :game_id => 19,
          :area_id => gamearea91.id)
gamearea92 = GameArea.create(
          :name => "天龙八部(94区)",
          :game_id => 19)
GameServer.create(
          :name => "天龙八部Ⅰ",
          :game_id => 19,
          :area_id => gamearea92.id)
GameServer.create(
          :name => "天龙八部Ⅱ",
          :game_id => 19,
          :area_id => gamearea92.id)
gamearea93 = GameArea.create(
          :name => "普天同庆(95区)",
          :game_id => 19)
GameServer.create(
          :name => "普天同庆",
          :game_id => 19,
          :area_id => gamearea93.id)
gamearea94 = GameArea.create(
          :name => "群龙聚首(96区)",
          :game_id => 19)
GameServer.create(
          :name => "群龙聚首Ⅰ",
          :game_id => 19,
          :area_id => gamearea94.id)
GameServer.create(
          :name => "群龙聚首Ⅱ",
          :game_id => 19,
          :area_id => gamearea94.id)
gamearea95 = GameArea.create(
          :name => "玛法大陆(97区)",
          :game_id => 19)
GameServer.create(
          :name => "玛法大陆",
          :game_id => 19,
          :area_id => gamearea95.id)
gamearea96 = GameArea.create(
          :name => "傲视群雄(98区)",
          :game_id => 19)
GameServer.create(
          :name => "傲视群雄",
          :game_id => 19,
          :area_id => gamearea96.id)
gamearea97 = GameArea.create(
          :name => "紫气东来(99区网通）",
          :game_id => 19)
GameServer.create(
          :name => "紫气东来",
          :game_id => 19,
          :area_id => gamearea97.id)
gamearea98 = GameArea.create(
          :name => "继往开来(101区)",
          :game_id => 19)
GameServer.create(
          :name => "继往开来",
          :game_id => 19,
          :area_id => gamearea98.id)
gamearea99 = GameArea.create(
          :name => "天下传奇(原54区)",
          :game_id => 19)
GameServer.create(
          :name => "天下传奇",
          :game_id => 19,
          :area_id => gamearea99.id)
gamearea100 = GameArea.create(
          :name => "光辉岁月(102区)",
          :game_id => 19)
GameServer.create(
          :name => "光辉岁月",
          :game_id => 19,
          :area_id => gamearea100.id)
gamearea101 = GameArea.create(
          :name => "海阔天空(103区)",
          :game_id => 19)
GameServer.create(
          :name => "海阔天空",
          :game_id => 19,
          :area_id => gamearea101.id)
gamearea102 = GameArea.create(
          :name => "宏图霸业(104区)",
          :game_id => 19)
GameServer.create(
          :name => "宏图霸业",
          :game_id => 19,
          :area_id => gamearea102.id)
gamearea103 = GameArea.create(
          :name => "龙腾四海(105区)",
          :game_id => 19)
GameServer.create(
          :name => "龙腾四海",
          :game_id => 19,
          :area_id => gamearea103.id)
gamearea104 = GameArea.create(
          :name => "盖世英雄(106区)",
          :game_id => 19)
GameServer.create(
          :name => "壮志",
          :game_id => 19,
          :area_id => gamearea104.id)
GameServer.create(
          :name => "凌云",
          :game_id => 19,
          :area_id => gamearea104.id)
gamearea105 = GameArea.create(
          :name => "谁与争锋(107区)",
          :game_id => 19)
GameServer.create(
          :name => "盛世",
          :game_id => 19,
          :area_id => gamearea105.id)
GameServer.create(
          :name => "霸业",
          :game_id => 19,
          :area_id => gamearea105.id)
gamearea106 = GameArea.create(
          :name => "傲世无双(108区)",
          :game_id => 19)
GameServer.create(
          :name => "纵横",
          :game_id => 19,
          :area_id => gamearea106.id)
GameServer.create(
          :name => "辉煌",
          :game_id => 19,
          :area_id => gamearea106.id)
GameServer.create(
          :name => "豪迈",
          :game_id => 19,
          :area_id => gamearea106.id)
gamearea107 = GameArea.create(
          :name => "天长地久(109区)",
          :game_id => 19)
GameServer.create(
          :name => "五湖",
          :game_id => 19,
          :area_id => gamearea107.id)
GameServer.create(
          :name => "四海",
          :game_id => 19,
          :area_id => gamearea107.id)
gamearea108 = GameArea.create(
          :name => "浩然正气(110区）",
          :game_id => 19)
GameServer.create(
          :name => "浩然正气",
          :game_id => 19,
          :area_id => gamearea108.id)
gamearea109 = GameArea.create(
          :name => "功成名就(111区)",
          :game_id => 19)
GameServer.create(
          :name => "接报",
          :game_id => 19,
          :area_id => gamearea109.id)
GameServer.create(
          :name => "佳音",
          :game_id => 19,
          :area_id => gamearea109.id)
gamearea110 = GameArea.create(
          :name => "锦绣前程(112区)",
          :game_id => 19)
GameServer.create(
          :name => "锦绣前程",
          :game_id => 19,
          :area_id => gamearea110.id)
gamearea111 = GameArea.create(
          :name => "名扬四海(113区)",
          :game_id => 19)
GameServer.create(
          :name => "名扬四海",
          :game_id => 19,
          :area_id => gamearea111.id)
gamearea112 = GameArea.create(
          :name => "风华绝代(114区网通）",
          :game_id => 19)
GameServer.create(
          :name => "风华绝代",
          :game_id => 19,
          :area_id => gamearea112.id)
gamearea113 = GameArea.create(
          :name => "花好月圆(115区电信)",
          :game_id => 19)
GameServer.create(
          :name => "花好月圆",
          :game_id => 19,
          :area_id => gamearea113.id)
gamearea114 = GameArea.create(
          :name => "倚天屠龙(116区)",
          :game_id => 19)
GameServer.create(
          :name => "名将",
          :game_id => 19,
          :area_id => gamearea114.id)
GameServer.create(
          :name => "英雄",
          :game_id => 19,
          :area_id => gamearea114.id)
GameServer.create(
          :name => "卧龙",
          :game_id => 19,
          :area_id => gamearea114.id)
gamearea115 = GameArea.create(
          :name => "七周年专区(117区)",
          :game_id => 19)
GameServer.create(
          :name => "泰山（电信）",
          :game_id => 19,
          :area_id => gamearea115.id)
GameServer.create(
          :name => "北斗（北斗）",
          :game_id => 19,
          :area_id => gamearea115.id)
gamearea116 = GameArea.create(
          :name => "富甲天下(118区)",
          :game_id => 19)
GameServer.create(
          :name => "西湖龙吟（电信）",
          :game_id => 19,
          :area_id => gamearea116.id)
GameServer.create(
          :name => "南粤狮吼（电信）",
          :game_id => 19,
          :area_id => gamearea116.id)
GameServer.create(
          :name => "泰山虎啸（网通）",
          :game_id => 19,
          :area_id => gamearea116.id)
gamearea117 = GameArea.create(
          :name => "君临天下(119区)",
          :game_id => 19)
GameServer.create(
          :name => "君临天下",
          :game_id => 19,
          :area_id => gamearea117.id)
gamearea118 = GameArea.create(
          :name => "壮志凌云(120区电信)",
          :game_id => 19)
GameServer.create(
          :name => "壮志凌云",
          :game_id => 19,
          :area_id => gamearea118.id)
gamearea119 = GameArea.create(
          :name => "金玉满堂（121区电信）",
          :game_id => 19)
GameServer.create(
          :name => "金玉满堂",
          :game_id => 19,
          :area_id => gamearea119.id)
gamearea120 = GameArea.create(
          :name => "吉祥如意（122区网通）",
          :game_id => 19)
GameServer.create(
          :name => "吉祥如意",
          :game_id => 19,
          :area_id => gamearea120.id)
gamearea121 = GameArea.create(
          :name => "群雄争霸（123区电信）",
          :game_id => 19)
GameServer.create(
          :name => "群雄争霸",
          :game_id => 19,
          :area_id => gamearea121.id)
gamearea122 = GameArea.create(
          :name => "游剑江湖（124区电信）",
          :game_id => 19)
GameServer.create(
          :name => "游剑江湖",
          :game_id => 19,
          :area_id => gamearea122.id)
gamearea123 = GameArea.create(
          :name => "江山美人（125区网通）",
          :game_id => 19)
GameServer.create(
          :name => "江山美人",
          :game_id => 19,
          :area_id => gamearea123.id)
gamearea124 = GameArea.create(
          :name => "醉酒当歌（126区电信）",
          :game_id => 19)
GameServer.create(
          :name => "醉酒当歌",
          :game_id => 19,
          :area_id => gamearea124.id)
GameServer.create(
          :name => "英雄本色",
          :game_id => 19,
          :area_id => gamearea124.id)
gamearea125 = GameArea.create(
          :name => "壮志豪情（127区电信）",
          :game_id => 19)
GameServer.create(
          :name => "壮志豪情",
          :game_id => 19,
          :area_id => gamearea125.id)
gamearea126 = GameArea.create(
          :name => "叱咤风云（128区）",
          :game_id => 19)
GameServer.create(
          :name => "雄霸",
          :game_id => 19,
          :area_id => gamearea126.id)
GameServer.create(
          :name => "天下",
          :game_id => 19,
          :area_id => gamearea126.id)
GameServer.create(
          :name => "无双",
          :game_id => 19,
          :area_id => gamearea126.id)
gamearea127 = GameArea.create(
          :name => "战无不胜（129区电信）",
          :game_id => 19)
GameServer.create(
          :name => "战无不胜",
          :game_id => 19,
          :area_id => gamearea127.id)
gamearea128 = GameArea.create(
          :name => "百花齐放（130区电信）",
          :game_id => 19)
GameServer.create(
          :name => "百花齐放",
          :game_id => 19,
          :area_id => gamearea128.id)
gamearea129 = GameArea.create(
          :name => "八周年专区",
          :game_id => 19)
GameServer.create(
          :name => "热血",
          :game_id => 19,
          :area_id => gamearea129.id)
GameServer.create(
          :name => "永恒",
          :game_id => 19,
          :area_id => gamearea129.id)
GameServer.create(
          :name => "至尊",
          :game_id => 19,
          :area_id => gamearea129.id)
gamearea130 = GameArea.create(
          :name => "千秋霸业（132区电信）",
          :game_id => 19)
GameServer.create(
          :name => "千秋霸业",
          :game_id => 19,
          :area_id => gamearea130.id)
gamearea131 = GameArea.create(
          :name => "铁血豪情（133区）",
          :game_id => 19)
GameServer.create(
          :name => "铁血",
          :game_id => 19,
          :area_id => gamearea131.id)
GameServer.create(
          :name => "豪情",
          :game_id => 19,
          :area_id => gamearea131.id)
gamearea132 = GameArea.create(
          :name => "气吞山河（134电信）",
          :game_id => 19)
GameServer.create(
          :name => "气吞山河",
          :game_id => 19,
          :area_id => gamearea132.id)
gamearea133 = GameArea.create(
          :name => "比翼双飞（135区）",
          :game_id => 19)
GameServer.create(
          :name => "长相思",
          :game_id => 19,
          :area_id => gamearea133.id)
GameServer.create(
          :name => "蝶恋花",
          :game_id => 19,
          :area_id => gamearea133.id)
gamearea134 = GameArea.create(
          :name => "龙争虎斗（136区）",
          :game_id => 19)
GameServer.create(
          :name => "卧虎",
          :game_id => 19,
          :area_id => gamearea134.id)
GameServer.create(
          :name => "藏龙",
          :game_id => 19,
          :area_id => gamearea134.id)
GameServer.create(
          :name => "",
          :game_id => 19,
          :area_id => gamearea134.id)
gamearea135 = GameArea.create(
          :name => "玛雅复兴资料片（电信）",
          :game_id => 19)
GameServer.create(
          :name => "雄图",
          :game_id => 19,
          :area_id => gamearea135.id)
GameServer.create(
          :name => "霸业",
          :game_id => 19,
          :area_id => gamearea135.id)
GameServer.create(
          :name => "豪情",
          :game_id => 19,
          :area_id => gamearea135.id)
gamearea136 = GameArea.create(
          :name => "玛雅复兴资料片（网通）",
          :game_id => 19)
GameServer.create(
          :name => "盛世",
          :game_id => 19,
          :area_id => gamearea136.id)
GameServer.create(
          :name => "天骄",
          :game_id => 19,
          :area_id => gamearea136.id)
gamearea137 = GameArea.create(
          :name => "绝世独尊（139区电信）",
          :game_id => 19)
GameServer.create(
          :name => "绝世",
          :game_id => 19,
          :area_id => gamearea137.id)
gamearea138 = GameArea.create(
          :name => "名震江湖（140区网通）",
          :game_id => 19)
GameServer.create(
          :name => "豪杰",
          :game_id => 19,
          :area_id => gamearea138.id)
gamearea139 = GameArea.create(
          :name => "激情岁月（141区网通）",
          :game_id => 19)
GameServer.create(
          :name => "经典",
          :game_id => 19,
          :area_id => gamearea139.id)
gamearea140 = GameArea.create(
          :name => "盛世辉煌（142区）",
          :game_id => 19)
GameServer.create(
          :name => "盛世",
          :game_id => 19,
          :area_id => gamearea140.id)
GameServer.create(
          :name => "辉煌",
          :game_id => 19,
          :area_id => gamearea140.id)
gamearea141 = GameArea.create(
          :name => "海纳百川（百区网通专区）",
          :game_id => 19)
GameServer.create(
          :name => "网通专区",
          :game_id => 19,
          :area_id => gamearea141.id)
gamearea142 = GameArea.create(
          :name => "海纳百川（百区电信专区）",
          :game_id => 19)
GameServer.create(
          :name => "电信专区",
          :game_id => 19,
          :area_id => gamearea142.id)
gamearea143 = GameArea.create(
          :name => "百区（湖南湖北专区）",
          :game_id => 19)
GameServer.create(
          :name => "湖南湖北专区",
          :game_id => 19,
          :area_id => gamearea143.id)
gamearea144 = GameArea.create(
          :name => "百区（四川专区）",
          :game_id => 19)
GameServer.create(
          :name => "四川专区",
          :game_id => 19,
          :area_id => gamearea144.id)
gamearea145 = GameArea.create(
          :name => "百区（黑龙江专区）",
          :game_id => 19)
GameServer.create(
          :name => "黑龙江专区",
          :game_id => 19,
          :area_id => gamearea145.id)
gamearea146 = GameArea.create(
          :name => "五湖四海（百区电信专区）",
          :game_id => 19)
GameServer.create(
          :name => "五湖四海",
          :game_id => 19,
          :area_id => gamearea146.id)
  end

  def self.down
  end
end
