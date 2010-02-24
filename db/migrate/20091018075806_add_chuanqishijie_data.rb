class AddChuanqishijieData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "战士",
        :game_id => 18)
GameProfession.create(
        :name => "法师",
        :game_id => 18)
GameProfession.create(
        :name => "道士",
        :game_id => 18)
gamearea1 = GameArea.create(
          :name => "1区龙行天下（上海）",
          :game_id => 18)
GameServer.create(
          :name => "开天",
          :game_id => 18,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "辟地",
          :game_id => 18,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "逐日",
          :game_id => 18,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "奔月",
          :game_id => 18,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "移山",
          :game_id => 18,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "填海",
          :game_id => 18,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "踏浪",
          :game_id => 18,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "御风",
          :game_id => 18,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "2区炎黄至尊（上海）",
          :game_id => 18)
GameServer.create(
          :name => "伏羲",
          :game_id => 18,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "神农",
          :game_id => 18,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "黄帝",
          :game_id => 18,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "炎帝",
          :game_id => 18,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "轩辕",
          :game_id => 18,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "大宇",
          :game_id => 18,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "盘古",
          :game_id => 18,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "周武",
          :game_id => 18,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "3区东城西就（四川）",
          :game_id => 18)
GameServer.create(
          :name => "古堰",
          :game_id => 18,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "千佛",
          :game_id => 18,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "玉龙",
          :game_id => 18,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "苍海",
          :game_id => 18,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "圣殿",
          :game_id => 18,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "飞瀑",
          :game_id => 18,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "灵鹫",
          :game_id => 18,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "秦俑",
          :game_id => 18,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "4区潇湘传奇（湖南）",
          :game_id => 18)
GameServer.create(
          :name => "潇湘",
          :game_id => 18,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "传奇",
          :game_id => 18,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "5区笑傲江湖（上海）",
          :game_id => 18)
GameServer.create(
          :name => "青城",
          :game_id => 18,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "逍遥",
          :game_id => 18,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "少林",
          :game_id => 18,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "武当",
          :game_id => 18,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "峨嵋",
          :game_id => 18,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "天山",
          :game_id => 18,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "昆仑",
          :game_id => 18,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "华山",
          :game_id => 18,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "6区天马行空（北京）",
          :game_id => 18)
GameServer.create(
          :name => "赤兔",
          :game_id => 18,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "白龙",
          :game_id => 18,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "青松",
          :game_id => 18,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "黄骠",
          :game_id => 18,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "紫燕",
          :game_id => 18,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "银翼",
          :game_id => 18,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "玉追",
          :game_id => 18,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "乌骓",
          :game_id => 18,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "7区剑横四海（上海）",
          :game_id => 18)
GameServer.create(
          :name => "倚天",
          :game_id => 18,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "屠龙",
          :game_id => 18,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "干将",
          :game_id => 18,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "莫邪",
          :game_id => 18,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "越王",
          :game_id => 18,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "鱼肠",
          :game_id => 18,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "龙渊",
          :game_id => 18,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "青虹",
          :game_id => 18,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "8区沸蓝星空（浙江）",
          :game_id => 18)
GameServer.create(
          :name => "沸蓝",
          :game_id => 18,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "星空",
          :game_id => 18,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "追月",
          :game_id => 18,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "9区龙啸长安（西安）",
          :game_id => 18)
GameServer.create(
          :name => "龙啸",
          :game_id => 18,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "长安",
          :game_id => 18,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "10区吞噬天下（上海）",
          :game_id => 18)
GameServer.create(
          :name => "吞噬天下",
          :game_id => 18,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "11区三国演义（上海）",
          :game_id => 18)
GameServer.create(
          :name => "三国演义",
          :game_id => 18,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "12区秋水长天（上海）",
          :game_id => 18)
GameServer.create(
          :name => "秋水长天",
          :game_id => 18,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "13区林海雪原",
          :game_id => 18)
GameServer.create(
          :name => "林海雪原",
          :game_id => 18,
          :area_id => gamearea13.id)
