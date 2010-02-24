class AddZhuxian2Data < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "人族青云门",
        :game_id => 31)
GameProfession.create(
        :name => "人族天音寺",
        :game_id => 31)
GameProfession.create(
        :name => "人族鬼道",
        :game_id => 31)
GameProfession.create(
        :name => "人族合欢派",
        :game_id => 31)
GameProfession.create(
        :name => "人族鬼王宗",
        :game_id => 31)
GameProfession.create(
        :name => "人族焚香谷",
        :game_id => 31)
GameProfession.create(
        :name => "神裔九黎",
        :game_id => 31)
GameProfession.create(
        :name => "神裔烈山",
        :game_id => 31)
GameProfession.create(
        :name => "神裔怀光",
        :game_id => 31)
GameProfession.create(
        :name => "神裔东夷",
        :game_id => 31)
GameProfession.create(
        :name => "神裔太昊",
        :game_id => 31)
GameProfession.create(
        :name => "神裔天华",
        :game_id => 31)
gamearea1 = GameArea.create(
          :name => "电信一区",
          :game_id => 31)
GameServer.create(
          :name => "幻月",
          :game_id => 31,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "乘黄",
          :game_id => 31,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "斩龙",
          :game_id => 31,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "紫电",
          :game_id => 31,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "静竹",
          :game_id => 31,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "问鼎",
          :game_id => 31,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "承影",
          :game_id => 31,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "御风",
          :game_id => 31,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "墨雪",
          :game_id => 31,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "凯旋",
          :game_id => 31,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "君临",
          :game_id => 31,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "六道",
          :game_id => 31,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "流波",
          :game_id => 31,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "通天",
          :game_id => 31,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天龙",
          :game_id => 31,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "伏虎",
          :game_id => 31,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "荣光",
          :game_id => 31,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信二区",
          :game_id => 31)
GameServer.create(
          :name => "天涯",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "风云",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "恒星",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "逐梦",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "雷炎",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "青虹",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "游龙",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "破天",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "碧空",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "御空",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "天烽",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "永恒",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "纵横",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "神尊",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "碧炎",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "御天",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "风华",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "烽火",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "四海",
          :game_id => 31,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "旭日",
          :game_id => 31,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "电信三区",
          :game_id => 31)
GameServer.create(
          :name => "川流",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "旋音",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "仙露",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "惊雷",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "冷月",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "晨星",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "月魂",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "海天",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "星海",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "翱翔",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "巨灵",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "银月",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "龙搏",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "碧华",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "影月",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "凌波",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "金鼎",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "星空",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "清润",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "碧城",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "云海",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "苍天",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "晨光",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "战魂",
          :game_id => 31,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "龙海",
          :game_id => 31,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "电信四区",
          :game_id => 31)
GameServer.create(
          :name => "昌龙",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "锦龙",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "火龙",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "豪龙",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "云天",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "震天",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "仙羽",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "侠龙",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "暗龙",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "浩宇",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "飞羽",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "伏龙",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "锦云",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "烈风",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "风河",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "九州",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "落霞",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "战火",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "天书",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "清风",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "碧瑶",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "三界",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "天城",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "雷神",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "星河",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "豪雷",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "至尊",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "九幽",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "凌天",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "凌云",
          :game_id => 31,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "争鸣",
          :game_id => 31,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "电信五区",
          :game_id => 31)
GameServer.create(
          :name => "神光",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "傲神",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "天泽",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "十美",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "锦绣",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "绣辉",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "星璇",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "雪琪",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "惊鸿",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "烈焰",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "神威",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "飞翼",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "浩瀚",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "天麟",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "星光",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "神域",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "神剑",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "辉煌",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "星翼",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "顶天",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "神曲",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "惊焰",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "天语",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "流云",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "星魂",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "斗神",
          :game_id => 31,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "天歌",
          :game_id => 31,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "网通一区",
          :game_id => 31)
GameServer.create(
          :name => "腾龙",
          :game_id => 31,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "无双",
          :game_id => 31,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "聚仙",
          :game_id => 31,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "幻风",
          :game_id => 31,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "凤羽",
          :game_id => 31,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "华彩",
          :game_id => 31,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "九天",
          :game_id => 31,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "乾风",
          :game_id => 31,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "幻灵",
          :game_id => 31,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "创世",
          :game_id => 31,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "射日",
          :game_id => 31,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "玄火",
          :game_id => 31,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "轩辕",
          :game_id => 31,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "龙渊",
          :game_id => 31,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "天翔",
          :game_id => 31,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "鸿蒙",
          :game_id => 31,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "网通二区",
          :game_id => 31)
GameServer.create(
          :name => "耀月",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "天机",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "天剑",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "晨曦",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "狂神",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "斩情",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "百耀",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "银星",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "黎明",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "夜空",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "征程",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "百黎",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "炎黄",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "浩星",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "剑舞",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "轰雷",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "傲剑",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "风暴",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "浩日",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "雄关",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "碧瑶",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "漫天",
          :game_id => 31,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "鸿宇",
          :game_id => 31,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "网通三区",
          :game_id => 31)
GameServer.create(
          :name => "豪杰",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "国威",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "百川",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "星梦",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "火云",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "巅峰",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "御威",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "荣耀",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "十全",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "耀雷",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "霸气",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "梦翔",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "若水",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "风雷",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "川火",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "狂涛",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "雄霸",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "玄黄",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "雪琪",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "御雷",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "明月",
          :game_id => 31,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "豪迈",
          :game_id => 31,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "新电信一区",
          :game_id => 31)
GameServer.create(
          :name => "承光殿",
          :game_id => 31,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "神武池",
          :game_id => 31,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "璇玑洞",
          :game_id => 31,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "天圣宫",
          :game_id => 31,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "伏羲祠",
          :game_id => 31,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "观星洞",
          :game_id => 31,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "玉清殿",
          :game_id => 31,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "登云台",
          :game_id => 31,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "落英谷",
          :game_id => 31,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "相思木",
          :game_id => 31,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "新网通一区",
          :game_id => 31)
GameServer.create(
          :name => "青丘",
          :game_id => 31,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "帝坛",
          :game_id => 31,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "赤城",
          :game_id => 31,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "神农殿",
          :game_id => 31,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "莹华殿",
          :game_id => 31,
          :area_id => gamearea10.id)
  end

  def self.down
  end
end
