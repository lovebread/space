class AddDahuaxiyou3Data < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "人族化生寺",
        :game_id => 94)
GameProfession.create(
        :name => "人族方寸山",
        :game_id => 94)
GameProfession.create(
        :name => "人族大唐官府",
        :game_id => 94)
GameProfession.create(
        :name => "人族掖庭宫",
        :game_id => 94)
GameProfession.create(
        :name => "仙族瑶池",
        :game_id => 94)
GameProfession.create(
        :name => "仙族五庄观",
        :game_id => 94)
GameProfession.create(
        :name => "仙族东海龙宫",
        :game_id => 94)
GameProfession.create(
        :name => "仙族普陀山",
        :game_id => 94)
GameProfession.create(
        :name => "妖族黑风洞",
        :game_id => 94)
GameProfession.create(
        :name => "妖族白骨洞",
        :game_id => 94)
GameProfession.create(
        :name => "妖族盘丝洞",
        :game_id => 94)
GameProfession.create(
        :name => "妖族幽冥地府",
        :game_id => 94)
gamearea1 = GameArea.create(
          :name => "四川区",
          :game_id => 94)
GameServer.create(
          :name => "九寨沟",
          :game_id => 94,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "福建区",
          :game_id => 94)
GameServer.create(
          :name => "福建1服",
          :game_id => 94,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "内蒙古区",
          :game_id => 94)
GameServer.create(
          :name => "呼伦贝尔",
          :game_id => 94,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "江苏区",
          :game_id => 94)
GameServer.create(
          :name => "南京1服",
          :game_id => 94,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "陕西区",
          :game_id => 94)
GameServer.create(
          :name => "西安1服",
          :game_id => 94,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "河北区",
          :game_id => 94)
GameServer.create(
          :name => "石家庄1",
          :game_id => 94,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "避暑山庄",
          :game_id => 94,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "广东区",
          :game_id => 94)
GameServer.create(
          :name => "广州1服",
          :game_id => 94,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "广州2服",
          :game_id => 94,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "深圳1服",
          :game_id => 94,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "山西区",
          :game_id => 94)
GameServer.create(
          :name => "太原1服",
          :game_id => 94,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "太原2服",
          :game_id => 94,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "山东区",
          :game_id => 94)
GameServer.create(
          :name => "济南1服",
          :game_id => 94,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "青岛1服",
          :game_id => 94,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "河南区",
          :game_id => 94)
GameServer.create(
          :name => "郑州1服",
          :game_id => 94,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "云南区",
          :game_id => 94)
GameServer.create(
          :name => "昆明1服",
          :game_id => 94,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "浙江区",
          :game_id => 94)
GameServer.create(
          :name => "千岛湖",
          :game_id => 94,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "天界2区",
          :game_id => 94)
GameServer.create(
          :name => "杨柳依依",
          :game_id => 94,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "微雨芳尘",
          :game_id => 94,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "月桥花院",
          :game_id => 94,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "舞雪云筝",
          :game_id => 94,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "龙凤呈祥",
          :game_id => 94,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "海阔天空",
          :game_id => 94,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "月台花榭",
          :game_id => 94,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "春华秋实",
          :game_id => 94,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "蓬莱仙境",
          :game_id => 94,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "天涯海角",
          :game_id => 94,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "百家争鸣",
          :game_id => 94,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "陌上花开",
          :game_id => 94,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "蟠桃园",
          :game_id => 94,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "烛影摇红",
          :game_id => 94,
          :area_id => gamearea13.id)
gamearea14 = GameArea.create(
          :name => "地界",
          :game_id => 94)
GameServer.create(
          :name => "锦绣中华",
          :game_id => 94,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "红叶香山",
          :game_id => 94,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "天香国色",
          :game_id => 94,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "在水一方",
          :game_id => 94,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "西湖烟雨",
          :game_id => 94,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "醉清风",
          :game_id => 94,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "渺渺梵音",
          :game_id => 94,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "金玉满堂",
          :game_id => 94,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "南粤花院",
          :game_id => 94,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "鸳鸯梦",
          :game_id => 94,
          :area_id => gamearea14.id)
gamearea15 = GameArea.create(
          :name => "人界",
          :game_id => 94)
GameServer.create(
          :name => "雨雪霏霏",
          :game_id => 94,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "白云深处",
          :game_id => 94,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "弦歌羽意",
          :game_id => 94,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "踏歌行",
          :game_id => 94,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "人淡如菊",
          :game_id => 94,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "泠泠月上",
          :game_id => 94,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "花好月圆",
          :game_id => 94,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "天上人间",
          :game_id => 94,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "比翼双飞",
          :game_id => 94,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "仗剑天涯",
          :game_id => 94,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "长相思",
          :game_id => 94,
          :area_id => gamearea15.id)
gamearea16 = GameArea.create(
          :name => "冥界",
          :game_id => 94)
GameServer.create(
          :name => "秋千月影",
          :game_id => 94,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "长安月下",
          :game_id => 94,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "秋水长天",
          :game_id => 94,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "菊花台",
          :game_id => 94,
          :area_id => gamearea16.id)
gamearea17 = GameArea.create(
          :name => "修罗",
          :game_id => 94)
GameServer.create(
          :name => "九天飘雪",
          :game_id => 94,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "月笼丁香",
          :game_id => 94,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "笑红尘",
          :game_id => 94,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "剑胆琴心",
          :game_id => 94,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "皓月天山",
          :game_id => 94,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "巴山夜雨",
          :game_id => 94,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "潇湘夜雨",
          :game_id => 94,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "宝象奇缘",
          :game_id => 94,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "回风舞雪",
          :game_id => 94,
          :area_id => gamearea17.id)
gamearea18 = GameArea.create(
          :name => "妖界2区",
          :game_id => 94)
GameServer.create(
          :name => "轻歌妙舞",
          :game_id => 94,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "剑走清秋",
          :game_id => 94,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "画堂秋思",
          :game_id => 94,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "斜阳草树",
          :game_id => 94,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "空谷幽兰",
          :game_id => 94,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "红袖添香",
          :game_id => 94,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "为爱西行",
          :game_id => 94,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "苍涛龙吟",
          :game_id => 94,
          :area_id => gamearea18.id)
gamearea19 = GameArea.create(
          :name => "妖界",
          :game_id => 94)
GameServer.create(
          :name => "三秋云薄",
          :game_id => 94,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "如梦令",
          :game_id => 94,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "玉人歌",
          :game_id => 94,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "蝶恋花",
          :game_id => 94,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "金榜题名",
          :game_id => 94,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "两小无猜",
          :game_id => 94,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "有凤来仪",
          :game_id => 94,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "西江月",
          :game_id => 94,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "建国大业",
          :game_id => 94,
          :area_id => gamearea19.id)
gamearea20 = GameArea.create(
          :name => "天界",
          :game_id => 94)
GameServer.create(
          :name => "水调歌头",
          :game_id => 94,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "断桥融雪",
          :game_id => 94,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "鹊桥仙",
          :game_id => 94,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "笑傲江湖",
          :game_id => 94,
          :area_id => gamearea20.id)
  end

  def self.down
  end
end
