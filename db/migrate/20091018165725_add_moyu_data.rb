class AddMoyuData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "法师",
        :game_id => 34)
GameProfession.create(
        :name => "战士",
        :game_id => 34)
GameProfession.create(
        :name => "异能者",
        :game_id => 34)
gamearea1 = GameArea.create(
          :name => "第一大区（福建电信）",
          :game_id => 34)
GameServer.create(
          :name => "福建一区",
          :game_id => 34,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "福建二/八区",
          :game_id => 34,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "福建三区",
          :game_id => 34,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "福建五/七区",
          :game_id => 34,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "福建六区",
          :game_id => 34,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "福建九区",
          :game_id => 34,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "福建十区",
          :game_id => 34,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "福建十二/十六区",
          :game_id => 34,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "福建十五区",
          :game_id => 34,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "福建十八区",
          :game_id => 34,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "福建十九/二十区",
          :game_id => 34,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "福建二十一区",
          :game_id => 34,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "福建二十二区",
          :game_id => 34,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "福建二十三区",
          :game_id => 34,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "第二大区（山东网通）",
          :game_id => 34)
GameServer.create(
          :name => "山东一区",
          :game_id => 34,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "山东二区",
          :game_id => 34,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "山东三区",
          :game_id => 34,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "山东五/六/十三/十八区",
          :game_id => 34,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "山东七区",
          :game_id => 34,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "山东九/十/十六区",
          :game_id => 34,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "山东十九/二十区",
          :game_id => 34,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "山东二十一/二十二区",
          :game_id => 34,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "山东二十三区",
          :game_id => 34,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "山东二十五/二十六区",
          :game_id => 34,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "山东二十七区",
          :game_id => 34,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "山东二十八区",
          :game_id => 34,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "山东二十九区",
          :game_id => 34,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "山东三十区",
          :game_id => 34,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "第三大区（东北网通）",
          :game_id => 34)
GameServer.create(
          :name => "辽宁一区",
          :game_id => 34,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "辽宁二区",
          :game_id => 34,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "辽宁三/六区/吉林二区",
          :game_id => 34,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "辽宁七区",
          :game_id => 34,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "辽宁八区/吉林七区",
          :game_id => 34,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "辽宁十三区",
          :game_id => 34,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "辽宁十五区",
          :game_id => 34,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "吉林一区",
          :game_id => 34,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "吉林九区/辽宁十/十一区",
          :game_id => 34,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "吉林十区/辽宁十二区",
          :game_id => 34,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "吉林十一区",
          :game_id => 34,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "吉林十二区",
          :game_id => 34,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "吉林十三区",
          :game_id => 34,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "吉林十五区",
          :game_id => 34,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "第四大区（广东电信）",
          :game_id => 34)
gamearea4 = GameArea.create(
          :name => "广东一区",
          :game_id => 34)
gamearea4 = GameArea.create(
          :name => "广东二区",
          :game_id => 34)
gamearea4 = GameArea.create(
          :name => "广东三/十五区",
          :game_id => 34)
gamearea4 = GameArea.create(
          :name => "广东五/七区",
          :game_id => 34)
gamearea4 = GameArea.create(
          :name => "广东六/九区",
          :game_id => 34)
gamearea4 = GameArea.create(
          :name => "广东八区",
          :game_id => 34)
gamearea4 = GameArea.create(
          :name => "广东十/十七区",
          :game_id => 34)
gamearea4 = GameArea.create(
          :name => "广东十一/十三区",
          :game_id => 34)
gamearea4 = GameArea.create(
          :name => "广东十二区",
          :game_id => 34)
gamearea4 = GameArea.create(
          :name => "广东十八区",
          :game_id => 34)
gamearea4 = GameArea.create(
          :name => "广东十九区",
          :game_id => 34)
gamearea4 = GameArea.create(
          :name => "广东二十区",
          :game_id => 34)
gamearea4 = GameArea.create(
          :name => "广东二十一区",
          :game_id => 34)
gamearea4 = GameArea.create(
          :name => "Area",
          :game_id => 34)
gamearea4 = GameArea.create(
          :name => "第五大区（广东电信）",
          :game_id => 34)
GameServer.create(
          :name => "上海一区",
          :game_id => 34,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "上海二/五区",
          :game_id => 34,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "上海三/六/七区",
          :game_id => 34,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "上海八区",
          :game_id => 34,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "上海十一/二十六区",
          :game_id => 34,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "上海十五/十七/二十五区",
          :game_id => 34,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "上海二十/二十一区",
          :game_id => 34,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "上海二十二/二十三区",
          :game_id => 34,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "上海二十七区",
          :game_id => 34,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "上海二十八区",
          :game_id => 34,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "上海二十九区",
          :game_id => 34,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "上海三十区",
          :game_id => 34,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "第六大区（四川电信）",
          :game_id => 34)
GameServer.create(
          :name => "四川一区",
          :game_id => 34,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "四川二/三区",
          :game_id => 34,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "四川六区",
          :game_id => 34,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "四川七/九/十区",
          :game_id => 34,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "四川十二/十八区",
          :game_id => 34,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "四川十三/十七区",
          :game_id => 34,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "四川十九/二十/二十一区",
          :game_id => 34,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "四川二十二区",
          :game_id => 34,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "四川二十三/二十五区",
          :game_id => 34,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "四川二十六区",
          :game_id => 34,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "四川二十七区",
          :game_id => 34,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "四川二十八区",
          :game_id => 34,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "第七大区（浙江电信）",
          :game_id => 34)
