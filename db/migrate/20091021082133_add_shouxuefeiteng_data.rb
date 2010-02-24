class AddShouxuefeitengData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "人类剑士",
        :game_id => 63)
GameProfession.create(
        :name => "人类法师",
        :game_id => 63)
GameProfession.create(
        :name => "人类游侠",
        :game_id => 63)
GameProfession.create(
        :name => "兽族战士",
        :game_id => 63)
GameProfession.create(
        :name => "兽族祭祀",
        :game_id => 63)
GameProfession.create(
        :name => "兽族猎人",
        :game_id => 63)
gamearea1 = GameArea.create(
          :name => "电信一区",
          :game_id => 63)
GameServer.create(
          :name => "坎帕斯",
          :game_id => 63,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "贝拉米",
          :game_id => 63,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "艾莉婕",
          :game_id => 63,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "科里纳",
          :game_id => 63,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "亚平宁",
          :game_id => 63,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "海华丝",
          :game_id => 63,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "柯奇士",
          :game_id => 63,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "斐雯丽",
          :game_id => 63,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "加茜娅",
          :game_id => 63,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "莫瑞森",
          :game_id => 63,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信二区",
          :game_id => 63)
GameServer.create(
          :name => "奥尼尔",
          :game_id => 63,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "维埃里",
          :game_id => 63,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "尼普顿",
          :game_id => 63,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "米兰妮",
          :game_id => 63,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "永贝里",
          :game_id => 63,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "安琪尔",
          :game_id => 63,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "古力特",
          :game_id => 63,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "翡冷翠",
          :game_id => 63,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "雷东多",
          :game_id => 63,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "阿加西",
          :game_id => 63,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "特维斯",
          :game_id => 63,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "电信三区",
          :game_id => 63)
GameServer.create(
          :name => "雷鸣登",
          :game_id => 63,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "崔斯特",
          :game_id => 63,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "阿仙奴",
          :game_id => 63,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "安瑞达",
          :game_id => 63,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "许德拉",
          :game_id => 63,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "革瑞恩",
          :game_id => 63,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "罗德曼",
          :game_id => 63,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "艾佛森",
          :game_id => 63,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "西多夫",
          :game_id => 63,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "波塞冬",
          :game_id => 63,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "电信四区",
          :game_id => 63)
GameServer.create(
          :name => "古德",
          :game_id => 63,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "凝玉",
          :game_id => 63,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "黛丝",
          :game_id => 63,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "谭雅",
          :game_id => 63,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "贞德",
          :game_id => 63,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "萨尔",
          :game_id => 63,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "唐宁",
          :game_id => 63,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "邓肯",
          :game_id => 63,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "李察",
          :game_id => 63,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "电信五区",
          :game_id => 63)
GameServer.create(
          :name => "马特拉齐",
          :game_id => 63,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "费迪南德",
          :game_id => 63,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "里瓦尔多",
          :game_id => 63,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "内德维德",
          :game_id => 63,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "特雷泽盖",
          :game_id => 63,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "马尔蒂尼",
          :game_id => 63,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "贝尼特斯",
          :game_id => 63,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "文森卡特",
          :game_id => 63,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "爱奥利斯",
          :game_id => 63,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "电信六区",
          :game_id => 63)
GameServer.create(
          :name => "隆美尔",
          :game_id => 63,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "歌坦妮",
          :game_id => 63,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "若尔娜",
          :game_id => 63,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "歌莉妮",
          :game_id => 63,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "吉安娜",
          :game_id => 63,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "歌麦斯",
          :game_id => 63,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "喀秋莎",
          :game_id => 63,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "雷耶斯",
          :game_id => 63,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "电信七区",
          :game_id => 63)
GameServer.create(
          :name => "海伦",
          :game_id => 63,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "茉儿",
          :game_id => 63,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "茜茜",
          :game_id => 63,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "亥伯",
          :game_id => 63,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "夏圭",
          :game_id => 63,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "萝丝",
          :game_id => 63,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "伊布",
          :game_id => 63,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "伦娜",
          :game_id => 63,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "电信八区",
          :game_id => 63)
GameServer.create(
          :name => "贝隆",
          :game_id => 63,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "托尼",
          :game_id => 63,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "特里",
          :game_id => 63,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "米莎",
          :game_id => 63,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "李德",
          :game_id => 63,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "罗西",
          :game_id => 63,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "欧丁",
          :game_id => 63,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "巴乔",
          :game_id => 63,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "电信九区",
          :game_id => 63)
GameServer.create(
          :name => "布吕克纳",
          :game_id => 63,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "萨穆埃尔",
          :game_id => 63,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "斯托克顿",
          :game_id => 63,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "墨菲斯托",
          :game_id => 63,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "阿兰德隆",
          :game_id => 63,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "埃里克松",
          :game_id => 63,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "莱因克尔",
          :game_id => 63,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "电信十区",
          :game_id => 63)