gamearea14 = GameArea.create(
          :name => "14区龙腾四海",
          :game_id => 18)
GameServer.create(
          :name => "龙腾四海",
          :game_id => 18,
          :area_id => gamearea14.id)
gamearea15 = GameArea.create(
          :name => "15区岭南风云",
          :game_id => 18)
GameServer.create(
          :name => "岭南风云",
          :game_id => 18,
          :area_id => gamearea15.id)
gamearea16 = GameArea.create(
          :name => "16区雄霸九州",
          :game_id => 18)
GameServer.create(
          :name => "雄霸九州",
          :game_id => 18,
          :area_id => gamearea16.id)
gamearea17 = GameArea.create(
          :name => "17区纵横天下",
          :game_id => 18)
GameServer.create(
          :name => "纵横天下",
          :game_id => 18,
          :area_id => gamearea17.id)
gamearea18 = GameArea.create(
          :name => "18区巴国战魂",
          :game_id => 18)
GameServer.create(
          :name => "巴国战魂",
          :game_id => 18,
          :area_id => gamearea18.id)
gamearea19 = GameArea.create(
          :name => "19区南征北战",
          :game_id => 18)
GameServer.create(
          :name => "南征北战",
          :game_id => 18,
          :area_id => gamearea19.id)
gamearea20 = GameArea.create(
          :name => "20区万王之王",
          :game_id => 18)
GameServer.create(
          :name => "万王之王",
          :game_id => 18,
          :area_id => gamearea20.id)
gamearea21 = GameArea.create(
          :name => "21区王者如意",
          :game_id => 18)
GameServer.create(
          :name => "王者如意",
          :game_id => 18,
          :area_id => gamearea21.id)
gamearea22 = GameArea.create(
          :name => "22区天地英雄",
          :game_id => 18)
GameServer.create(
          :name => "天地英雄",
          :game_id => 18,
          :area_id => gamearea22.id)
gamearea23 = GameArea.create(
          :name => "23区齐鲁英雄",
          :game_id => 18)
GameServer.create(
          :name => "齐鲁英雄",
          :game_id => 18,
          :area_id => gamearea23.id)
gamearea24 = GameArea.create(
          :name => "24区卧虎藏龙",
          :game_id => 18)
GameServer.create(
          :name => "卧虎藏龙",
          :game_id => 18,
          :area_id => gamearea24.id)
gamearea25 = GameArea.create(
          :name => "25区华夏英豪",
          :game_id => 18)
GameServer.create(
          :name => "华夏英豪",
          :game_id => 18,
          :area_id => gamearea25.id)
gamearea26 = GameArea.create(
          :name => "26区雄图霸业",
          :game_id => 18)
GameServer.create(
          :name => "雄图霸业",
          :game_id => 18,
          :area_id => gamearea26.id)
gamearea27 = GameArea.create(
          :name => "27区锋芒毕露",
          :game_id => 18)
GameServer.create(
          :name => "锋芒毕露",
          :game_id => 18,
          :area_id => gamearea27.id)
gamearea28 = GameArea.create(
          :name => "28区英雄无敌",
          :game_id => 18)
GameServer.create(
          :name => "英雄无敌",
          :game_id => 18,
          :area_id => gamearea28.id)
gamearea29 = GameArea.create(
          :name => "29区蜀汉帝国",
          :game_id => 18)
GameServer.create(
          :name => "蜀汉帝国",
          :game_id => 18,
          :area_id => gamearea29.id)
gamearea30 = GameArea.create(
          :name => "30区金玉奇缘",
          :game_id => 18)
GameServer.create(
          :name => "金玉奇缘",
          :game_id => 18,
          :area_id => gamearea30.id)
gamearea31 = GameArea.create(
          :name => "31区互联星空",
          :game_id => 18)
GameServer.create(
          :name => "互联星空",
          :game_id => 18,
          :area_id => gamearea31.id)
gamearea32 = GameArea.create(
          :name => "32区风云乍起",
          :game_id => 18)