GameServer.create(
          :name => "浙江一区",
          :game_id => 34,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "浙江二区",
          :game_id => 34,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "浙江三区",
          :game_id => 34,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "浙江五/七区",
          :game_id => 34,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "浙江八/九区",
          :game_id => 34,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "浙江十五/十六/十八区",
          :game_id => 34,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "浙江二十/二十一/二十二区",
          :game_id => 34,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "浙江二十三/二十六区",
          :game_id => 34,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "浙江二十五/二十七区",
          :game_id => 34,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "浙江二十八区",
          :game_id => 34,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "浙江二十九区",
          :game_id => 34,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "浙江三十区",
          :game_id => 34,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "浙江三十一区",
          :game_id => 34,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "第八大区（江苏电信）",
          :game_id => 34)
GameServer.create(
          :name => "江苏一区",
          :game_id => 34,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "江苏二/五区",
          :game_id => 34,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "江苏三/十二区",
          :game_id => 34,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "江苏七/九区",
          :game_id => 34,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "江苏八区",
          :game_id => 34,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "江苏十七/二十/二十一区",
          :game_id => 34,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "江苏十九区",
          :game_id => 34,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "江苏二十二/二十三区",
          :game_id => 34,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "江苏二十五区",
          :game_id => 34,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "江苏二十六区",
          :game_id => 34,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "江苏二十八区",
          :game_id => 34,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "江苏二十九区",
          :game_id => 34,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "第九大区（湖南电信）",
          :game_id => 34)
GameServer.create(
          :name => "湖南一区",
          :game_id => 34,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "湖南二区",
          :game_id => 34,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "湖南三/五区",
          :game_id => 34,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "湖南八/九/十一/十六区",
          :game_id => 34,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "湖南十九/二十/二十一区",
          :game_id => 34,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "湖南二十二/二十三区",
          :game_id => 34,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "湖南二十五区",
          :game_id => 34,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "湖南二十六区",
          :game_id => 34,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "湖南二十七区",
          :game_id => 34,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "湖南二十八区",
          :game_id => 34,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "第十大区（湖北电信）",
          :game_id => 34)
GameServer.create(
          :name => "湖北一区",
          :game_id => 34,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "湖北二区",
          :game_id => 34,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "湖北五区",
          :game_id => 34,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "湖北七/八/十一区",
          :game_id => 34,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "湖北九/十二区",
          :game_id => 34,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "湖北十五/十六/十八区",
          :game_id => 34,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "湖北十九区",
          :game_id => 34,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "湖北二十区",
          :game_id => 34,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "湖北二十一区",
          :game_id => 34,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "湖北二十二区",
          :game_id => 34,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "湖北二十三区",
          :game_id => 34,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "第十一大区（江西电信）",
          :game_id => 34)
GameServer.create(
          :name => "江西一区",
          :game_id => 34,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "江西二区",
          :game_id => 34,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "江西三/五/六区",
          :game_id => 34,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "江西七/十二/十六区",
          :game_id => 34,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "江西十三区",
          :game_id => 34,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "江西十七区",
          :game_id => 34,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "江西十八区",
          :game_id => 34,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "江西十九区",
          :game_id => 34,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "江西二十区",
          :game_id => 34,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "第十二大区（广西电信）",
          :game_id => 34)
GameServer.create(
          :name => "广西一区",
          :game_id => 34,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "广西二/五/七区",
          :game_id => 34,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "广西三/八/十二区",
          :game_id => 34,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "广西十一/十三区",
          :game_id => 34,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "广西十八区",
          :game_id => 34,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "广西十九/二十区",
          :game_id => 34,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "广西二十一/二十二区",
          :game_id => 34,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "广西二十三区",
          :game_id => 34,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "广西二十五区",
          :game_id => 34,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "广西二十六区",
          :game_id => 34,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "广西二十七区",
          :game_id => 34,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "第十三大区（安徽电信）",
          :game_id => 34)
GameServer.create(
          :name => "安徽一/二十区",
          :game_id => 34,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "安徽二/五区",
          :game_id => 34,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "安徽三区",
          :game_id => 34,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "安徽八区",
          :game_id => 34,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "安徽九/十三/十六区",
          :game_id => 34,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "安徽十八/十九区",
          :game_id => 34,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "安徽二十一/二十二区",
          :game_id => 34,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "安徽二十三/二十五区",
          :game_id => 34,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "安徽二十六区",
          :game_id => 34,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "安徽二十七区",
          :game_id => 34,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "安徽二十八区",
          :game_id => 34,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "安徽二十九区",
          :game_id => 34,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "第十四大区（北京网通）",
          :game_id => 34)
GameServer.create(
          :name => "北京一区",
          :game_id => 34,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "北京二/八区",
          :game_id => 34,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "北京三/六区",
          :game_id => 34,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "北京七/十三区",
          :game_id => 34,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "北京十一区",
          :game_id => 34,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "北京十六/十九区",
          :game_id => 34,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "北京二十/二十一区",
          :game_id => 34,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "北京二十二/二十三区",
          :game_id => 34,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "北京二十五区",
          :game_id => 34,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "北京二十六区",
          :game_id => 34,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "北京二十七区",
          :game_id => 34,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "北京二十八区",
          :game_id => 34,
          :area_id => gamearea13.id)
