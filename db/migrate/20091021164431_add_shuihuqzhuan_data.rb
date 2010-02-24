class AddShuihuqzhuanData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "剑侠",
        :game_id => 89)
GameProfession.create(
        :name => "武狂",
        :game_id => 89)
GameProfession.create(
        :name => "法师",
        :game_id => 89)
GameProfession.create(
        :name => "道尊",
        :game_id => 89)
GameProfession.create(
        :name => "医仙",
        :game_id => 89)
gamearea1 = GameArea.create(
          :name => "电信一区",
          :game_id => 89)
GameServer.create(
          :name => "武松",
          :game_id => 89,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "林冲",
          :game_id => 89,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "燕青",
          :game_id => 89,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "秦明",
          :game_id => 89,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "呼延灼",
          :game_id => 89,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "扈三娘",
          :game_id => 89,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "皇甫瑞",
          :game_id => 89,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "安道全",
          :game_id => 89,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "王英",
          :game_id => 89,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "柴进",
          :game_id => 89,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天目将",
          :game_id => 89,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "应天府",
          :game_id => 89,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信二区",
          :game_id => 89)
GameServer.create(
          :name => "公孙胜",
          :game_id => 89,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "鲁智深",
          :game_id => 89,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "卢俊义",
          :game_id => 89,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "阮小二",
          :game_id => 89,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "阮小五",
          :game_id => 89,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "阮小七",
          :game_id => 89,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "孙二娘",
          :game_id => 89,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "朱武",
          :game_id => 89,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "石秀",
          :game_id => 89,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "莲花门人",
          :game_id => 89,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "红灯笼",
          :game_id => 89,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "文殊院",
          :game_id => 89,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "秋林渡",
          :game_id => 89,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "电信三区",
          :game_id => 89)
GameServer.create(
          :name => "神行太保",
          :game_id => 89,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "立地太岁",
          :game_id => 89,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "浪里白条",
          :game_id => 89,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "拼命三郎",
          :game_id => 89,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "神机军师",
          :game_id => 89,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "百胜将军",
          :game_id => 89,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "摩云金翅",
          :game_id => 89,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "混世魔王",
          :game_id => 89,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "火眼狻猊",
          :game_id => 89,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "快活林",
          :game_id => 89,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "龙王",
          :game_id => 89,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "龙抬头",
          :game_id => 89,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "电信四区",
          :game_id => 89)
GameServer.create(
          :name => "小温侯",
          :game_id => 89,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "镇三山",
          :game_id => 89,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "一丈青",
          :game_id => 89,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "金眼彪",
          :game_id => 89,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "紫髯伯",
          :game_id => 89,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "月团圆",
          :game_id => 89,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "开门红",
          :game_id => 89,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "险道神",
          :game_id => 89,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "正极哥哥",
          :game_id => 89,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "牛年大吉",
          :game_id => 89,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "华南1线",
          :game_id => 89,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "广东1线",
          :game_id => 89,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "电信五区",
          :game_id => 89)
GameServer.create(
          :name => "入云龙",
          :game_id => 89,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "金枪手",
          :game_id => 89,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "急先锋",
          :game_id => 89,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "独角龙",
          :game_id => 89,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "潘金莲一",
          :game_id => 89,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "锦豹子",
          :game_id => 89,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "潘金莲三",
          :game_id => 89,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "双子",
          :game_id => 89,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "武松打虎",
          :game_id => 89,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "牧羊",
          :game_id => 89,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "闹花灯",
          :game_id => 89,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "广州2区",
          :game_id => 89,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "电信六区",
          :game_id => 89)
GameServer.create(
          :name => "跳涧虎",
          :game_id => 89,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "赛仁贵",
          :game_id => 89,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "出林龙",
          :game_id => 89,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "西门庆一",
          :game_id => 89,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "沧州道",
          :game_id => 89,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "华山",
          :game_id => 89,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "小霸王周通",
          :game_id => 89,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "神火将",
          :game_id => 89,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "情意无价",
          :game_id => 89,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "钢铁城",
          :game_id => 89,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "美丽圣诞",
          :game_id => 89,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "赤松林",
          :game_id => 89,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "网通一区",
          :game_id => 89)
GameServer.create(
          :name => "杨志",
          :game_id => 89,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "关胜",
          :game_id => 89,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "杨雄",
          :game_id => 89,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "宋江",
          :game_id => 89,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "张顺",
          :game_id => 89,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "戴宗",
          :game_id => 89,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "白胜",
          :game_id => 89,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "刘唐",
          :game_id => 89,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "李逵",
          :game_id => 89,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "花荣",
          :game_id => 89,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "狐美人",
          :game_id => 89,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "鬼脸儿",
          :game_id => 89,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "网通二区",
          :game_id => 89)
GameServer.create(
          :name => "吴用",
          :game_id => 89,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "朱仝",
          :game_id => 89,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "张清",
          :game_id => 89,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "索超",
          :game_id => 89,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "张横",
          :game_id => 89,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "解珍",
          :game_id => 89,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "杨林",
          :game_id => 89,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "乐翻天",
          :game_id => 89,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "负极弟弟",
          :game_id => 89,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "五台山",
          :game_id => 89,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "销金帐",
          :game_id => 89,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "桃花村",
          :game_id => 89,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "网通三区",
          :game_id => 89)
GameServer.create(
          :name => "青面兽",
          :game_id => 89,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "小旋风",
          :game_id => 89,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "花和尚",
          :game_id => 89,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "霹雳火",
          :game_id => 89,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "久纹龙",
          :game_id => 89,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "插翅虎",
          :game_id => 89,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "祝家庄",
          :game_id => 89,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "欢乐英雄",
          :game_id => 89,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "杨志卖刀",
          :game_id => 89,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "梦想",
          :game_id => 89,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "山东1线",
          :game_id => 89,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "北京1区",
          :game_id => 89,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "网通四区",
          :game_id => 89)
GameServer.create(
          :name => "混江龙",
          :game_id => 89,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "铁扇子",
          :game_id => 89,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "黑旋风",
          :game_id => 89,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "矮脚虎",
          :game_id => 89,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "潘金莲二",
          :game_id => 89,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "一枝花",
          :game_id => 89,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "潘金莲四",
          :game_id => 89,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "打虎将",
          :game_id => 89,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "通臂猿",
          :game_id => 89,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "节节高",
          :game_id => 89,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "白虎山",
          :game_id => 89,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "逍遥津",
          :game_id => 89,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "网通五区",
          :game_id => 89)
GameServer.create(
          :name => "双尾蝎",
          :game_id => 89,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "双头蛇",
          :game_id => 89,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "西门庆二",
          :game_id => 89,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "笑面虎",
          :game_id => 89,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "石将军",
          :game_id => 89,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "花项虎",
          :game_id => 89,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "渭州城",
          :game_id => 89,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "黄雅莉",
          :game_id => 89,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "锦毛虎",
          :game_id => 89,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "元旦快乐",
          :game_id => 89,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "吉祥牛",
          :game_id => 89,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "元宵佳节",
          :game_id => 89,
          :area_id => gamearea11.id)
  end

  def self.down
  end
end