GameServer.create(
          :name => "风云乍起",
          :game_id => 18,
          :area_id => gamearea32.id)
gamearea33 = GameArea.create(
          :name => "33区塞外传奇",
          :game_id => 18)
GameServer.create(
          :name => "塞外传奇",
          :game_id => 18,
          :area_id => gamearea33.id)
gamearea34 = GameArea.create(
          :name => "34区北国天骄",
          :game_id => 18)
GameServer.create(
          :name => "北国天骄",
          :game_id => 18,
          :area_id => gamearea34.id)
gamearea35 = GameArea.create(
          :name => "35区碧海青天",
          :game_id => 18)
GameServer.create(
          :name => "碧海青天",
          :game_id => 18,
          :area_id => gamearea35.id)
gamearea36 = GameArea.create(
          :name => "36区飞雪连天",
          :game_id => 18)
GameServer.create(
          :name => "飞雪连天",
          :game_id => 18,
          :area_id => gamearea36.id)
gamearea37 = GameArea.create(
          :name => "37区彩云之路",
          :game_id => 18)
GameServer.create(
          :name => "彩云之路",
          :game_id => 18,
          :area_id => gamearea37.id)
gamearea38 = GameArea.create(
          :name => "38区楚天豪情",
          :game_id => 18)
GameServer.create(
          :name => "楚天豪情",
          :game_id => 18,
          :area_id => gamearea38.id)
gamearea39 = GameArea.create(
          :name => "39区飞天狂舞",
          :game_id => 18)
GameServer.create(
          :name => "飞天狂舞",
          :game_id => 18,
          :area_id => gamearea39.id)
gamearea40 = GameArea.create(
          :name => "40区蜀山剑侠",
          :game_id => 18)
GameServer.create(
          :name => "蜀山剑侠",
          :game_id => 18,
          :area_id => gamearea40.id)
gamearea41 = GameArea.create(
          :name => "41区仗剑天涯",
          :game_id => 18)
GameServer.create(
          :name => "仗剑天涯",
          :game_id => 18,
          :area_id => gamearea41.id)
gamearea42 = GameArea.create(
          :name => "42区傲视天下",
          :game_id => 18)
GameServer.create(
          :name => "傲视天下",
          :game_id => 18,
          :area_id => gamearea42.id)
gamearea43 = GameArea.create(
          :name => "43区气吞山河",
          :game_id => 18)
GameServer.create(
          :name => "气吞山河",
          :game_id => 18,
          :area_id => gamearea43.id)
gamearea44 = GameArea.create(
          :name => "44区君临天下",
          :game_id => 18)
GameServer.create(
          :name => "君临天下",
          :game_id => 18,
          :area_id => gamearea44.id)
gamearea45 = GameArea.create(
          :name => "45区冰龙破晓",
          :game_id => 18)
GameServer.create(
          :name => "冰龙破晓",
          :game_id => 18,
          :area_id => gamearea45.id)
gamearea46 = GameArea.create(
          :name => "46区六朝盛世",
          :game_id => 18)
GameServer.create(
          :name => "六朝盛世",
          :game_id => 18,
          :area_id => gamearea46.id)
gamearea47 = GameArea.create(
          :name => "47区津门降龙",
          :game_id => 18)
GameServer.create(
          :name => "津门降龙",
          :game_id => 18,
          :area_id => gamearea47.id)
gamearea48 = GameArea.create(
          :name => "48区天山雪莲",
          :game_id => 18)
GameServer.create(
          :name => "天山雪莲",
          :game_id => 18,
          :area_id => gamearea48.id)
gamearea49 = GameArea.create(
          :name => "49区啸傲江南",
          :game_id => 18)
GameServer.create(
          :name => "啸傲江南",
          :game_id => 18,
          :area_id => gamearea49.id)
gamearea50 = GameArea.create(
          :name => "50区天上人间",
          :game_id => 18)
GameServer.create(
          :name => "天上人间",
          :game_id => 18,
          :area_id => gamearea50.id)
gamearea51 = GameArea.create(
          :name => "51区皓月千里",
          :game_id => 18)