gamearea14 = GameArea.create(
          :name => "第十五大区（云南电信）",
          :game_id => 34)
GameServer.create(
          :name => "云南一区",
          :game_id => 34,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "云南二/六区",
          :game_id => 34,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "云南三/五/七区",
          :game_id => 34,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "云南十二/十九区",
          :game_id => 34,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "云南十六/十八区",
          :game_id => 34,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "云南十七区",
          :game_id => 34,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "云南二十区",
          :game_id => 34,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "云南二十一区",
          :game_id => 34,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "云南二十二区",
          :game_id => 34,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "云南二十三区",
          :game_id => 34,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "云南二十五区",
          :game_id => 34,
          :area_id => gamearea14.id)
gamearea15 = GameArea.create(
          :name => "第十六大区（河北网通）",
          :game_id => 34)
GameServer.create(
          :name => "河北一区",
          :game_id => 34,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "河北二区",
          :game_id => 34,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "河北三/六/十一区",
          :game_id => 34,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "河北七/十区",
          :game_id => 34,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "河北十二/十五/十七区",
          :game_id => 34,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "河北十八/十九/二十区",
          :game_id => 34,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "河北二十一区",
          :game_id => 34,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "河北二十二/二十三区",
          :game_id => 34,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "河北二十五区",
          :game_id => 34,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "河北二十六区",
          :game_id => 34,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "河北二十七区",
          :game_id => 34,
          :area_id => gamearea15.id)
gamearea16 = GameArea.create(
          :name => "第十七大区（福建电信2）",
          :game_id => 34)
GameServer.create(
          :name => "福建新一区",
          :game_id => 34,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "福建新二区",
          :game_id => 34,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "福建新六/八/九区",
          :game_id => 34,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "福建新十一/十六区",
          :game_id => 34,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "福建新十八/十九/二十区",
          :game_id => 34,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "福建新二十二区",
          :game_id => 34,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "福建新二十三区",
          :game_id => 34,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "福建新二十五区",
          :game_id => 34,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "福建新二十六区",
          :game_id => 34,
          :area_id => gamearea16.id)
gamearea17 = GameArea.create(
          :name => "第十八大区（山东网通2）",
          :game_id => 34)
GameServer.create(
          :name => "山东新一/五/七区",
          :game_id => 34,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "山东新二区",
          :game_id => 34,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "山东新三/八/十三/十六区",
          :game_id => 34,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "山东新十七区",
          :game_id => 34,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "山东新二十区",
          :game_id => 34,
          :area_id => gamearea17.id)
gamearea18 = GameArea.create(
          :name => "第十九大区（黑龙江网通）",
          :game_id => 34)
GameServer.create(
          :name => "黑龙江一区",
          :game_id => 34,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "黑龙江二/五/六区",
          :game_id => 34,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "黑龙江三区",
          :game_id => 34,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "黑龙江十二区",
          :game_id => 34,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "黑龙江十三/十五区",
          :game_id => 34,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "黑龙江十六/十七区",
          :game_id => 34,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "黑龙江十八区",
          :game_id => 34,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "黑龙江十九区",
          :game_id => 34,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "黑龙江二十区",
          :game_id => 34,
          :area_id => gamearea18.id)
gamearea19 = GameArea.create(
          :name => "第二十大区（广东电信2）",
          :game_id => 34)
GameServer.create(
          :name => "广东新一区",
          :game_id => 34,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "广东新二/十五区",
          :game_id => 34,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "广东新三/五/六/七区",
          :game_id => 34,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "广东新八/九/十二区",
          :game_id => 34,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "广东新十一/十三/十七区",
          :game_id => 34,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "广东新十八区",
          :game_id => 34,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "广东新十九区",
          :game_id => 34,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "广东新二十区",
          :game_id => 34,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "广东新二十一区",
          :game_id => 34,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "广东新二十二区",
          :game_id => 34,
          :area_id => gamearea19.id)
gamearea20 = GameArea.create(
          :name => "第二十一大区（上海电信2）",
          :game_id => 34)
GameServer.create(
          :name => "上海新一/二/八区",
          :game_id => 34,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "上海新五/六/十二区",
          :game_id => 34,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "上海新十/十一区",
          :game_id => 34,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "上海新十三区",
          :game_id => 34,
          :area_id => gamearea20.id)
gamearea21 = GameArea.create(
          :name => "第二十二大区（四川电信2）",
          :game_id => 34)
GameServer.create(
          :name => "四川新一/十五区",
          :game_id => 34,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "四川新二/三区",
          :game_id => 34,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "四川新五/六/七区",
          :game_id => 34,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "四川新十/十一/十七区",
          :game_id => 34,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "四川新二十区",
          :game_id => 34,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "四川新二十一区",
          :game_id => 34,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "四川新二十二区",
          :game_id => 34,
          :area_id => gamearea21.id)
gamearea22 = GameArea.create(
          :name => "第二十三大区（浙江电信2）",
          :game_id => 34)