GameServer.create(
          :name => "岑凯伦",
          :game_id => 63,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "文森特",
          :game_id => 63,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "丹尼尔",
          :game_id => 63,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "刘震撼",
          :game_id => 63,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "巴雷西",
          :game_id => 63,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "皮萨罗",
          :game_id => 63,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "美萝乐",
          :game_id => 63,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "文托拉",
          :game_id => 63,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "电信十一区",
          :game_id => 63)
GameServer.create(
          :name => "利特马宁",
          :game_id => 63,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "齐菲亚诺",
          :game_id => 63,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "特里斯坦",
          :game_id => 63,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "帕瓦罗蒂",
          :game_id => 63,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "阿泰斯特",
          :game_id => 63,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "马特乌斯",
          :game_id => 63,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "米亚哈姆",
          :game_id => 63,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "奥拉朱旺",
          :game_id => 63,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "电信十二区",
          :game_id => 63)
GameServer.create(
          :name => "科科",
          :game_id => 63,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "雷纳",
          :game_id => 63,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "穆图",
          :game_id => 63,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "齐丹",
          :game_id => 63,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "微芝",
          :game_id => 63,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "马里",
          :game_id => 63,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "卡恩",
          :game_id => 63,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "乔治",
          :game_id => 63,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "电信十三区",
          :game_id => 63)
GameServer.create(
          :name => "罗森博格",
          :game_id => 63,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "德尼尔森",
          :game_id => 63,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "拉瓦贝里",
          :game_id => 63,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "克林斯曼",
          :game_id => 63,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "塔勒布鲁",
          :game_id => 63,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "博格坎普",
          :game_id => 63,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "巴巴鲁克",
          :game_id => 63,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "蒙塔沙里",
          :game_id => 63,
          :area_id => gamearea13.id)
gamearea14 = GameArea.create(
          :name => "网通一区",
          :game_id => 63)
GameServer.create(
          :name => "阿拉贡",
          :game_id => 63,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "爱露尼",
          :game_id => 63,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "巴克利",
          :game_id => 63,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "梅凯莉",
          :game_id => 63,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "坎通纳",
          :game_id => 63,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "艾薇儿",
          :game_id => 63,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "维杜卡",
          :game_id => 63,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "圣保罗",
          :game_id => 63,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "夏莉莲",
          :game_id => 63,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "菲利普",
          :game_id => 63,
          :area_id => gamearea14.id)
gamearea15 = GameArea.create(
          :name => "网通二区",
          :game_id => 63)
GameServer.create(
          :name => "德塞利",
          :game_id => 63,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "奥特加",
          :game_id => 63,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "艾玛尔",
          :game_id => 63,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "安度兰",
          :game_id => 63,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "兰若诗",
          :game_id => 63,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "克拉克",
          :game_id => 63,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "马拿利",
          :game_id => 63,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "贝斯特",
          :game_id => 63,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "雷克萨",
          :game_id => 63,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "奥兰多",
          :game_id => 63,
          :area_id => gamearea15.id)
gamearea16 = GameArea.create(
          :name => "网通三区",
          :game_id => 63)
GameServer.create(
          :name => "穆里尼奥",
          :game_id => 63,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "普斯卡什",
          :game_id => 63,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "西米里安",
          :game_id => 63,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "斯蒂法诺",
          :game_id => 63,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "克鲁伊夫",
          :game_id => 63,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "贝克汉姆",
          :game_id => 63,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "普拉蒂尼",
          :game_id => 63,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "贝肯鲍尔",
          :game_id => 63,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "阿基米德",
          :game_id => 63,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "圣克鲁兹",
          :game_id => 63,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "威廉姆斯",
          :game_id => 63,
          :area_id => gamearea16.id)
gamearea17 = GameArea.create(
          :name => "网通四区",
          :game_id => 63)
GameServer.create(
          :name => "壹条",
          :game_id => 63,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "卡卡",
          :game_id => 63,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "嘉宝",
          :game_id => 63,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "菲琳",
          :game_id => 63,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "菲高",
          :game_id => 63,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "赞迪",
          :game_id => 63,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "梦露",
          :game_id => 63,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "霞飞",
          :game_id => 63,
          :area_id => gamearea17.id)
gamearea18 = GameArea.create(
          :name => "网通五区",
          :game_id => 63)
GameServer.create(
          :name => "卓别林",
          :game_id => 63,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "加百列",
          :game_id => 63,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "桑吉尔",
          :game_id => 63,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "敦克尔",
          :game_id => 63,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "罗迪克",
          :game_id => 63,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "美津浓",
          :game_id => 63,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "加马拉",
          :game_id => 63,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "夏尔芬",
          :game_id => 63,
          :area_id => gamearea18.id)
gamearea19 = GameArea.create(
          :name => "网通六区",
          :game_id => 63)
GameServer.create(
          :name => "邓波尔",
          :game_id => 63,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "裴武安",
          :game_id => 63,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "俄狄斯",
          :game_id => 63,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "加内特",
          :game_id => 63,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "路易斯",
          :game_id => 63,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "桑切斯",
          :game_id => 63,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "克雷迪",
          :game_id => 63,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "迪米尔",
          :game_id => 63,
          :area_id => gamearea19.id)
  end

  def self.down
  end
end