GameServer.create(
          :name => "皓月千里",
          :game_id => 18,
          :area_id => gamearea51.id)
gamearea52 = GameArea.create(
          :name => "52区少林正宗",
          :game_id => 18)
GameServer.create(
          :name => "少林正宗",
          :game_id => 18,
          :area_id => gamearea52.id)
gamearea53 = GameArea.create(
          :name => "53区碧海苍穹",
          :game_id => 18)
GameServer.create(
          :name => "碧海苍穹",
          :game_id => 18,
          :area_id => gamearea53.id)
gamearea54 = GameArea.create(
          :name => "54区凤舞九天",
          :game_id => 18)
GameServer.create(
          :name => "凤舞九天",
          :game_id => 18,
          :area_id => gamearea54.id)
gamearea55 = GameArea.create(
          :name => "55区紫禁皇城",
          :game_id => 18)
GameServer.create(
          :name => "紫禁皇城",
          :game_id => 18,
          :area_id => gamearea55.id)
gamearea56 = GameArea.create(
          :name => "56区传奇世界",
          :game_id => 18)
GameServer.create(
          :name => "中州落霞",
          :game_id => 18,
          :area_id => gamearea56.id)
GameServer.create(
          :name => "跃马热砂",
          :game_id => 18,
          :area_id => gamearea56.id)
gamearea57 = GameArea.create(
          :name => "57区灵山仙境",
          :game_id => 18)
GameServer.create(
          :name => "灵山",
          :game_id => 18,
          :area_id => gamearea57.id)
GameServer.create(
          :name => "仙境",
          :game_id => 18,
          :area_id => gamearea57.id)
gamearea58 = GameArea.create(
          :name => "58区龙啸黑土",
          :game_id => 18)
GameServer.create(
          :name => "龙啸黑土",
          :game_id => 18,
          :area_id => gamearea58.id)
gamearea59 = GameArea.create(
          :name => "59区天地豪情",
          :game_id => 18)
GameServer.create(
          :name => "天地豪情",
          :game_id => 18,
          :area_id => gamearea59.id)
gamearea60 = GameArea.create(
          :name => "60区王者无敌",
          :game_id => 18)
GameServer.create(
          :name => "王者无敌",
          :game_id => 18,
          :area_id => gamearea60.id)
gamearea61 = GameArea.create(
          :name => "61区巴山蜀水",
          :game_id => 18)
GameServer.create(
          :name => "巴山蜀水",
          :game_id => 18,
          :area_id => gamearea61.id)
gamearea62 = GameArea.create(
          :name => "62区普天同庆",
          :game_id => 18)
GameServer.create(
          :name => "普天同庆",
          :game_id => 18,
          :area_id => gamearea62.id)
gamearea63 = GameArea.create(
          :name => "63区虎啸龙吟",
          :game_id => 18)
GameServer.create(
          :name => "虎啸龙吟",
          :game_id => 18,
          :area_id => gamearea63.id)
gamearea64 = GameArea.create(
          :name => "64区江南仙境",
          :game_id => 18)
GameServer.create(
          :name => "江南仙境",
          :game_id => 18,
          :area_id => gamearea64.id)
gamearea65 = GameArea.create(
          :name => "65区天下无双",
          :game_id => 18)
GameServer.create(
          :name => "天下无双",
          :game_id => 18,
          :area_id => gamearea65.id)
gamearea66 = GameArea.create(
          :name => "66区雄霸天下",
          :game_id => 18)
GameServer.create(
          :name => "雄霸天下",
          :game_id => 18,
          :area_id => gamearea66.id)
gamearea67 = GameArea.create(
          :name => "67区烟雨江南",
          :game_id => 18)
GameServer.create(
          :name => "烟雨江南",
          :game_id => 18,
          :area_id => gamearea67.id)
gamearea68 = GameArea.create(
          :name => "68区龙祥之地",
          :game_id => 18)
GameServer.create(
          :name => "龙祥之地",
          :game_id => 18,
          :area_id => gamearea68.id)