GameServer.create(
          :name => "浙江新一区",
          :game_id => 34,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "浙江新二/五区",
          :game_id => 34,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "浙江新九/十二区",
          :game_id => 34,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "浙江新十七/十八/十九区",
          :game_id => 34,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "浙江新二十/二十二区",
          :game_id => 34,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "浙江新二十三区",
          :game_id => 34,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "浙江新二十五区",
          :game_id => 34,
          :area_id => gamearea22.id)
gamearea23 = GameArea.create(
          :name => "第二十四大区（江苏电信2）",
          :game_id => 34)
GameServer.create(
          :name => "江苏新一/五区",
          :game_id => 34,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "江苏新二区",
          :game_id => 34,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "江苏新三/七区",
          :game_id => 34,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "江苏新八/十/十三区",
          :game_id => 34,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "江苏新十七区",
          :game_id => 34,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "江苏新十九/二十区",
          :game_id => 34,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "江苏新二十一区",
          :game_id => 34,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "江苏新二十二区",
          :game_id => 34,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "江苏新二十三区",
          :game_id => 34,
          :area_id => gamearea23.id)
gamearea24 = GameArea.create(
          :name => "第二十五大区（湖南电信2）",
          :game_id => 34)
GameServer.create(
          :name => "湖南新一/五区",
          :game_id => 34,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "湖南新二/三/七/八区",
          :game_id => 34,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "湖南新十二区",
          :game_id => 34,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "湖南新十三/十六区",
          :game_id => 34,
          :area_id => gamearea24.id)
gamearea25 = GameArea.create(
          :name => "第二十六大区（湖北电信2）",
          :game_id => 34)
GameServer.create(
          :name => "湖北新一/二区",
          :game_id => 34,
          :area_id => gamearea25.id)
GameServer.create(
          :name => "湖北新五/七区",
          :game_id => 34,
          :area_id => gamearea25.id)
GameServer.create(
          :name => "湖北新九区",
          :game_id => 34,
          :area_id => gamearea25.id)
GameServer.create(
          :name => "湖北新十二/十七区",
          :game_id => 34,
          :area_id => gamearea25.id)
GameServer.create(
          :name => "湖北新十五/十六区",
          :game_id => 34,
          :area_id => gamearea25.id)
GameServer.create(
          :name => "湖北新十八区",
          :game_id => 34,
          :area_id => gamearea25.id)
GameServer.create(
          :name => "湖北新十九区",
          :game_id => 34,
          :area_id => gamearea25.id)
gamearea26 = GameArea.create(
          :name => "第二十七大区（江西电信2）",
          :game_id => 34)
GameServer.create(
          :name => "江西新一/三/五区",
          :game_id => 34,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "江西新六/八区",
          :game_id => 34,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "江西新九区",
          :game_id => 34,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "江西新十区",
          :game_id => 34,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "江西新十一区",
          :game_id => 34,
          :area_id => gamearea26.id)
gamearea27 = GameArea.create(
          :name => "第二十八大区（广西电信2）",
          :game_id => 34)
GameServer.create(
          :name => "广西新一/三/六区",
          :game_id => 34,
          :area_id => gamearea27.id)
GameServer.create(
          :name => "广西新七/九区",
          :game_id => 34,
          :area_id => gamearea27.id)
GameServer.create(
          :name => "广西新十区",
          :game_id => 34,
          :area_id => gamearea27.id)
gamearea28 = GameArea.create(
          :name => "第二十九大区（安徽电信2）",
          :game_id => 34)
GameServer.create(
          :name => "安徽新一/七区",
          :game_id => 34,
          :area_id => gamearea28.id)
GameServer.create(
          :name => "安徽新二/三/五/八区",
          :game_id => 34,
          :area_id => gamearea28.id)
GameServer.create(
          :name => "安徽新十二区",
          :game_id => 34,
          :area_id => gamearea28.id)
gamearea29 = GameArea.create(
          :name => "第三十大区（新疆电信）",
          :game_id => 34)
GameServer.create(
          :name => "新疆一区",
          :game_id => 34,
          :area_id => gamearea29.id)
GameServer.create(
          :name => "新疆二/三/八区",
          :game_id => 34,
          :area_id => gamearea29.id)
GameServer.create(
          :name => "新疆十/十一/十二/十三区",
          :game_id => 34,
          :area_id => gamearea29.id)
GameServer.create(
          :name => "新疆十五/十六区",
          :game_id => 34,
          :area_id => gamearea29.id)
gamearea30 = GameArea.create(
          :name => "第三十一大区（ 云南电信2）",
          :game_id => 34)
GameServer.create(
          :name => "云南新一/二/五/六区",
          :game_id => 34,
          :area_id => gamearea30.id)
GameServer.create(
          :name => "云南新九/十区",
          :game_id => 34,
          :area_id => gamearea30.id)
gamearea31 = GameArea.create(
          :name => "第三十二大区（河北网通2）",
          :game_id => 34)
GameServer.create(
          :name => "河北新一/二/三/六区",
          :game_id => 34,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "河北新八/十区",
          :game_id => 34,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "河北新十一区",
          :game_id => 34,
          :area_id => gamearea31.id)
gamearea32 = GameArea.create(
          :name => "第三十三大区（福建网通3）",
          :game_id => 34)
GameServer.create(
          :name => "福建特一/二/六/十一区",
          :game_id => 34,
          :area_id => gamearea32.id)
