class AddZhengfuData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "战士",
        :game_id => 12)
GameProfession.create(
        :name => "勇士",
        :game_id => 12)
GameProfession.create(
        :name => "道士",
        :game_id => 12)
GameProfession.create(
        :name => "弓手",
        :game_id => 12)
GameProfession.create(
        :name => "忍者",
        :game_id => 12)
gamearea1 = GameArea.create(
          :name => "一至五区",
          :game_id => 12)
GameServer.create(
          :name => "1区碧海晴天",
          :game_id => 12,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "2区傲视天下",
          :game_id => 12,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "3区卧虎藏龙",
          :game_id => 12,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "4区江湖霸业",
          :game_id => 12,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "4区白山黑水",
          :game_id => 12,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "5区丹霞凌霄",
          :game_id => 12,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "六区",
          :game_id => 12)
GameServer.create(
          :name => "万里山河",
          :game_id => 12,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "乘风破浪",
          :game_id => 12,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "风起云涌",
          :game_id => 12,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "风雨同舟",
          :game_id => 12,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "剑舞江山",
          :game_id => 12,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "侠骨金戈",
          :game_id => 12,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "盛世争雄",
          :game_id => 12,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "碧海吟霄",
          :game_id => 12,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "七区",
          :game_id => 12)
GameServer.create(
          :name => "剑指江山",
          :game_id => 12,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "苍穹霸业",
          :game_id => 12,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "傲气中华",
          :game_id => 12,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "煮酒论剑",
          :game_id => 12,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "笑看风云",
          :game_id => 12,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "凌云壮志",
          :game_id => 12,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "义薄云天",
          :game_id => 12,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "狂剑天涯",
          :game_id => 12,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "挥剑问情",
          :game_id => 12,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "开天辟地",
          :game_id => 12,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "悠长假期",
          :game_id => 12,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "八区",
          :game_id => 12)
GameServer.create(
          :name => "笑傲江湖",
          :game_id => 12,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "谁与争锋",
          :game_id => 12,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "剑胆寒心",
          :game_id => 12,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "龙战昆仑",
          :game_id => 12,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "烽火燎原",
          :game_id => 12,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "刀光剑影",
          :game_id => 12,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "龙争虎斗",
          :game_id => 12,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "金戈铁马",
          :game_id => 12,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "九区",
          :game_id => 12)
GameServer.create(
          :name => "乱世豪情",
          :game_id => 12,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "唯我独尊",
          :game_id => 12,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "横扫千军",
          :game_id => 12,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "江山美人",
          :game_id => 12,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "仗剑狂歌",
          :game_id => 12,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "王者无敌",
          :game_id => 12,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "天子传奇",
          :game_id => 12,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "凤凰天舞",
          :game_id => 12,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "天地苍狼",
          :game_id => 12,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "英雄儿女",
          :game_id => 12,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "怒海狂涛",
          :game_id => 12,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "龙腾盛世",
          :game_id => 12,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "十区",
          :game_id => 12)
GameServer.create(
          :name => "霸者之刃",
          :game_id => 12,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "龙耀天下",
          :game_id => 12,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "剑傲群雄",
          :game_id => 12,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "壮志春秋",
          :game_id => 12,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "情义江湖",
          :game_id => 12,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "快乐人生",
          :game_id => 12,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "鹰击长空",
          :game_id => 12,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "仗剑寻情",
          :game_id => 12,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "双宝奇谋",
          :game_id => 12,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "问鼎九州",
          :game_id => 12,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "盛世欢颜",
          :game_id => 12,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "重出江湖",
          :game_id => 12,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "十一区",
          :game_id => 12)
GameServer.create(
          :name => "天下一统",
          :game_id => 12,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "龙刃傲天",
          :game_id => 12,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "血战八方",
          :game_id => 12,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "铁马冰河",
          :game_id => 12,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "林海雪原",
          :game_id => 12,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "大浪淘沙",
          :game_id => 12,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "九州同庆",
          :game_id => 12,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "非请勿扰",
          :game_id => 12,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "沙场点兵",
          :game_id => 12,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "龙盘虎踞",
          :game_id => 12,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "侠骨柔情",
          :game_id => 12,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "战无不胜",
          :game_id => 12,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "十二区",
          :game_id => 12)
GameServer.create(
          :name => "龙城岁月",
          :game_id => 12,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "一骑当千",
          :game_id => 12,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "马到成功",
          :game_id => 12,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "豪气冲天",
          :game_id => 12,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "追风逐日",
          :game_id => 12,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "人在江湖",
          :game_id => 12,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "胜者为王",
          :game_id => 12,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "桃李天下",
          :game_id => 12,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "建国大业",
          :game_id => 12,
          :area_id => gamearea8.id)
  end

  def self.down
  end
end