gamearea69 = GameArea.create(
          :name => "69区湖光山色",
          :game_id => 18)
GameServer.create(
          :name => "湖光山色",
          :game_id => 18,
          :area_id => gamearea69.id)
gamearea70 = GameArea.create(
          :name => "70区福瑞无极",
          :game_id => 18)
GameServer.create(
          :name => "福瑞无极",
          :game_id => 18,
          :area_id => gamearea70.id)
gamearea71 = GameArea.create(
          :name => "71区VIP专区",
          :game_id => 18)
GameServer.create(
          :name => "金碧辉煌",
          :game_id => 18,
          :area_id => gamearea71.id)
gamearea72 = GameArea.create(
          :name => "72区威震山河",
          :game_id => 18)
GameServer.create(
          :name => "威震山河",
          :game_id => 18,
          :area_id => gamearea72.id)
gamearea73 = GameArea.create(
          :name => "73区胜景仙居",
          :game_id => 18)
GameServer.create(
          :name => "胜景仙居",
          :game_id => 18,
          :area_id => gamearea73.id)
gamearea74 = GameArea.create(
          :name => "74区碧血情天",
          :game_id => 18)
GameServer.create(
          :name => "碧血情天",
          :game_id => 18,
          :area_id => gamearea74.id)
gamearea75 = GameArea.create(
          :name => "75区猛龙过江",
          :game_id => 18)
GameServer.create(
          :name => "猛龙过江",
          :game_id => 18,
          :area_id => gamearea75.id)
gamearea76 = GameArea.create(
          :name => "76区风云万里",
          :game_id => 18)
GameServer.create(
          :name => "风云万里",
          :game_id => 18,
          :area_id => gamearea76.id)
gamearea77 = GameArea.create(
          :name => "77区天下无敌",
          :game_id => 18)
GameServer.create(
          :name => "天下无敌",
          :game_id => 18,
          :area_id => gamearea77.id)
gamearea78 = GameArea.create(
          :name => "78区丹心碧石",
          :game_id => 18)
GameServer.create(
          :name => "丹心碧石",
          :game_id => 18,
          :area_id => gamearea78.id)
gamearea79 = GameArea.create(
          :name => "79区奇门遁甲",
          :game_id => 18)
GameServer.create(
          :name => "奇门遁甲",
          :game_id => 18,
          :area_id => gamearea79.id)
gamearea80 = GameArea.create(
          :name => "80区南海落霞",
          :game_id => 18)
GameServer.create(
          :name => "南海落霞",
          :game_id => 18,
          :area_id => gamearea80.id)
gamearea81 = GameArea.create(
          :name => "81区天府之国",
          :game_id => 18)
GameServer.create(
          :name => "天府之国",
          :game_id => 18,
          :area_id => gamearea81.id)
gamearea82 = GameArea.create(
          :name => "82区清明上河",
          :game_id => 18)
GameServer.create(
          :name => "清明上河",
          :game_id => 18,
          :area_id => gamearea82.id)
gamearea83 = GameArea.create(
          :name => "83区龙腾九天",
          :game_id => 18)
GameServer.create(
          :name => "龙腾九天",
          :game_id => 18,
          :area_id => gamearea83.id)
gamearea84 = GameArea.create(
          :name => "84区四海争霸",
          :game_id => 18)
GameServer.create(
          :name => "四海争霸",
          :game_id => 18,
          :area_id => gamearea84.id)
gamearea85 = GameArea.create(
          :name => "85区大自在天",
          :game_id => 18)
GameServer.create(
          :name => "大自在天",
          :game_id => 18,
          :area_id => gamearea85.id)
gamearea86 = GameArea.create(
          :name => "86区龙潭映月",
          :game_id => 18)
GameServer.create(
          :name => "龙潭映月",
          :game_id => 18,
          :area_id => gamearea86.id)
gamearea87 = GameArea.create(
          :name => "87区傲视群雄",
          :game_id => 18)
GameServer.create(
          :name => "傲视群雄",
          :game_id => 18,
          :area_id => gamearea87.id)
