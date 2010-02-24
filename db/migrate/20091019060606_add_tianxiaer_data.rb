class AddTianxiaerData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "荒火",
        :game_id => 42)
GameProfession.create(
        :name => "天机",
        :game_id => 42)
GameProfession.create(
        :name => "魍魉",
        :game_id => 42)
GameProfession.create(
        :name => "翎羽",
        :game_id => 42)
GameProfession.create(
        :name => "冰心",
        :game_id => 42)
GameProfession.create(
        :name => "云麓",
        :game_id => 42)
GameProfession.create(
        :name => "弈剑",
        :game_id => 42)
GameProfession.create(
        :name => "太虚",
        :game_id => 42)
gamearea1 = GameArea.create(
          :name => "上海区",
          :game_id => 42)
GameServer.create(
          :name => "龙争虎斗",
          :game_id => 42,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "东方明珠",
          :game_id => 42,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "蝶恋花",
          :game_id => 42,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "北京区",
          :game_id => 42)
GameServer.create(
          :name => "忆帝京",
          :game_id => 42,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "万里长城",
          :game_id => 42,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "紫禁之巅",
          :game_id => 42,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "广东区",
          :game_id => 42)
GameServer.create(
          :name => "西江月",
          :game_id => 42,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "剑舞香江",
          :game_id => 42,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "白云山",
          :game_id => 42,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "浙江区",
          :game_id => 42)
GameServer.create(
          :name => "三潭印月",
          :game_id => 42,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "烟雨江南",
          :game_id => 42,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "忆江南",
          :game_id => 42,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "四川区",
          :game_id => 42)
GameServer.create(
          :name => "九寨天堂",
          :game_id => 42,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "天府之国",
          :game_id => 42,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "湖北区",
          :game_id => 42)
GameServer.create(
          :name => "问道武当",
          :game_id => 42,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "黄鹤楼",
          :game_id => 42,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "辽宁区",
          :game_id => 42)
GameServer.create(
          :name => "烽火关东",
          :game_id => 42,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "河南区",
          :game_id => 42)
GameServer.create(
          :name => "逐鹿中原",
          :game_id => 42,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "江苏区",
          :game_id => 42)
GameServer.create(
          :name => "虞美人",
          :game_id => 42,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "瘦西湖",
          :game_id => 42,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "河北区",
          :game_id => 42)
GameServer.create(
          :name => "燕赵大地",
          :game_id => 42,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "陕西区",
          :game_id => 42)
GameServer.create(
          :name => "盛世长安",
          :game_id => 42,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "福建区",
          :game_id => 42)
GameServer.create(
          :name => "武夷九曲",
          :game_id => 42,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "山西区",
          :game_id => 42)
GameServer.create(
          :name => "五台山",
          :game_id => 42,
          :area_id => gamearea13.id)
gamearea14 = GameArea.create(
          :name => "湖南区",
          :game_id => 42)
GameServer.create(
          :name => "洞庭湖",
          :game_id => 42,
          :area_id => gamearea14.id)
gamearea15 = GameArea.create(
          :name => "山东区",
          :game_id => 42)
GameServer.create(
          :name => "兰陵王",
          :game_id => 42,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "泰山封禅",
          :game_id => 42,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "齐鲁天下",
          :game_id => 42,
          :area_id => gamearea15.id)
gamearea16 = GameArea.create(
          :name => "东北区",
          :game_id => 42)
GameServer.create(
          :name => "林海雪原",
          :game_id => 42,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "烽火关东",
          :game_id => 42,
          :area_id => gamearea16.id)
gamearea17 = GameArea.create(
          :name => "荣耀大荒",
          :game_id => 42)
GameServer.create(
          :name => "长相思",
          :game_id => 42,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "浣溪沙",
          :game_id => 42,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "天净沙",
          :game_id => 42,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "念奴娇",
          :game_id => 42,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "桃花源",
          :game_id => 42,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "国士无双",
          :game_id => 42,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "厉兵秣马",
          :game_id => 42,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "山海经",
          :game_id => 42,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "香格里拉",
          :game_id => 42,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "百战黄沙",
          :game_id => 42,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "如梦令",
          :game_id => 42,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "凤求凰",
          :game_id => 42,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "花样年华",
          :game_id => 42,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "莫问今朝",
          :game_id => 42,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "刀光剑影",
          :game_id => 42,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "海纳百川",
          :game_id => 42,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "江山如画",
          :game_id => 42,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "上善若水",
          :game_id => 42,
          :area_id => gamearea17.id)
gamearea18 = GameArea.create(
          :name => "天下一统",
          :game_id => 42)
GameServer.create(
          :name => "藏金阁",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "青纱帐",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "血战江湖",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "沙场点兵",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "情动大荒",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "海誓山盟",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "浪淘沙",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "满江红",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "风云雷动",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "圣火燎原",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "兵临城下",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "大荒演武",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "大禹治水",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "铁血丹心",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "纵横四海",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "虎踞龙蟠",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "天长地久",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "海阔天空",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "龙游天下",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "逍遥游",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "烟花三月",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "生如夏花",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "天下无双",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "燕南远征",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "笑红尘",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "江山如画",
          :game_id => 42,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "上善若水",
          :game_id => 42,
          :area_id => gamearea18.id)
  end

  def self.down
  end
end
