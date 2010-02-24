class AddYuyanonlineData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "破坏型玄武",
        :game_id => 71)
GameProfession.create(
        :name => "捍卫型玄武",
        :game_id => 71)
GameProfession.create(
        :name => "神知型剑仙",
        :game_id => 71)
GameProfession.create(
        :name => "暗灵型剑仙",
        :game_id => 71)
GameProfession.create(
        :name => "御火型魔魅",
        :game_id => 71)
GameProfession.create(
        :name => "冰控型魔魅",
        :game_id => 71)
gamearea1 = GameArea.create(
          :name => "（怀旧版）电信一区",
          :game_id => 71)
GameServer.create(
          :name => "霸业",
          :game_id => 71,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "（怀旧版）网通一区",
          :game_id => 71)
GameServer.create(
          :name => "千秋",
          :game_id => 71,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "乾坤",
          :game_id => 71,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "（万人版）开天辟地",
          :game_id => 71)
GameServer.create(
          :name => "龙吟九天",
          :game_id => 71,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "天上人间",
          :game_id => 71,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "剑胆琴心",
          :game_id => 71,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "星火燎原",
          :game_id => 71,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "渊渟岳立",
          :game_id => 71,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "立马横刀",
          :game_id => 71,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "刀光剑影",
          :game_id => 71,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "鹰击长空",
          :game_id => 71,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "空中楼兰",
          :game_id => 71,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "揽月九天",
          :game_id => 71,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "天下无双",
          :game_id => 71,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "双剑合璧",
          :game_id => 71,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "碧血丹心",
          :game_id => 71,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "（万人版）王者归来",
          :game_id => 71)
GameServer.create(
          :name => "傲视群雄",
          :game_id => 71,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "雄才盖世",
          :game_id => 71,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "世外桃源",
          :game_id => 71,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "太平盛世",
          :game_id => 71,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "诗情画意",
          :game_id => 71,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "伊人秋水",
          :game_id => 71,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "雷霆烈焰",
          :game_id => 71,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "雄霸天下",
          :game_id => 71,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "飞龙在天",
          :game_id => 71,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "九州四海",
          :game_id => 71,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "金戈铁马",
          :game_id => 71,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "风花雪月",
          :game_id => 71,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "凤舞九天",
          :game_id => 71,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "君临天下",
          :game_id => 71)
GameServer.create(
          :name => "逐鹿中原",
          :game_id => 71,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "烈焰雄狮",
          :game_id => 71,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "雪山飞狐",
          :game_id => 71,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "江山美人",
          :game_id => 71,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "剑舞春秋",
          :game_id => 71,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "笑傲江湖",
          :game_id => 71,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "侠骨丹心",
          :game_id => 71,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "龙腾四海",
          :game_id => 71,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "烽火连天",
          :game_id => 71,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "卧虎藏龙",
          :game_id => 71,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "浩然正气",
          :game_id => 71,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "海市蜃楼",
          :game_id => 71,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "（万人版）叱诧风云",
          :game_id => 71)
GameServer.create(
          :name => "倚天屠龙",
          :game_id => 71,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "锦绣江山",
          :game_id => 71,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "天长地久",
          :game_id => 71,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "海纳百川",
          :game_id => 71,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "四海升平",
          :game_id => 71,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "刀剑江湖",
          :game_id => 71,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "巴蜀风云",
          :game_id => 71,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "花好月圆",
          :game_id => 71,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "满园春色",
          :game_id => 71,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "乱世英雄",
          :game_id => 71,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "江山无限",
          :game_id => 71,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "逍遥天下",
          :game_id => 71,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "（万人版）神话传奇",
          :game_id => 71)
GameServer.create(
          :name => "华山论剑",
          :game_id => 71,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "云舞苍穹",
          :game_id => 71,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "气贯长虹",
          :game_id => 71,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "光辉岁月",
          :game_id => 71,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "铁血天涯",
          :game_id => 71,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "皓月飞雪",
          :game_id => 71,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "血色冰峰",
          :game_id => 71,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "龙盘虎踞",
          :game_id => 71,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "大好河山",
          :game_id => 71,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "春光无限",
          :game_id => 71,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "海角天涯",
          :game_id => 71,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "名垂青史",
          :game_id => 71,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "（万人版）英雄无敌",
          :game_id => 71)
GameServer.create(
          :name => "龙腾虎跃",
          :game_id => 71,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "绝色倾城",
          :game_id => 71,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "江湖英雄",
          :game_id => 71,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "莺歌燕舞",
          :game_id => 71,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "鼎立中原",
          :game_id => 71,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "一剑凌云",
          :game_id => 71,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "国色天香",
          :game_id => 71,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "风云盛世",
          :game_id => 71,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "大漠孤鹰",
          :game_id => 71,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "王者雄狮",
          :game_id => 71,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "虎啸风生",
          :game_id => 71,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "冰壶秋月",
          :game_id => 71,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "金玉满堂",
          :game_id => 71,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "（万人版）兵临城下",
          :game_id => 71)
GameServer.create(
          :name => "塞外长空",
          :game_id => 71,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "华夏风云",
          :game_id => 71,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "烽烟战火",
          :game_id => 71,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "情定四海",
          :game_id => 71,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "落雪银霜",
          :game_id => 71,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "战火狼烟",
          :game_id => 71,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "风起云涌",
          :game_id => 71,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "东山再起",
          :game_id => 71,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "天下宏图",
          :game_id => 71,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "神州舞剑",
          :game_id => 71,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "碧海潇湘",
          :game_id => 71,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "明月四海",
          :game_id => 71,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "凌云壮志",
          :game_id => 71,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "（万人版）硝烟弥漫",
          :game_id => 71)
GameServer.create(
          :name => "风华绝代",
          :game_id => 71,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "（万人版）万马奔腾",
          :game_id => 71)
GameServer.create(
          :name => "创世",
          :game_id => 71,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "追月",
          :game_id => 71,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "残剑",
          :game_id => 71,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "永恒",
          :game_id => 71,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "光芒",
          :game_id => 71,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "星辰",
          :game_id => 71,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "盖世",
          :game_id => 71,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "豪侠",
          :game_id => 71,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "浪剑",
          :game_id => 71,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "九鼎",
          :game_id => 71,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "（经典版）电信区",
          :game_id => 71)
GameServer.create(
          :name => "岁月",
          :game_id => 71,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "惊雷",
          :game_id => 71,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "流金",
          :game_id => 71,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "（经典版）网通区",
          :game_id => 71)
GameServer.create(
          :name => "至尊",
          :game_id => 71,
          :area_id => gamearea13.id)
  end

  def self.down
  end
end