gamearea88 = GameArea.create(
          :name => "89区叱咤群雄",
          :game_id => 18)
GameServer.create(
          :name => "叱咤群雄",
          :game_id => 18,
          :area_id => gamearea88.id)
gamearea89 = GameArea.create(
          :name => "90区笑看风云",
          :game_id => 18)
GameServer.create(
          :name => "笑看风云",
          :game_id => 18,
          :area_id => gamearea89.id)
gamearea90 = GameArea.create(
          :name => "91区盛世英雄",
          :game_id => 18)
GameServer.create(
          :name => "盛世英雄",
          :game_id => 18,
          :area_id => gamearea90.id)
gamearea91 = GameArea.create(
          :name => "92区胜者为王",
          :game_id => 18)
GameServer.create(
          :name => "胜者为王",
          :game_id => 18,
          :area_id => gamearea91.id)
gamearea92 = GameArea.create(
          :name => "93区群龙聚首",
          :game_id => 18)
GameServer.create(
          :name => "群龙聚首",
          :game_id => 18,
          :area_id => gamearea92.id)
gamearea93 = GameArea.create(
          :name => "94区元神分身",
          :game_id => 18)
GameServer.create(
          :name => "元神分身",
          :game_id => 18,
          :area_id => gamearea93.id)
gamearea94 = GameArea.create(
          :name => "95区傲视凌云",
          :game_id => 18)
GameServer.create(
          :name => "傲视凌云",
          :game_id => 18,
          :area_id => gamearea94.id)
gamearea95 = GameArea.create(
          :name => "96区白日飞升",
          :game_id => 18)
GameServer.create(
          :name => "白日飞升",
          :game_id => 18,
          :area_id => gamearea95.id)
gamearea96 = GameArea.create(
          :name => "97区魔动九天",
          :game_id => 18)
GameServer.create(
          :name => "魔天",
          :game_id => 18,
          :area_id => gamearea96.id)
GameServer.create(
          :name => "魂海",
          :game_id => 18,
          :area_id => gamearea96.id)
gamearea97 = GameArea.create(
          :name => "98区三载霸业",
          :game_id => 18)
GameServer.create(
          :name => "镇国",
          :game_id => 18,
          :area_id => gamearea97.id)
GameServer.create(
          :name => "神策",
          :game_id => 18,
          :area_id => gamearea97.id)
GameServer.create(
          :name => "威武",
          :game_id => 18,
          :area_id => gamearea97.id)
gamearea98 = GameArea.create(
          :name => "99区九九归真",
          :game_id => 18)
GameServer.create(
          :name => "赤焰",
          :game_id => 18,
          :area_id => gamearea98.id)
GameServer.create(
          :name => "红日",
          :game_id => 18,
          :area_id => gamearea98.id)
gamearea99 = GameArea.create(
          :name => "100区百战争雄",
          :game_id => 18)
GameServer.create(
          :name => "霸日",
          :game_id => 18,
          :area_id => gamearea99.id)
GameServer.create(
          :name => "傲月",
          :game_id => 18,
          :area_id => gamearea99.id)
GameServer.create(
          :name => "破天",
          :game_id => 18,
          :area_id => gamearea99.id)
GameServer.create(
          :name => "裂地",
          :game_id => 18,
          :area_id => gamearea99.id)
GameServer.create(
          :name => "震山",
          :game_id => 18,
          :area_id => gamearea99.id)
GameServer.create(
          :name => "摄海",
          :game_id => 18,
          :area_id => gamearea99.id)
gamearea100 = GameArea.create(
          :name => "101区修神入魔",
          :game_id => 18)
GameServer.create(
          :name => "绝技",
          :game_id => 18,
          :area_id => gamearea100.id)
GameServer.create(
          :name => "神器",
          :game_id => 18,
          :area_id => gamearea100.id)
GameServer.create(
          :name => "魔兵",
          :game_id => 18,
          :area_id => gamearea100.id)
gamearea101 = GameArea.create(
          :name => "102区金榜题名",
          :game_id => 18)
