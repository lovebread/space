class AddWendaoData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "五龙山云霄洞",
        :game_id => 35)
GameProfession.create(
        :name => "终南山玉柱洞",
        :game_id => 35)
GameProfession.create(
        :name => "凤凰山斗阙宫",
        :game_id => 35)
GameProfession.create(
        :name => "乾元山金光洞",
        :game_id => 35)
GameProfession.create(
        :name => "骷髅山白骨洞",
        :game_id => 35)
gamearea1 = GameArea.create(
          :name => "电信一区",
          :game_id => 35)
GameServer.create(
          :name => "鼓浪屿",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "香格里拉",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "倚天屠龙",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "巍巍太行",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "百里秦川",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "橘子洲头",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "武当雄风",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "黄埔风云",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "巴蜀山城",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "珠海明珠",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "乐山大佛",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "蜀南竹海",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "奇门遁甲",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "华山论剑",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "钟山风雨",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "钱塘观潮",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "金顶佛光",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "黄果树",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "豫园佳境",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "岭南风情",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "飞天逐月",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "天罡北斗",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "仙踪飘渺",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "流光异彩",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "锦绣中华",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "沧海一笑",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "云海苍穹",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "平湖秋月",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "逐浪江南",
          :game_id => 35,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "九州同庆",
          :game_id => 35,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "电信二区",
          :game_id => 35)
GameServer.create(
          :name => "繁荣富强",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "西湖追梦",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "书声琅琅",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "红袖添香",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "乘风破浪",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "蝶舞满天",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "飞黄腾达",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "曲院风荷",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "三潭映月",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "比翼双飞",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "苏提春晓",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "群雄逐鹿",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "叱咤风云",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "长空剑舞",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "春来燕归",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "万象春回",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "金戈铁马",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "岳阳楼",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "江山万里",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "花好月圆",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "天地雄心",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "雄霸天下",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "蓬莱仙境",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "桃园结义",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "乾坤无极",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "世外桃源",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "黄鹤楼",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "天府情缘",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "群星聚会",
          :game_id => 35,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "柔情侠骨",
          :game_id => 35,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "电信三区",
          :game_id => 35)
GameServer.create(
          :name => "落英缤纷",
          :game_id => 35,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "跨服战场",
          :game_id => 35,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "千里婵娟",
          :game_id => 35,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "西湖映月",
          :game_id => 35,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "君临天下",
          :game_id => 35,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "海阔天空",
          :game_id => 35,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "千秋霸业",
          :game_id => 35,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "众志成城",
          :game_id => 35,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "天时地利",
          :game_id => 35,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "凌霄宝殿",
          :game_id => 35,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "吉祥如意",
          :game_id => 35,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "飞雪连天",
          :game_id => 35,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "水月洞天",
          :game_id => 35,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "文韬武略",
          :game_id => 35,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "碧血情天",
          :game_id => 35,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "网通一区",
          :game_id => 35)
GameServer.create(
          :name => "明月婵心",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "燕山月色",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "山高水长",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "紫气东来",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "居庸叠翠",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "卢沟晓月",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "湖光山色",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "鹏程万里",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "雪照云光",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "紫塞明珠",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "得道飞升",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "紫禁之巅",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "火树银花",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "御剑飞仙",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "雪山飞狐",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "笑傲江湖",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "水泊梁山",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "海河之滨",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "风雨征途",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "铁血丹心",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "万里长城",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "林海雪原",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "龙腾渤海",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "逐鹿中原",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "长白天池",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "牡丹花城",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "物华天宝",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "北京古都",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "避暑山庄",
          :game_id => 35,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "龙盘泰山",
          :game_id => 35,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "网通二区",
          :game_id => 35)
GameServer.create(
          :name => "盘古开天",
          :game_id => 35,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "秋水长空",
          :game_id => 35,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "龙腾盛世",
          :game_id => 35,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "风云际会",
          :game_id => 35,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "寻仙问道",
          :game_id => 35,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "地久天长",
          :game_id => 35,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "仙侣情缘",
          :game_id => 35,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "春花秋月",
          :game_id => 35,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "落雪缤纷",
          :game_id => 35,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "炎黄盛世",
          :game_id => 35,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "剑荡九州",
          :game_id => 35,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "名动天下",
          :game_id => 35,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "皓月千里",
          :game_id => 35,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "阳春白雪",
          :game_id => 35,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "清风明月",
          :game_id => 35,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "西山晴雪",
          :game_id => 35,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "泰山北斗",
          :game_id => 35,
          :area_id => gamearea5.id)
  end

  def self.down
  end
end
