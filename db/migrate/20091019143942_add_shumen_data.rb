class AddShumenData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "峨嵋",
        :game_id => 54)
GameProfession.create(
        :name => "佛门",
        :game_id => 54)
GameProfession.create(
        :name => "青城",
        :game_id => 54)
GameProfession.create(
        :name => "百花",
        :game_id => 54)
GameProfession.create(
        :name => "仙禽",
        :game_id => 54)
gamearea1 = GameArea.create(
          :name => "电信一区",
          :game_id => 54)
GameServer.create(
          :name => "皓月",
          :game_id => 54,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "雄霸",
          :game_id => 54,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天下",
          :game_id => 54,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信二区",
          :game_id => 54)
GameServer.create(
          :name => "新月南湖",
          :game_id => 54,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "凌霄",
          :game_id => 54,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "电信三区",
          :game_id => 54)
GameServer.create(
          :name => "烟雨",
          :game_id => 54,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "清风晓月",
          :game_id => 54,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "晴雪翔云",
          :game_id => 54,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "东岳追云",
          :game_id => 54,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "天心风云",
          :game_id => 54,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "网通一区",
          :game_id => 54)
GameServer.create(
          :name => "沧海桑田",
          :game_id => 54,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "灵山",
          :game_id => 54,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "玄武",
          :game_id => 54,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "网通二区",
          :game_id => 54)
GameServer.create(
          :name => "降龙",
          :game_id => 54,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "伏虎",
          :game_id => 54,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "天机",
          :game_id => 54,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "修罗北斗",
          :game_id => 54,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "金刚三界",
          :game_id => 54,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "轩辕入世",
          :game_id => 54,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "百战灭魔",
          :game_id => 54,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "冷月天池",
          :game_id => 54,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "雪原北海",
          :game_id => 54,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "冰宫",
          :game_id => 54,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "百炼万军",
          :game_id => 54,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "电信四区",
          :game_id => 54)
GameServer.create(
          :name => "天镜",
          :game_id => 54,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "奇缘",
          :game_id => 54,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "天都宝莲",
          :game_id => 54,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "灵叶",
          :game_id => 54,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "紫云",
          :game_id => 54,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "雷音南明",
          :game_id => 54,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "碧波离火",
          :game_id => 54,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "龙吟如意",
          :game_id => 54,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "桃园旭日",
          :game_id => 54,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "竹海千峰",
          :game_id => 54,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "星晴",
          :game_id => 54,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "电信六区",
          :game_id => 54)
GameServer.create(
          :name => "龙门",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "天翼",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "龙腾",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "虎啸",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "凤舞",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "苍天",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "映月",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "东海",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "天翔",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "风雷",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "惊云",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "朱雀",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "盘龙",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "伏魔",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "群雄",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "纵横",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "天山",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "天极",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "祥龙",
          :game_id => 54,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "楼兰",
          :game_id => 54,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "网通三区",
          :game_id => 54)
GameServer.create(
          :name => "破天",
          :game_id => 54,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "屠龙",
          :game_id => 54,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "邀月",
          :game_id => 54,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "怜星",
          :game_id => 54,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "苍穹",
          :game_id => 54,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "倚天",
          :game_id => 54,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "玄宗",
          :game_id => 54,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "无双",
          :game_id => 54,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "绝尘",
          :game_id => 54,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "傲世",
          :game_id => 54,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "侠影",
          :game_id => 54,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "破晓",
          :game_id => 54,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "狮吼",
          :game_id => 54,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "电信五区",
          :game_id => 54)
GameServer.create(
          :name => "白眉",
          :game_id => 54,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "青羽",
          :game_id => 54,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "紫荆",
          :game_id => 54,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "红叶",
          :game_id => 54,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "金铃神谕",
          :game_id => 54,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "龙泉奔流",
          :game_id => 54,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "洞天",
          :game_id => 54,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "傲雪",
          :game_id => 54,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "玄天",
          :game_id => 54,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "心影",
          :game_id => 54,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "电信七区",
          :game_id => 54)
GameServer.create(
          :name => "九鼎",
          :game_id => 54,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "帝王",
          :game_id => 54,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "长生",
          :game_id => 54,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "重庆电信",
          :game_id => 54)
GameServer.create(
          :name => "朝天门",
          :game_id => 54,
          :area_id => gamearea11.id)
  end

  def self.down
  end
end