GameServer.create(
          :name => "剑兰",
          :game_id => 18,
          :area_id => gamearea101.id)
GameServer.create(
          :name => "凌霄",
          :game_id => 18,
          :area_id => gamearea101.id)
gamearea102 = GameArea.create(
          :name => "103区四载称雄",
          :game_id => 18)
GameServer.create(
          :name => "辉煌伟业",
          :game_id => 18,
          :area_id => gamearea102.id)
GameServer.create(
          :name => "永恒鸿图",
          :game_id => 18,
          :area_id => gamearea102.id)
gamearea103 = GameArea.create(
          :name => "104区神威幻境",
          :game_id => 18)
GameServer.create(
          :name => "蟠龙",
          :game_id => 18,
          :area_id => gamearea103.id)
gamearea104 = GameArea.create(
          :name => "105区南粤雄风",
          :game_id => 18)
GameServer.create(
          :name => "天河",
          :game_id => 18,
          :area_id => gamearea104.id)
gamearea105 = GameArea.create(
          :name => "106区神州大地",
          :game_id => 18)
GameServer.create(
          :name => "繁荣",
          :game_id => 18,
          :area_id => gamearea105.id)
GameServer.create(
          :name => "昌盛",
          :game_id => 18,
          :area_id => gamearea105.id)
gamearea106 = GameArea.create(
          :name => "107区雄霸荆楚",
          :game_id => 18)
GameServer.create(
          :name => "楚天",
          :game_id => 18,
          :area_id => gamearea106.id)
gamearea107 = GameArea.create(
          :name => "108区富甲天下",
          :game_id => 18)
GameServer.create(
          :name => "秦淮",
          :game_id => 18,
          :area_id => gamearea107.id)
GameServer.create(
          :name => "蜀山",
          :game_id => 18,
          :area_id => gamearea107.id)
GameServer.create(
          :name => "梁山",
          :game_id => 18,
          :area_id => gamearea107.id)
gamearea108 = GameArea.create(
          :name => "109区中华英豪",
          :game_id => 18)
GameServer.create(
          :name => "雄风",
          :game_id => 18,
          :area_id => gamearea108.id)
gamearea109 = GameArea.create(
          :name => "110区福禄齐天",
          :game_id => 18)
GameServer.create(
          :name => "福佑",
          :game_id => 18,
          :area_id => gamearea109.id)
GameServer.create(
          :name => "聚宝",
          :game_id => 18,
          :area_id => gamearea109.id)
GameServer.create(
          :name => "鸿运",
          :game_id => 18,
          :area_id => gamearea109.id)
gamearea110 = GameArea.create(
          :name => "111区谁与争锋",
          :game_id => 18)
GameServer.create(
          :name => "称雄",
          :game_id => 18,
          :area_id => gamearea110.id)
GameServer.create(
          :name => "独霸",
          :game_id => 18,
          :area_id => gamearea110.id)
gamearea111 = GameArea.create(
          :name => "112区唯我独尊",
          :game_id => 18)
GameServer.create(
          :name => "傲世",
          :game_id => 18,
          :area_id => gamearea111.id)
GameServer.create(
          :name => "霸天",
          :game_id => 18,
          :area_id => gamearea111.id)
gamearea112 = GameArea.create(
          :name => "113区钱塘风云",
          :game_id => 18)
GameServer.create(
          :name => "傲龙",
          :game_id => 18,
          :area_id => gamearea112.id)
gamearea113 = GameArea.create(
          :name => "114区百事亨通",
          :game_id => 18)
GameServer.create(
          :name => "吉顺",
          :game_id => 18,
          :area_id => gamearea113.id)
gamearea114 = GameArea.create(
          :name => "115区五福临门",
          :game_id => 18)
GameServer.create(
          :name => "富贵",
          :game_id => 18,
          :area_id => gamearea114.id)
GameServer.create(
          :name => "祥瑞",
          :game_id => 18,
          :area_id => gamearea114.id)
gamearea115 = GameArea.create(
          :name => "116区功成名就",
          :game_id => 18)