GameServer.create(
          :name => "福建特七/十五区",
          :game_id => 34,
          :area_id => gamearea32.id)
GameServer.create(
          :name => "福建特八/十三区",
          :game_id => 34,
          :area_id => gamearea32.id)
GameServer.create(
          :name => "福建特十九/二十区",
          :game_id => 34,
          :area_id => gamearea32.id)
GameServer.create(
          :name => "福建特二十一区",
          :game_id => 34,
          :area_id => gamearea32.id)
gamearea33 = GameArea.create(
          :name => "第三十四大区（河南网通）",
          :game_id => 34)
GameServer.create(
          :name => "河南一区",
          :game_id => 34,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "河南二/七/八区",
          :game_id => 34,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "河南三/十/十五区",
          :game_id => 34,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "河南六/十三/十七区",
          :game_id => 34,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "河南十八区",
          :game_id => 34,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "河南二十/二十一区",
          :game_id => 34,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "河南二十二区",
          :game_id => 34,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "河南二十三区",
          :game_id => 34,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "河南二十五区",
          :game_id => 34,
          :area_id => gamearea33.id)
gamearea34 = GameArea.create(
          :name => "第三十五大区（河南网通2）",
          :game_id => 34)
GameServer.create(
          :name => "河南新一/二区",
          :game_id => 34,
          :area_id => gamearea34.id)
GameServer.create(
          :name => "河南新三/九区",
          :game_id => 34,
          :area_id => gamearea34.id)
GameServer.create(
          :name => "河南新六/十区",
          :game_id => 34,
          :area_id => gamearea34.id)
gamearea35 = GameArea.create(
          :name => "第三十六大区（广东电信3）",
          :game_id => 34)
GameServer.create(
          :name => "广东特一/八区",
          :game_id => 34,
          :area_id => gamearea35.id)
GameServer.create(
          :name => "广东特二/十一区",
          :game_id => 34,
          :area_id => gamearea35.id)
GameServer.create(
          :name => "广东特三/十二/十五区",
          :game_id => 34,
          :area_id => gamearea35.id)
GameServer.create(
          :name => "广东特六/七区",
          :game_id => 34,
          :area_id => gamearea35.id)
GameServer.create(
          :name => "广东特十九区",
          :game_id => 34,
          :area_id => gamearea35.id)
GameServer.create(
          :name => "广东特二十/二十一区",
          :game_id => 34,
          :area_id => gamearea35.id)
GameServer.create(
          :name => "广东特二十二/二十三区",
          :game_id => 34,
          :area_id => gamearea35.id)
GameServer.create(
          :name => "广东特二十五区",
          :game_id => 34,
          :area_id => gamearea35.id)
gamearea36 = GameArea.create(
          :name => "第三十七大区（山西网通）",
          :game_id => 34)
GameServer.create(
          :name => "山西一/二/六区",
          :game_id => 34,
          :area_id => gamearea36.id)
GameServer.create(
          :name => "山西七区",
          :game_id => 34,
          :area_id => gamearea36.id)
GameServer.create(
          :name => "山西八区",
          :game_id => 34,
          :area_id => gamearea36.id)
GameServer.create(
          :name => "山西九区",
          :game_id => 34,
          :area_id => gamearea36.id)
GameServer.create(
          :name => "山西十区",
          :game_id => 34,
          :area_id => gamearea36.id)
gamearea37 = GameArea.create(
          :name => "第三十八大区（四川电信3）",
          :game_id => 34)
GameServer.create(
          :name => "四川特一/二/三/七区",
          :game_id => 34,
          :area_id => gamearea37.id)
GameServer.create(
          :name => "四川特八/九区",
          :game_id => 34,
          :area_id => gamearea37.id)
GameServer.create(
          :name => "四川特十三区",
          :game_id => 34,
          :area_id => gamearea37.id)
gamearea38 = GameArea.create(
          :name => "第三十九大区（天津网通）",
          :game_id => 34)
GameServer.create(
          :name => "天津一/二区",
          :game_id => 34,
          :area_id => gamearea38.id)
GameServer.create(
          :name => "天津六/九区",
          :game_id => 34,
          :area_id => gamearea38.id)
GameServer.create(
          :name => "天津七/八区",
          :game_id => 34,
          :area_id => gamearea38.id)
GameServer.create(
          :name => "天津十区",
          :game_id => 34,
          :area_id => gamearea38.id)
gamearea39 = GameArea.create(
          :name => "第四十大区（江苏电信3）",
          :game_id => 34)
GameServer.create(
          :name => "江苏特一/五/七区",
          :game_id => 34,
          :area_id => gamearea39.id)
GameServer.create(
          :name => "江苏特二/十二区",
          :game_id => 34,
          :area_id => gamearea39.id)
GameServer.create(
          :name => "江苏特八/九/十六区",
          :game_id => 34,
          :area_id => gamearea39.id)
GameServer.create(
          :name => "金陵无双一区",
          :game_id => 34,
          :area_id => gamearea39.id)
gamearea40 = GameArea.create(
          :name => "第四十一大区（重庆电信）",
          :game_id => 34)
