class AddDahuaxiyouData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "人族大唐官府",
        :game_id => 44)
GameProfession.create(
        :name => "人族化生寺",
        :game_id => 44)
GameProfession.create(
        :name => "人族方寸山",
        :game_id => 44)
GameProfession.create(
        :name => "人族女儿村",
        :game_id => 44)
GameProfession.create(
        :name => "仙族龙宫",
        :game_id => 44)
GameProfession.create(
        :name => "仙族普陀山",
        :game_id => 44)
GameProfession.create(
        :name => "仙族五庄观",
        :game_id => 44)
GameProfession.create(
        :name => "仙族天宫",
        :game_id => 44)
GameProfession.create(
        :name => "魔族幽冥地府",
        :game_id => 44)
GameProfession.create(
        :name => "魔族魔王寨",
        :game_id => 44)
GameProfession.create(
        :name => "魔族盘丝洞",
        :game_id => 44)
GameProfession.create(
        :name => "魔族狮驼岭",
        :game_id => 44)
gamearea1 = GameArea.create(
          :name => "天界",
          :game_id => 44)
GameServer.create(
          :name => "宝光殿",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "离恨天",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "太子殿",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "缘分天空",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "江山如画",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "比翼双飞",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "灵霄殿",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天若有情",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "云梦仙境",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "长虹贯日",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "大闹天宫",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "琉璃仙境",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天上人间",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "云中殿",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天下无双",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "东胜神州",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "哪吒闹海",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "五明宫",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "紫微宫",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "杏花雨",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "广寒玉桂",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "蓬莱仙岛",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "西牛贺洲",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "醉蓬莱",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "采桑子",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "花好月圆",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "齐天府",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "仙灵虚空",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "宝莲灯",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "虞美人",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "镜花水月",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "世外桃源",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "小西天",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "燕赵天地",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "秦时明月",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "九天福地",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "水晶宫",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "瑶池圣域",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "洞仙歌",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "有凤来仪",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "雷霆九天",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "水月洞天",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "御花园",
          :game_id => 44,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "龙的传人",
          :game_id => 44,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "人界",
          :game_id => 44)
GameServer.create(
          :name => "比丘国",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "剑雨飘香",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "天府之国",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "雪域天国",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "通天河",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "碧波潭",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "京华烟云",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "乌鸡国",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "小窗幽记",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "龙凤呈祥",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "沧州府",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "凌烟阁",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "西梁国",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "芳华绝代",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "似水流年",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "茶马古道",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "楼兰古城",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "莘莘学子",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "围炉夜话",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "倾国倾城",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "东海渔村",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "牡丹坊",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "玄剑书香",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "琵琶行",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "草长莺飞",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "汉水人家",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "女儿国",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "颜如玉",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "蜀道难",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "踏水歌",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "皇城相府",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "情人谷",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "玉佛苑",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "桃花源",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "苏提晓月",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "剑胆琴心",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "水调歌头",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "御书房",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "长亭落日",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "书剑合璧",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "剑侠风骨",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "四圣庄",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "至尊宝",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "枫桥夜泊",
          :game_id => 44,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "金戈铁马",
          :game_id => 44,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "地界",
          :game_id => 44)
GameServer.create(
          :name => "彩云之南",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "淮扬洁秋",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "武夷山",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "白鹿原",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "国色天香",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "长安月下",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "雷音寺",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "阳关雪",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "泰山之巅",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "蝶恋花",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "春绿江南",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "莲花山",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "月透碧纱",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "墨衣行",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "杨柳春风",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "峨眉山",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "山海关",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "月牙虹影",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "水木清华",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "曲江别苑",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "高山流水",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "陕西专区",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "西子湖畔",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "爱晚亭",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "水榭歌台",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "鼓浪屿",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "蜀山传奇",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "滨海新城",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "西江月",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "游子吟",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "广东专区",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "水帘洞",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "凤栖梧",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "渔歌晚唱",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "花果山",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "天涯海角",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "云梦泽",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "兰亭序",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "天工开物",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "华山论剑",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "五指山",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "渤海明珠",
          :game_id => 44,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "阳春白雪",
          :game_id => 44,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "魔界",
          :game_id => 44)
GameServer.create(
          :name => "豆蒄年华",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "花雨斜阳",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "再世情缘",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "云淡风轻",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "雪暮兰荒",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "飞燕回翔",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "陌上桑",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "回风舞雪",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "春暖花开",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "念奴娇",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "萍水相逢",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "鹊华秋色",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "秋水长天",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "淮南子",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "广陵散",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "小桥流水",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "水龙吟",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "风云再会",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "倩女幽魂",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "胭脂扣",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "沧海桑田",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "武林外传",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "空谷幽兰",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "黄泉碧落",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "凉州词",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "朝花夕拾",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "仙履奇缘",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "浪淘沙",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "秋水咯神",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "笑傲江湖",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "百里杜鹃",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "潇湘夜雨",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "雨打琵琶",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "将进酒",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "越人歌",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "尘缘未了",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "游侠殿堂",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "凤凰涅磐",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "平湖秋月",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "满江红",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "风花雪月",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "缘定三生",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "苍山远暮",
          :game_id => 44,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "青青子衿",
          :game_id => 44,
          :area_id => gamearea4.id)
  end

  def self.down
  end
end