GameServer.create(
          :name => "荣耀",
          :game_id => 18,
          :area_id => gamearea115.id)
gamearea116 = GameArea.create(
          :name => "117区名满天下",
          :game_id => 18)
GameServer.create(
          :name => "虎门",
          :game_id => 18,
          :area_id => gamearea116.id)
gamearea117 = GameArea.create(
          :name => "118区举国同庆",
          :game_id => 18)
GameServer.create(
          :name => "腾飞",
          :game_id => 18,
          :area_id => gamearea117.id)
GameServer.create(
          :name => "霸世",
          :game_id => 18,
          :area_id => gamearea117.id)
gamearea118 = GameArea.create(
          :name => "119区盛世九州",
          :game_id => 18)
GameServer.create(
          :name => "神韵",
          :game_id => 18,
          :area_id => gamearea118.id)
gamearea119 = GameArea.create(
          :name => "120区龙吟九霄",
          :game_id => 18)
GameServer.create(
          :name => "创世",
          :game_id => 18,
          :area_id => gamearea119.id)
gamearea120 = GameArea.create(
          :name => "121区金牛拓春",
          :game_id => 18)
GameServer.create(
          :name => "吉祥",
          :game_id => 18,
          :area_id => gamearea120.id)
GameServer.create(
          :name => "如意",
          :game_id => 18,
          :area_id => gamearea120.id)
gamearea121 = GameArea.create(
          :name => "122区潜龙在渊",
          :game_id => 18)
GameServer.create(
          :name => "龙腾",
          :game_id => 18,
          :area_id => gamearea121.id)
gamearea122 = GameArea.create(
          :name => "123区真爱永恒",
          :game_id => 18)
GameServer.create(
          :name => "天长",
          :game_id => 18,
          :area_id => gamearea122.id)
GameServer.create(
          :name => "地久",
          :game_id => 18,
          :area_id => gamearea122.id)
gamearea123 = GameArea.create(
          :name => "124区吴越争锋",
          :game_id => 18)
GameServer.create(
          :name => "钱塘",
          :game_id => 18,
          :area_id => gamearea123.id)
gamearea124 = GameArea.create(
          :name => "125区六载盛世",
          :game_id => 18)
GameServer.create(
          :name => "炎日",
          :game_id => 18,
          :area_id => gamearea124.id)
GameServer.create(
          :name => "银月",
          :game_id => 18,
          :area_id => gamearea124.id)
GameServer.create(
          :name => "焚天",
          :game_id => 18,
          :area_id => gamearea124.id)
gamearea125 = GameArea.create(
          :name => "126区移动江湖",
          :game_id => 18)
GameServer.create(
          :name => "金陵",
          :game_id => 18,
          :area_id => gamearea125.id)
gamearea126 = GameArea.create(
          :name => "127区宏图大业",
          :game_id => 18)
GameServer.create(
          :name => "天安",
          :game_id => 18,
          :area_id => gamearea126.id)
GameServer.create(
          :name => "福瑞",
          :game_id => 18,
          :area_id => gamearea126.id)
gamearea127 = GameArea.create(
          :name => "88区英雄霸业（电信区）",
          :game_id => 18)
GameServer.create(
          :name => "王者归来",
          :game_id => 18,
          :area_id => gamearea127.id)
gamearea128 = GameArea.create(
          :name => "88区英雄霸业（网通区）",
          :game_id => 18)
GameServer.create(
          :name => "耀阳·紫月",
          :game_id => 18,
          :area_id => gamearea128.id)
gamearea129 = GameArea.create(
          :name => "88区英雄霸业（江浙专区）",
          :game_id => 18)
GameServer.create(
          :name => "王者归来",
          :game_id => 18,
          :area_id => gamearea129.id)
gamearea130 = GameArea.create(
          :name => "88区英雄霸业（四川专区）",
          :game_id => 18)
GameServer.create(
          :name => "王者归来",
          :game_id => 18,
          :area_id => gamearea130.id)
  end

  def self.down
  end
end