GameServer.create(
          :name => "重庆一/十七区",
          :game_id => 34,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "重庆三/七/十八区",
          :game_id => 34,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "重庆十/十二/十三区",
          :game_id => 34,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "重庆十五/十六区",
          :game_id => 34,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "重庆十九区",
          :game_id => 34,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "重庆二十区",
          :game_id => 34,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "重庆二十一区",
          :game_id => 34,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "重庆二十二区",
          :game_id => 34,
          :area_id => gamearea40.id)
gamearea41 = GameArea.create(
          :name => "第四十二大区（贵州电信）",
          :game_id => 34)
GameServer.create(
          :name => "贵州一区",
          :game_id => 34,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "贵州二/七区",
          :game_id => 34,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "贵州三/六区",
          :game_id => 34,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "贵州十/十三/十六区",
          :game_id => 34,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "贵州十九区",
          :game_id => 34,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "贵州二十区",
          :game_id => 34,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "贵州二十一区",
          :game_id => 34,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "贵州二十二区",
          :game_id => 34,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "贵州二十三区",
          :game_id => 34,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "贵州二十五区",
          :game_id => 34,
          :area_id => gamearea41.id)
gamearea42 = GameArea.create(
          :name => "第四十三大区（贵州电信2）",
          :game_id => 34)
GameServer.create(
          :name => "贵州新一/二/三区",
          :game_id => 34,
          :area_id => gamearea42.id)
GameServer.create(
          :name => "贵州新五/十区",
          :game_id => 34,
          :area_id => gamearea42.id)
gamearea43 = GameArea.create(
          :name => "第四十四大区（陕西电信）",
          :game_id => 34)
GameServer.create(
          :name => "陕西一区",
          :game_id => 34,
          :area_id => gamearea43.id)
GameServer.create(
          :name => "陕西二/三区",
          :game_id => 34,
          :area_id => gamearea43.id)
GameServer.create(
          :name => "陕西五/八/九区",
          :game_id => 34,
          :area_id => gamearea43.id)
GameServer.create(
          :name => "陕西十六区",
          :game_id => 34,
          :area_id => gamearea43.id)
GameServer.create(
          :name => "陕西十八/十九区",
          :game_id => 34,
          :area_id => gamearea43.id)
GameServer.create(
          :name => "陕西二十/二十一区",
          :game_id => 34,
          :area_id => gamearea43.id)
GameServer.create(
          :name => "陕西二十二区",
          :game_id => 34,
          :area_id => gamearea43.id)
GameServer.create(
          :name => "陕西二十三区",
          :game_id => 34,
          :area_id => gamearea43.id)
GameServer.create(
          :name => "陕西二十五区",
          :game_id => 34,
          :area_id => gamearea43.id)
GameServer.create(
          :name => "陕西二十六区",
          :game_id => 34,
          :area_id => gamearea43.id)
gamearea44 = GameArea.create(
          :name => "第四十五大区（甘肃青海）",
          :game_id => 34)
GameServer.create(
          :name => "甘肃一区",
          :game_id => 34,
          :area_id => gamearea44.id)
GameServer.create(
          :name => "青海一/西藏一/宁夏三区",
          :game_id => 34,
          :area_id => gamearea44.id)
GameServer.create(
          :name => "宁夏一区/甘肃二区",
          :game_id => 34,
          :area_id => gamearea44.id)
GameServer.create(
          :name => "西藏二区/青海三区",
          :game_id => 34,
          :area_id => gamearea44.id)
GameServer.create(
          :name => "西北一区",
          :game_id => 34,
          :area_id => gamearea44.id)
GameServer.create(
          :name => "西北二区",
          :game_id => 34,
          :area_id => gamearea44.id)
GameServer.create(
          :name => "西北三区",
          :game_id => 34,
          :area_id => gamearea44.id)
gamearea45 = GameArea.create(
          :name => "第四十六大区（海南电信）",
          :game_id => 34)
GameServer.create(
          :name => "海南一/二/八区",
          :game_id => 34,
          :area_id => gamearea45.id)
GameServer.create(
          :name => "海南三区",
          :game_id => 34,
          :area_id => gamearea45.id)
GameServer.create(
          :name => "海南十二/十五区",
          :game_id => 34,
          :area_id => gamearea45.id)
GameServer.create(
          :name => "海南十六区",
          :game_id => 34,
          :area_id => gamearea45.id)
GameServer.create(
          :name => "海南十七区",
          :game_id => 34,
          :area_id => gamearea45.id)
gamearea46 = GameArea.create(
          :name => "第四十七大区（特别行政区）",
          :game_id => 34)
GameServer.create(
          :name => "台湾一/澳门二区",
          :game_id => 34,
          :area_id => gamearea46.id)
GameServer.create(
          :name => "澳门一/九区/台湾三区",
          :game_id => 34,
          :area_id => gamearea46.id)
GameServer.create(
          :name => "澳门一/十一区",
          :game_id => 34,
          :area_id => gamearea46.id)
GameServer.create(
          :name => "海外一区",
          :game_id => 34,
          :area_id => gamearea46.id)
gamearea47 = GameArea.create(
          :name => "第四十八大区（香港电信）",
          :game_id => 34)
GameServer.create(
          :name => "香港一区",
          :game_id => 34,
          :area_id => gamearea47.id)
GameServer.create(
          :name => "香港二/六/十/十七区",
          :game_id => 34,
          :area_id => gamearea47.id)
GameServer.create(
          :name => "香港三/七/九区",
          :game_id => 34,
          :area_id => gamearea47.id)
GameServer.create(
          :name => "香港十八/十九区",
          :game_id => 34,
          :area_id => gamearea47.id)
GameServer.create(
          :name => "香港二十/二十一区",
          :game_id => 34,
          :area_id => gamearea47.id)
GameServer.create(
          :name => "香港二十二/二十五区",
          :game_id => 34,
          :area_id => gamearea47.id)
GameServer.create(
          :name => "香港二十六区",
          :game_id => 34,
          :area_id => gamearea47.id)
gamearea48 = GameArea.create(
          :name => "第四十九大区（王者之翼电信）",
          :game_id => 34)
GameServer.create(
          :name => "王者一/七/十二/十五区",
          :game_id => 34,
          :area_id => gamearea48.id)
GameServer.create(
          :name => "王者二/三/五/十区",
          :game_id => 34,
          :area_id => gamearea48.id)
GameServer.create(
          :name => "王者六/八/九区",
          :game_id => 34,
          :area_id => gamearea48.id)
GameServer.create(
          :name => "王者十六区",
          :game_id => 34,
          :area_id => gamearea48.id)
gamearea49 = GameArea.create(
          :name => "第五十大区（王者之翼网通）",
          :game_id => 34)
GameServer.create(
          :name => "王者一区",
          :game_id => 34,
          :area_id => gamearea49.id)
GameServer.create(
          :name => "王者二/三/五/六/九区",
          :game_id => 34,
          :area_id => gamearea49.id)
GameServer.create(
          :name => "王者十区",
          :game_id => 34,
          :area_id => gamearea49.id)
gamearea50 = GameArea.create(
          :name => "第五十一大区（天使之翼电信）",
          :game_id => 34)
GameServer.create(
          :name => "天使一/五/六区",
          :game_id => 34,
          :area_id => gamearea50.id)
GameServer.create(
          :name => "天使二/三/七区",
          :game_id => 34,
          :area_id => gamearea50.id)
GameServer.create(
          :name => "天使八区",
          :game_id => 34,
          :area_id => gamearea50.id)
GameServer.create(
          :name => "天使九区",
          :game_id => 34,
          :area_id => gamearea50.id)
GameServer.create(
          :name => "天使十区",
          :game_id => 34,
          :area_id => gamearea50.id)
gamearea51 = GameArea.create(
          :name => "第五十二大区（天使之翼网通）",
          :game_id => 34)
GameServer.create(
          :name => "天使一/二区",
          :game_id => 34,
          :area_id => gamearea51.id)
GameServer.create(
          :name => "天使三/五区",
          :game_id => 34,
          :area_id => gamearea51.id)
GameServer.create(
          :name => "天使六/七区",
          :game_id => 34,
          :area_id => gamearea51.id)
gamearea52 = GameArea.create(
          :name => "第五十三大区（高校电信）",
          :game_id => 34)
GameServer.create(
          :name => "高校一/二区",
          :game_id => 34,
          :area_id => gamearea52.id)
GameServer.create(
          :name => "高校三/五区",
          :game_id => 34,
          :area_id => gamearea52.id)
GameServer.create(
          :name => "高校六/七区",
          :game_id => 34,
          :area_id => gamearea52.id)
GameServer.create(
          :name => "高校八/九区",
          :game_id => 34,
          :area_id => gamearea52.id)
gamearea53 = GameArea.create(
          :name => "第五十四大区（高校网通）",
          :game_id => 34)
GameServer.create(
          :name => "高校一/三区",
          :game_id => 34,
          :area_id => gamearea53.id)
GameServer.create(
          :name => "高校二/五区",
          :game_id => 34,
          :area_id => gamearea53.id)
GameServer.create(
          :name => "高校六/七区",
          :game_id => 34,
          :area_id => gamearea53.id)
GameServer.create(
          :name => "高校八区",
          :game_id => 34,
          :area_id => gamearea53.id)
gamearea54 = GameArea.create(
          :name => "第五十五大区（众神归来电信）",
          :game_id => 34)
GameServer.create(
          :name => "众神一/十二区",
          :game_id => 34,
          :area_id => gamearea54.id)
GameServer.create(
          :name => "众神二/五区",
          :game_id => 34,
          :area_id => gamearea54.id)
GameServer.create(
          :name => "众神三/十五区",
          :game_id => 34,
          :area_id => gamearea54.id)
GameServer.create(
          :name => "众神六/七区",
          :game_id => 34,
          :area_id => gamearea54.id)
GameServer.create(
          :name => "众神八/九区",
          :game_id => 34,
          :area_id => gamearea54.id)
GameServer.create(
          :name => "众神十/十三区",
          :game_id => 34,
          :area_id => gamearea54.id)
GameServer.create(
          :name => "众神十一/十六区",
          :game_id => 34,
          :area_id => gamearea54.id)
GameServer.create(
          :name => "众神十七区",
          :game_id => 34,
          :area_id => gamearea54.id)
GameServer.create(
          :name => "众神十八区",
          :game_id => 34,
          :area_id => gamearea54.id)
gamearea55 = GameArea.create(
          :name => "第五十六大区（众神归来网通）",
          :game_id => 34)
GameServer.create(
          :name => "众神一区",
          :game_id => 34,
          :area_id => gamearea55.id)
GameServer.create(
          :name => "众神二/十一区",
          :game_id => 34,
          :area_id => gamearea55.id)
GameServer.create(
          :name => "众神三/五区",
          :game_id => 34,
          :area_id => gamearea55.id)
GameServer.create(
          :name => "众神六区",
          :game_id => 34,
          :area_id => gamearea55.id)
GameServer.create(
          :name => "众神七/九区",
          :game_id => 34,
          :area_id => gamearea55.id)
GameServer.create(
          :name => "众神八/十六区",
          :game_id => 34,
          :area_id => gamearea55.id)
GameServer.create(
          :name => "众神十/十五区",
          :game_id => 34,
          :area_id => gamearea55.id)
GameServer.create(
          :name => "众神十二/十三区",
          :game_id => 34,
          :area_id => gamearea55.id)
GameServer.create(
          :name => "众神十七区",
          :game_id => 34,
          :area_id => gamearea55.id)
GameServer.create(
          :name => "众神十八区",
          :game_id => 34,
          :area_id => gamearea55.id)
GameServer.create(
          :name => "众神十九区",
          :game_id => 34,
          :area_id => gamearea55.id)
gamearea56 = GameArea.create(
          :name => "第五十七大区（众神归来电信2）",
          :game_id => 34)
GameServer.create(
          :name => "众神新一区",
          :game_id => 34,
          :area_id => gamearea56.id)
GameServer.create(
          :name => "众神新二/六区",
          :game_id => 34,
          :area_id => gamearea56.id)
GameServer.create(
          :name => "众神新三/十区",
          :game_id => 34,
          :area_id => gamearea56.id)
GameServer.create(
          :name => "众神新五/十一区",
          :game_id => 34,
          :area_id => gamearea56.id)
GameServer.create(
          :name => "众神新七/十五区",
          :game_id => 34,
          :area_id => gamearea56.id)
GameServer.create(
          :name => "众神新八区",
          :game_id => 34,
          :area_id => gamearea56.id)
GameServer.create(
          :name => "众神新九区",
          :game_id => 34,
          :area_id => gamearea56.id)
GameServer.create(
          :name => "众神新十二区",
          :game_id => 34,
          :area_id => gamearea56.id)
GameServer.create(
          :name => "众神新十三区",
          :game_id => 34,
          :area_id => gamearea56.id)
GameServer.create(
          :name => "众神新十六区",
          :game_id => 34,
          :area_id => gamearea56.id)
GameServer.create(
          :name => "众神新十七区",
          :game_id => 34,
          :area_id => gamearea56.id)
gamearea57 = GameArea.create(
          :name => "第五十八大区（跨服pk赛专用）",
          :game_id => 34)
GameServer.create(
          :name => "跨服pk一区",
          :game_id => 34,
          :area_id => gamearea57.id)
GameServer.create(
          :name => "跨服pk二区",
          :game_id => 34,
          :area_id => gamearea57.id)
GameServer.create(
          :name => "跨服pk三区",
          :game_id => 34,
          :area_id => gamearea57.id)
GameServer.create(
          :name => "跨服pk四区",
          :game_id => 34,
          :area_id => gamearea57.id)
gamearea58 = GameArea.create(
          :name => "第五十九大区（众神归来电信3）",
          :game_id => 34)
GameServer.create(
          :name => "众神特一区",
          :game_id => 34,
          :area_id => gamearea58.id)
GameServer.create(
          :name => "众神特二区",
          :game_id => 34,
          :area_id => gamearea58.id)
GameServer.create(
          :name => "众神特三区",
          :game_id => 34,
          :area_id => gamearea58.id)
GameServer.create(
          :name => "众神特五区",
          :game_id => 34,
          :area_id => gamearea58.id)
GameServer.create(
          :name => "众神特六区",
          :game_id => 34,
          :area_id => gamearea58.id)
gamearea59 = GameArea.create(
          :name => "第六十大区（亚特王朝）",
          :game_id => 34)
GameServer.create(
          :name => "雷鸣大陆电信",
          :game_id => 34,
          :area_id => gamearea59.id)
GameServer.create(
          :name => "隐雾沼泽电信",
          :game_id => 34,
          :area_id => gamearea59.id)
GameServer.create(
          :name => "雪狼冰原电信",
          :game_id => 34,
          :area_id => gamearea59.id)
gamearea60 = GameArea.create(
          :name => "第六十一大区（沉沦之都）",
          :game_id => 34)
GameServer.create(
          :name => "末日迷城电信",
          :game_id => 34,
          :area_id => gamearea60.id)
GameServer.create(
          :name => "魔幻森林电信",
          :game_id => 34,
          :area_id => gamearea60.id)
gamearea61 = GameArea.create(
          :name => "第六十二大区（灭世魔劫电信）",
          :game_id => 34)
GameServer.create(
          :name => "魔王归来",
          :game_id => 34,
          :area_id => gamearea61.id)
GameServer.create(
          :name => "不朽之墓",
          :game_id => 34,
          :area_id => gamearea61.id)
GameServer.create(
          :name => "阿拉玛的哭泣",
          :game_id => 34,
          :area_id => gamearea61.id)
GameServer.create(
          :name => "冰封虫穴",
          :game_id => 34,
          :area_id => gamearea61.id)
  end

  def self.down
  end
end
