class AddMenghuanxiyouData < ActiveRecord::Migration
  def self.up
GameProfession.create(
        :name => "人族大唐官府",
        :game_id => 52)
GameProfession.create(
        :name => "人族化生寺",
        :game_id => 52)
GameProfession.create(
        :name => "人族方寸山",
        :game_id => 52)
GameProfession.create(
        :name => "人族女儿村",
        :game_id => 52)
GameProfession.create(
        :name => "仙族龙宫",
        :game_id => 52)
GameProfession.create(
        :name => "仙族普陀山",
        :game_id => 52)
GameProfession.create(
        :name => "仙族五庄观",
        :game_id => 52)
GameProfession.create(
        :name => "仙族天宫",
        :game_id => 52)
GameProfession.create(
        :name => "魔族阴曹地府",
        :game_id => 52)
GameProfession.create(
        :name => "魔族魔王寨",
        :game_id => 52)
GameProfession.create(
        :name => "魔族盘丝洞",
        :game_id => 52)
GameProfession.create(
        :name => "魔族狮驼岭",
        :game_id => 52)
gamearea1 = GameArea.create(
          :name => "内蒙区",
          :game_id => 52)
GameServer.create(
          :name => "响沙湾",
          :game_id => 52,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "九峰山",
          :game_id => 52,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "雄鹰岭",
          :game_id => 52,
          :area_id => gamearea1.id)
GameServer.create(
          :name => "大青山",
          :game_id => 52,
          :area_id => gamearea1.id)
gamearea2 = GameArea.create(
          :name => "山西区",
          :game_id => 52)
GameServer.create(
          :name => "北岳恒山",
          :game_id => 52,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "秋风楼",
          :game_id => 52,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "上党郡",
          :game_id => 52,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "挂月峰",
          :game_id => 52,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "望海峰",
          :game_id => 52,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "五台山",
          :game_id => 52,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "雁门关",
          :game_id => 52,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "马道坡",
          :game_id => 52,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "平型关",
          :game_id => 52,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "广胜寺",
          :game_id => 52,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "晋阳湖",
          :game_id => 52,
          :area_id => gamearea2.id)
GameServer.create(
          :name => "太原晋祠",
          :game_id => 52,
          :area_id => gamearea2.id)
gamearea3 = GameArea.create(
          :name => "陕西区",
          :game_id => 52)
GameServer.create(
          :name => "大雁塔",
          :game_id => 52,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "小雁塔",
          :game_id => 52,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "终南山",
          :game_id => 52,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "钟鼓楼",
          :game_id => 52,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "西岳华山",
          :game_id => 52,
          :area_id => gamearea3.id)
GameServer.create(
          :name => "白鹿原",
          :game_id => 52,
          :area_id => gamearea3.id)
gamearea4 = GameArea.create(
          :name => "四川1区",
          :game_id => 52)
GameServer.create(
          :name => "富乐山",
          :game_id => 52,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "剑门关",
          :game_id => 52,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "九寨沟",
          :game_id => 52,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "嘉陵关",
          :game_id => 52,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "白帝城",
          :game_id => 52,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "成都府",
          :game_id => 52,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "越王楼",
          :game_id => 52,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "寻龙山",
          :game_id => 52,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "泸定桥",
          :game_id => 52,
          :area_id => gamearea4.id)
GameServer.create(
          :name => "李白故里",
          :game_id => 52,
          :area_id => gamearea4.id)
gamearea5 = GameArea.create(
          :name => "四川2区",
          :game_id => 52)
GameServer.create(
          :name => "西岭雪山",
          :game_id => 52,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "峨眉山",
          :game_id => 52,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "光明顶",
          :game_id => 52,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "文殊院",
          :game_id => 52,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "都江堰",
          :game_id => 52,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "万胜府",
          :game_id => 52,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "天经阁",
          :game_id => 52,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "老君阁",
          :game_id => 52,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "青城山",
          :game_id => 52,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "德阳文庙",
          :game_id => 52,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "千佛岩",
          :game_id => 52,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "五通桥",
          :game_id => 52,
          :area_id => gamearea5.id)
GameServer.create(
          :name => "杜甫草堂",
          :game_id => 52,
          :area_id => gamearea5.id)
gamearea6 = GameArea.create(
          :name => "云南区",
          :game_id => 52)
GameServer.create(
          :name => "香格里拉",
          :game_id => 52,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "彩云之南",
          :game_id => 52,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "蝴蝶泉",
          :game_id => 52,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "金马碧鸡",
          :game_id => 52,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "虎跳峡",
          :game_id => 52,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "玉龙雪山",
          :game_id => 52,
          :area_id => gamearea6.id)
GameServer.create(
          :name => "西双版纳",
          :game_id => 52,
          :area_id => gamearea6.id)
gamearea7 = GameArea.create(
          :name => "贵州区",
          :game_id => 52)
GameServer.create(
          :name => "红枫湖",
          :game_id => 52,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "黄果树",
          :game_id => 52,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "织金洞",
          :game_id => 52,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "青龙洞",
          :game_id => 52,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "梵净山",
          :game_id => 52,
          :area_id => gamearea7.id)
GameServer.create(
          :name => "甲秀楼",
          :game_id => 52,
          :area_id => gamearea7.id)
gamearea8 = GameArea.create(
          :name => "广西一区",
          :game_id => 52)
GameServer.create(
          :name => "杨美古镇",
          :game_id => 52,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "通灵峡",
          :game_id => 52,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "真武阁",
          :game_id => 52,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "明秀园",
          :game_id => 52,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "青秀山",
          :game_id => 52,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "云天宫",
          :game_id => 52,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "友谊关",
          :game_id => 52,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "都桥山",
          :game_id => 52,
          :area_id => gamearea8.id)
GameServer.create(
          :name => "良凤江",
          :game_id => 52,
          :area_id => gamearea8.id)
gamearea9 = GameArea.create(
          :name => "广西2区",
          :game_id => 52)
GameServer.create(
          :name => "还珠洞",
          :game_id => 52,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "桃花江",
          :game_id => 52,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "阳朔西街",
          :game_id => 52,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "八角寨",
          :game_id => 52,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "黄姚古镇",
          :game_id => 52,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "雀儿山",
          :game_id => 52,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "鱼峰山",
          :game_id => 52,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "叠彩山",
          :game_id => 52,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "临贺故城",
          :game_id => 52,
          :area_id => gamearea9.id)
GameServer.create(
          :name => "遇龙河",
          :game_id => 52,
          :area_id => gamearea9.id)
gamearea10 = GameArea.create(
          :name => "河北1区",
          :game_id => 52)
GameServer.create(
          :name => "轩辕城",
          :game_id => 52,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "保定府",
          :game_id => 52,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "缘聚唐城",
          :game_id => 52,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "沧州府",
          :game_id => 52,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "渤海明珠",
          :game_id => 52,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "清远楼",
          :game_id => 52,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "黄骅港",
          :game_id => 52,
          :area_id => gamearea10.id)
GameServer.create(
          :name => "大慈阁",
          :game_id => 52,
          :area_id => gamearea10.id)
gamearea11 = GameArea.create(
          :name => "河北2区",
          :game_id => 52)
GameServer.create(
          :name => "",
          :game_id => 52,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "燕塞湖",
          :game_id => 52,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "山海关",
          :game_id => 52,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "北戴河",
          :game_id => 52,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "燕赵情缘",
          :game_id => 52,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "燕赵风云",
          :game_id => 52,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "菩提岛",
          :game_id => 52,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "老龙头",
          :game_id => 52,
          :area_id => gamearea11.id)
GameServer.create(
          :name => "月坨岛",
          :game_id => 52,
          :area_id => gamearea11.id)
gamearea12 = GameArea.create(
          :name => "河北3区",
          :game_id => 52)
GameServer.create(
          :name => "娲皇宫",
          :game_id => 52,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "赵州桥",
          :game_id => 52,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "避暑山庄",
          :game_id => 52,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "西柏坡",
          :game_id => 52,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "赵王城",
          :game_id => 52,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "大名府",
          :game_id => 52,
          :area_id => gamearea12.id)
GameServer.create(
          :name => "伏羲台",
          :game_id => 52,
          :area_id => gamearea12.id)
gamearea13 = GameArea.create(
          :name => "河南1区",
          :game_id => 52)
GameServer.create(
          :name => "小商桥",
          :game_id => 52,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "上河园",
          :game_id => 52,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "开封府",
          :game_id => 52,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "缥缈峰",
          :game_id => 52,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "少林寺",
          :game_id => 52,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "中岳嵩山",
          :game_id => 52,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "朝歌城",
          :game_id => 52,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "汴梁城",
          :game_id => 52,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "陈桥驿",
          :game_id => 52,
          :area_id => gamearea13.id)
GameServer.create(
          :name => "朱仙镇",
          :game_id => 52,
          :area_id => gamearea13.id)
gamearea14 = GameArea.create(
          :name => "河南2区",
          :game_id => 52)
GameServer.create(
          :name => "万里湖",
          :game_id => 52,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "牡丹亭",
          :game_id => 52,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "少室山",
          :game_id => 52,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "龙门石窟",
          :game_id => 52,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "云台山",
          :game_id => 52,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "王屋山",
          :game_id => 52,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "安阳殷墟",
          :game_id => 52,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "白马寺",
          :game_id => 52,
          :area_id => gamearea14.id)
GameServer.create(
          :name => "九里沟",
          :game_id => 52,
          :area_id => gamearea14.id)
gamearea15 = GameArea.create(
          :name => "河南3区",
          :game_id => 52)
GameServer.create(
          :name => "商丘古城",
          :game_id => 52,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "卧龙岗",
          :game_id => 52,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "南阳府",
          :game_id => 52,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "武侯祠",
          :game_id => 52,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "春秋楼",
          :game_id => 52,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "龙潭沟",
          :game_id => 52,
          :area_id => gamearea15.id)
GameServer.create(
          :name => "应天书院",
          :game_id => 52,
          :area_id => gamearea15.id)
gamearea16 = GameArea.create(
          :name => "湖北1区",
          :game_id => 52)
GameServer.create(
          :name => "武当山",
          :game_id => 52,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "襄阳城",
          :game_id => 52,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "昭君台",
          :game_id => 52,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "古隆中",
          :game_id => 52,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "坛子岭",
          :game_id => 52,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "华容故道",
          :game_id => 52,
          :area_id => gamearea16.id)
GameServer.create(
          :name => "鱼梁洲",
          :game_id => 52,
          :area_id => gamearea16.id)
gamearea17 = GameArea.create(
          :name => "湖北2区",
          :game_id => 52)
GameServer.create(
          :name => "古琴台",
          :game_id => 52,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "行吟阁",
          :game_id => 52,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "盘龙城",
          :game_id => 52,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "望江亭",
          :game_id => 52,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "黄鹤楼",
          :game_id => 52,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "晴川阁",
          :game_id => 52,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "大别山",
          :game_id => 52,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "荆州古城",
          :game_id => 52,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "赤壁古城",
          :game_id => 52,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "神农架",
          :game_id => 52,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "桃花冲",
          :game_id => 52,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "龙门河",
          :game_id => 52,
          :area_id => gamearea17.id)
GameServer.create(
          :name => "珞珈山",
          :game_id => 52,
          :area_id => gamearea17.id)
gamearea18 = GameArea.create(
          :name => "湖南区",
          :game_id => 52)
GameServer.create(
          :name => "浏阳河",
          :game_id => 52,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "橘子洲",
          :game_id => 52,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "岳阳楼",
          :game_id => 52,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "南岳衡山",
          :game_id => 52,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "洞庭湖",
          :game_id => 52,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "凤凰古镇",
          :game_id => 52,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "韶山冲",
          :game_id => 52,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "天心阁",
          :game_id => 52,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "回雁峰",
          :game_id => 52,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "爱晚亭",
          :game_id => 52,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "南屏山",
          :game_id => 52,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "空灵岸",
          :game_id => 52,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "奇梁洞",
          :game_id => 52,
          :area_id => gamearea18.id)
GameServer.create(
          :name => "武陵源",
          :game_id => 52,
          :area_id => gamearea18.id)
gamearea19 = GameArea.create(
          :name => "江苏1区",
          :game_id => 52)
GameServer.create(
          :name => "二十四桥",
          :game_id => 52,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "文昌阁",
          :game_id => 52,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "五亭桥",
          :game_id => 52,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "瘦西湖",
          :game_id => 52,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "雨花台",
          :game_id => 52,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "户部山",
          :game_id => 52,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "栖霞山",
          :game_id => 52,
          :area_id => gamearea19.id)
GameServer.create(
          :name => "戏马台",
          :game_id => 52,
          :area_id => gamearea19.id)
gamearea20 = GameArea.create(
          :name => "江苏2区",
          :game_id => 52)
GameServer.create(
          :name => "紫金山",
          :game_id => 52,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "玄武湖",
          :game_id => 52,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "十里秦淮",
          :game_id => 52,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "夫子庙",
          :game_id => 52,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "虎丘山",
          :game_id => 52,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "姑苏城",
          :game_id => 52,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "北固山",
          :game_id => 52,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "沧浪亭",
          :game_id => 52,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "宝华山",
          :game_id => 52,
          :area_id => gamearea20.id)
GameServer.create(
          :name => "狮子林",
          :game_id => 52,
          :area_id => gamearea20.id)
gamearea21 = GameArea.create(
          :name => "江苏3区",
          :game_id => 52)
GameServer.create(
          :name => "烟雨楼",
          :game_id => 52,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "云龙湖",
          :game_id => 52,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "水帘洞",
          :game_id => 52,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "花果山",
          :game_id => 52,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "锦屏山",
          :game_id => 52,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "洪泽湖",
          :game_id => 52,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "家悦园",
          :game_id => 52,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "镇淮楼",
          :game_id => 52,
          :area_id => gamearea21.id)
GameServer.create(
          :name => "枫树湾",
          :game_id => 52,
          :area_id => gamearea21.id)
gamearea22 = GameArea.create(
          :name => "安徽1区",
          :game_id => 52)
GameServer.create(
          :name => "逍遥津",
          :game_id => 52,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "采石矶",
          :game_id => 52,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "花戏楼",
          :game_id => 52,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "紫蓬山",
          :game_id => 52,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "禹王宫",
          :game_id => 52,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "汴河洞",
          :game_id => 52,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "雨山湖",
          :game_id => 52,
          :area_id => gamearea22.id)
GameServer.create(
          :name => "岱山湖",
          :game_id => 52,
          :area_id => gamearea22.id)
gamearea23 = GameArea.create(
          :name => "安徽2区",
          :game_id => 52)
GameServer.create(
          :name => "慈光阁",
          :game_id => 52,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "莲花峰",
          :game_id => 52,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "九华山",
          :game_id => 52,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "天门山",
          :game_id => 52,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "马仁山",
          :game_id => 52,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "醉翁亭",
          :game_id => 52,
          :area_id => gamearea23.id)
GameServer.create(
          :name => "屯溪老街",
          :game_id => 52,
          :area_id => gamearea23.id)
gamearea24 = GameArea.create(
          :name => "江西区",
          :game_id => 52)
GameServer.create(
          :name => "仙女湖",
          :game_id => 52,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "状元洲",
          :game_id => 52,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "景德镇",
          :game_id => 52,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "庐山胜境",
          :game_id => 52,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "浔阳楼",
          :game_id => 52,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "孔目江",
          :game_id => 52,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "云居山",
          :game_id => 52,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "绳金塔",
          :game_id => 52,
          :area_id => gamearea24.id)
GameServer.create(
          :name => "烟水亭",
          :game_id => 52,
          :area_id => gamearea24.id)
gamearea25 = GameArea.create(
          :name => "福建1区",
          :game_id => 52)
GameServer.create(
          :name => "八闽游",
          :game_id => 52,
          :area_id => gamearea25.id)
GameServer.create(
          :name => "仙人渡",
          :game_id => 52,
          :area_id => gamearea25.id)
GameServer.create(
          :name => "朱子坊",
          :game_id => 52,
          :area_id => gamearea25.id)
GameServer.create(
          :name => "紫帽山",
          :game_id => 52,
          :area_id => gamearea25.id)
GameServer.create(
          :name => "东山屿",
          :game_id => 52,
          :area_id => gamearea25.id)
GameServer.create(
          :name => "铜山古城",
          :game_id => 52,
          :area_id => gamearea25.id)
GameServer.create(
          :name => "涌泉寺",
          :game_id => 52,
          :area_id => gamearea25.id)
gamearea26 = GameArea.create(
          :name => "福建2区",
          :game_id => 52)
GameServer.create(
          :name => "日光岩",
          :game_id => 52,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "鼓浪屿",
          :game_id => 52,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "白鹭洲",
          :game_id => 52,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "清源山",
          :game_id => 52,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "武夷山",
          :game_id => 52,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "湄洲岛",
          :game_id => 52,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "百花村",
          :game_id => 52,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "齐云楼",
          :game_id => 52,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "崇武古镇",
          :game_id => 52,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "冠豸山",
          :game_id => 52,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "皓月园",
          :game_id => 52,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "龙崆洞",
          :game_id => 52,
          :area_id => gamearea26.id)
GameServer.create(
          :name => "长汀城",
          :game_id => 52,
          :area_id => gamearea26.id)
gamearea27 = GameArea.create(
          :name => "深圳1区",
          :game_id => 52)
GameServer.create(
          :name => "石岩湖",
          :game_id => 52,
          :area_id => gamearea27.id)
GameServer.create(
          :name => "香蜜湖",
          :game_id => 52,
          :area_id => gamearea27.id)
GameServer.create(
          :name => "金沙湾",
          :game_id => 52,
          :area_id => gamearea27.id)
GameServer.create(
          :name => "大观园",
          :game_id => 52,
          :area_id => gamearea27.id)
GameServer.create(
          :name => "莲花山",
          :game_id => 52,
          :area_id => gamearea27.id)
GameServer.create(
          :name => "园博园",
          :game_id => 52,
          :area_id => gamearea27.id)
GameServer.create(
          :name => "沙头角",
          :game_id => 52,
          :area_id => gamearea27.id)
GameServer.create(
          :name => "华侨城",
          :game_id => 52,
          :area_id => gamearea27.id)
GameServer.create(
          :name => "龙岗龙园",
          :game_id => 52,
          :area_id => gamearea27.id)
GameServer.create(
          :name => "深圳湾",
          :game_id => 52,
          :area_id => gamearea27.id)
gamearea28 = GameArea.create(
          :name => "深圳2区",
          :game_id => 52)
GameServer.create(
          :name => "梧桐山",
          :game_id => 52,
          :area_id => gamearea28.id)
GameServer.create(
          :name => "欢乐谷",
          :game_id => 52,
          :area_id => gamearea28.id)
GameServer.create(
          :name => "世界之窗",
          :game_id => 52,
          :area_id => gamearea28.id)
GameServer.create(
          :name => "锦绣中华",
          :game_id => 52,
          :area_id => gamearea28.id)
GameServer.create(
          :name => "大梅沙",
          :game_id => 52,
          :area_id => gamearea28.id)
GameServer.create(
          :name => "小梅沙",
          :game_id => 52,
          :area_id => gamearea28.id)
GameServer.create(
          :name => "民俗村",
          :game_id => 52,
          :area_id => gamearea28.id)
GameServer.create(
          :name => "大鹏湾",
          :game_id => 52,
          :area_id => gamearea28.id)
GameServer.create(
          :name => "海上田园",
          :game_id => 52,
          :area_id => gamearea28.id)
GameServer.create(
          :name => "未来时代",
          :game_id => 52,
          :area_id => gamearea28.id)
GameServer.create(
          :name => "西丽湖",
          :game_id => 52,
          :area_id => gamearea28.id)
gamearea29 = GameArea.create(
          :name => "浙江1区",
          :game_id => 52)
GameServer.create(
          :name => "烟雨南湖",
          :game_id => 52,
          :area_id => gamearea29.id)
GameServer.create(
          :name => "梅雨潭",
          :game_id => 52,
          :area_id => gamearea29.id)
GameServer.create(
          :name => "三潭印月",
          :game_id => 52,
          :area_id => gamearea29.id)
GameServer.create(
          :name => "台州湾",
          :game_id => 52,
          :area_id => gamearea29.id)
GameServer.create(
          :name => "大鹿岛",
          :game_id => 52,
          :area_id => gamearea29.id)
GameServer.create(
          :name => "西栅老街",
          :game_id => 52,
          :area_id => gamearea29.id)
GameServer.create(
          :name => "海门老街",
          :game_id => 52,
          :area_id => gamearea29.id)
GameServer.create(
          :name => "飞云湖",
          :game_id => 52,
          :area_id => gamearea29.id)
gamearea30 = GameArea.create(
          :name => "浙江2区",
          :game_id => 52)
GameServer.create(
          :name => "飞来峰",
          :game_id => 52,
          :area_id => gamearea30.id)
GameServer.create(
          :name => "苏提春晓",
          :game_id => 52,
          :area_id => gamearea30.id)
GameServer.create(
          :name => "雷峰塔",
          :game_id => 52,
          :area_id => gamearea30.id)
GameServer.create(
          :name => "六和塔",
          :game_id => 52,
          :area_id => gamearea30.id)
GameServer.create(
          :name => "灵隐寺",
          :game_id => 52,
          :area_id => gamearea30.id)
GameServer.create(
          :name => "西子湖",
          :game_id => 52,
          :area_id => gamearea30.id)
GameServer.create(
          :name => "天台山",
          :game_id => 52,
          :area_id => gamearea30.id)
GameServer.create(
          :name => "映月湖",
          :game_id => 52,
          :area_id => gamearea30.id)
GameServer.create(
          :name => "白沙堤",
          :game_id => 52,
          :area_id => gamearea30.id)
GameServer.create(
          :name => "双溪竹海",
          :game_id => 52,
          :area_id => gamearea30.id)
gamearea31 = GameArea.create(
          :name => "浙江3区",
          :game_id => 52)
GameServer.create(
          :name => "长屿硐天",
          :game_id => 52,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "双龙洞",
          :game_id => 52,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "普陀山",
          :game_id => 52,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "神仙居",
          :game_id => 52,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "紫竹林",
          :game_id => 52,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "千岛湖",
          :game_id => 52,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "桃花岛",
          :game_id => 52,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "河姆渡",
          :game_id => 52,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "钱塘江",
          :game_id => 52,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "天一阁",
          :game_id => 52,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "三门湾",
          :game_id => 52,
          :area_id => gamearea31.id)
GameServer.create(
          :name => "天封塔",
          :game_id => 52,
          :area_id => gamearea31.id)
gamearea32 = GameArea.create(
          :name => "浙江4区",
          :game_id => 52)
GameServer.create(
          :name => "雁荡山",
          :game_id => 52,
          :area_id => gamearea32.id)
GameServer.create(
          :name => "百草园",
          :game_id => 52,
          :area_id => gamearea32.id)
GameServer.create(
          :name => "绍兴兰亭",
          :game_id => 52,
          :area_id => gamearea32.id)
GameServer.create(
          :name => "楠溪江",
          :game_id => 52,
          :area_id => gamearea32.id)
GameServer.create(
          :name => "物华天宝",
          :game_id => 52,
          :area_id => gamearea32.id)
GameServer.create(
          :name => "越王台",
          :game_id => 52,
          :area_id => gamearea32.id)
GameServer.create(
          :name => "绍兴鉴湖",
          :game_id => 52,
          :area_id => gamearea32.id)
GameServer.create(
          :name => "东钱湖",
          :game_id => 52,
          :area_id => gamearea32.id)
GameServer.create(
          :name => "松兰山",
          :game_id => 52,
          :area_id => gamearea32.id)
GameServer.create(
          :name => "雪窦山",
          :game_id => 52,
          :area_id => gamearea32.id)
gamearea33 = GameArea.create(
          :name => "广东1区",
          :game_id => 52)
GameServer.create(
          :name => "梅西坊",
          :game_id => 52,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "九州岛",
          :game_id => 52,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "清晖园",
          :game_id => 52,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "石景山",
          :game_id => 52,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "湖光岩",
          :game_id => 52,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "龙山宫",
          :game_id => 52,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "西樵山",
          :game_id => 52,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "碧海银沙",
          :game_id => 52,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "南粤风采",
          :game_id => 52,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "南国风情",
          :game_id => 52,
          :area_id => gamearea33.id)
GameServer.create(
          :name => "翠亨村",
          :game_id => 52,
          :area_id => gamearea33.id)
gamearea34 = GameArea.create(
          :name => "广东2区",
          :game_id => 52)
GameServer.create(
          :name => "桑普山",
          :game_id => 52,
          :area_id => gamearea34.id)
GameServer.create(
          :name => "南澳岛",
          :game_id => 52,
          :area_id => gamearea34.id)
GameServer.create(
          :name => "进贤门",
          :game_id => 52,
          :area_id => gamearea34.id)
GameServer.create(
          :name => "万绿湖",
          :game_id => 52,
          :area_id => gamearea34.id)
GameServer.create(
          :name => "南昆山",
          :game_id => 52,
          :area_id => gamearea34.id)
GameServer.create(
          :name => "鼎湖山",
          :game_id => 52,
          :area_id => gamearea34.id)
GameServer.create(
          :name => "七星岩",
          :game_id => 52,
          :area_id => gamearea34.id)
GameServer.create(
          :name => "越秀山",
          :game_id => 52,
          :area_id => gamearea34.id)
GameServer.create(
          :name => "镇海楼",
          :game_id => 52,
          :area_id => gamearea34.id)
GameServer.create(
          :name => "锦绣园",
          :game_id => 52,
          :area_id => gamearea34.id)
GameServer.create(
          :name => "如意岛",
          :game_id => 52,
          :area_id => gamearea34.id)
GameServer.create(
          :name => "云髻山",
          :game_id => 52,
          :area_id => gamearea34.id)
GameServer.create(
          :name => "盘龙峡",
          :game_id => 52,
          :area_id => gamearea34.id)
gamearea35 = GameArea.create(
          :name => "广东3区",
          :game_id => 52)
GameServer.create(
          :name => "罗浮山",
          :game_id => 52,
          :area_id => gamearea35.id)
GameServer.create(
          :name => "丹霞山",
          :game_id => 52,
          :area_id => gamearea35.id)
GameServer.create(
          :name => "海陵岛",
          :game_id => 52,
          :area_id => gamearea35.id)
GameServer.create(
          :name => "虎门大桥",
          :game_id => 52,
          :area_id => gamearea35.id)
GameServer.create(
          :name => "碧海金楼",
          :game_id => 52,
          :area_id => gamearea35.id)
GameServer.create(
          :name => "大角湾",
          :game_id => 52,
          :area_id => gamearea35.id)
gamearea36 = GameArea.create(
          :name => "广东4区",
          :game_id => 52)
GameServer.create(
          :name => "流花湖",
          :game_id => 52,
          :area_id => gamearea36.id)
GameServer.create(
          :name => "白云山",
          :game_id => 52,
          :area_id => gamearea36.id)
GameServer.create(
          :name => "状元坊",
          :game_id => 52,
          :area_id => gamearea36.id)
GameServer.create(
          :name => "黄花岗",
          :game_id => 52,
          :area_id => gamearea36.id)
GameServer.create(
          :name => "宝墨岩",
          :game_id => 52,
          :area_id => gamearea36.id)
GameServer.create(
          :name => "流溪河",
          :game_id => 52,
          :area_id => gamearea36.id)
GameServer.create(
          :name => "三百洞",
          :game_id => 52,
          :area_id => gamearea36.id)
GameServer.create(
          :name => "佛山梁园",
          :game_id => 52,
          :area_id => gamearea36.id)
GameServer.create(
          :name => "陈家祠",
          :game_id => 52,
          :area_id => gamearea36.id)
GameServer.create(
          :name => "二沙岛",
          :game_id => 52,
          :area_id => gamearea36.id)
gamearea37 = GameArea.create(
          :name => "北京1区",
          :game_id => 52)
GameServer.create(
          :name => "观象台",
          :game_id => 52,
          :area_id => gamearea37.id)
GameServer.create(
          :name => "圆明园",
          :game_id => 52,
          :area_id => gamearea37.id)
GameServer.create(
          :name => "北京天坛",
          :game_id => 52,
          :area_id => gamearea37.id)
GameServer.create(
          :name => "国子监",
          :game_id => 52,
          :area_id => gamearea37.id)
GameServer.create(
          :name => "王府井",
          :game_id => 52,
          :area_id => gamearea37.id)
GameServer.create(
          :name => "吉祥谷",
          :game_id => 52,
          :area_id => gamearea37.id)
GameServer.create(
          :name => "太和殿",
          :game_id => 52,
          :area_id => gamearea37.id)
GameServer.create(
          :name => "颐和园",
          :game_id => 52,
          :area_id => gamearea37.id)
GameServer.create(
          :name => "紫禁城",
          :game_id => 52,
          :area_id => gamearea37.id)
GameServer.create(
          :name => "凤凰岭",
          :game_id => 52,
          :area_id => gamearea37.id)
GameServer.create(
          :name => "2008",
          :game_id => 52,
          :area_id => gamearea37.id)
GameServer.create(
          :name => "生日快乐",
          :game_id => 52,
          :area_id => gamearea37.id)
gamearea38 = GameArea.create(
          :name => "北京2区",
          :game_id => 52)
GameServer.create(
          :name => "正阳门",
          :game_id => 52,
          :area_id => gamearea38.id)
GameServer.create(
          :name => "飞龙岭",
          :game_id => 52,
          :area_id => gamearea38.id)
GameServer.create(
          :name => "八达岭",
          :game_id => 52,
          :area_id => gamearea38.id)
GameServer.create(
          :name => "华夏",
          :game_id => 52,
          :area_id => gamearea38.id)
GameServer.create(
          :name => "阳光城",
          :game_id => 52,
          :area_id => gamearea38.id)
gamearea39 = GameArea.create(
          :name => "上海1区",
          :game_id => 52)
GameServer.create(
          :name => "天马山",
          :game_id => 52,
          :area_id => gamearea39.id)
GameServer.create(
          :name => "上海老街",
          :game_id => 52,
          :area_id => gamearea39.id)
GameServer.create(
          :name => "晚芳亭",
          :game_id => 52,
          :area_id => gamearea39.id)
GameServer.create(
          :name => "玉玲珑",
          :game_id => 52,
          :area_id => gamearea39.id)
GameServer.create(
          :name => "城隍庙",
          :game_id => 52,
          :area_id => gamearea39.id)
GameServer.create(
          :name => "天福楼",
          :game_id => 52,
          :area_id => gamearea39.id)
GameServer.create(
          :name => "宝光塔",
          :game_id => 52,
          :area_id => gamearea39.id)
GameServer.create(
          :name => "飘香榭",
          :game_id => 52,
          :area_id => gamearea39.id)
GameServer.create(
          :name => "珍宝阁",
          :game_id => 52,
          :area_id => gamearea39.id)
GameServer.create(
          :name => "沉香阁",
          :game_id => 52,
          :area_id => gamearea39.id)
GameServer.create(
          :name => "景云里",
          :game_id => 52,
          :area_id => gamearea39.id)
GameServer.create(
          :name => "上海豫园",
          :game_id => 52,
          :area_id => gamearea39.id)
GameServer.create(
          :name => "陆家嘴",
          :game_id => 52,
          :area_id => gamearea39.id)
gamearea40 = GameArea.create(
          :name => "上海2区",
          :game_id => 52)
GameServer.create(
          :name => "崇明岛",
          :game_id => 52,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "黄浦江",
          :game_id => 52,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "东方明珠",
          :game_id => 52,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "汇龙潭",
          :game_id => 52,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "上海滩",
          :game_id => 52,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "醉白池",
          :game_id => 52,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "古漪园",
          :game_id => 52,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "大境阁",
          :game_id => 52,
          :area_id => gamearea40.id)
GameServer.create(
          :name => "静安寺",
          :game_id => 52,
          :area_id => gamearea40.id)
gamearea41 = GameArea.create(
          :name => "重庆区",
          :game_id => 52)
GameServer.create(
          :name => "宝顶山",
          :game_id => 52,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "朝天门",
          :game_id => 52,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "解放碑",
          :game_id => 52,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "海棠溪",
          :game_id => 52,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "金刀峡",
          :game_id => 52,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "红岩村",
          :game_id => 52,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "铜鼓滩",
          :game_id => 52,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "缙云山",
          :game_id => 52,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "茶山竹海",
          :game_id => 52,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "青龙溪",
          :game_id => 52,
          :area_id => gamearea41.id)
GameServer.create(
          :name => "龙潭古镇",
          :game_id => 52,
          :area_id => gamearea41.id)
gamearea42 = GameArea.create(
          :name => "黑龙江区",
          :game_id => 52)
GameServer.create(
          :name => "连环湖",
          :game_id => 52,
          :area_id => gamearea42.id)
GameServer.create(
          :name => "雪域天龙",
          :game_id => 52,
          :area_id => gamearea42.id)
GameServer.create(
          :name => "松花江",
          :game_id => 52,
          :area_id => gamearea42.id)
GameServer.create(
          :name => "牡丹江",
          :game_id => 52,
          :area_id => gamearea42.id)
GameServer.create(
          :name => "中央大街",
          :game_id => 52,
          :area_id => gamearea42.id)
gamearea43 = GameArea.create(
          :name => "吉林区",
          :game_id => 52)
GameServer.create(
          :name => "长白山",
          :game_id => 52,
          :area_id => gamearea43.id)
GameServer.create(
          :name => "净月潭",
          :game_id => 52,
          :area_id => gamearea43.id)
GameServer.create(
          :name => "佟佳江",
          :game_id => 52,
          :area_id => gamearea43.id)
GameServer.create(
          :name => "拉法山",
          :game_id => 52,
          :area_id => gamearea43.id)
GameServer.create(
          :name => "三角龙湾",
          :game_id => 52,
          :area_id => gamearea43.id)
GameServer.create(
          :name => "龙潭山",
          :game_id => 52,
          :area_id => gamearea43.id)
gamearea44 = GameArea.create(
          :name => "辽宁1区",
          :game_id => 52)
GameServer.create(
          :name => "星海湾",
          :game_id => 52,
          :area_id => gamearea44.id)
GameServer.create(
          :name => "棋盘山",
          :game_id => 52,
          :area_id => gamearea44.id)
GameServer.create(
          :name => "五龙山",
          :game_id => 52,
          :area_id => gamearea44.id)
GameServer.create(
          :name => "沈阳故宫",
          :game_id => 52,
          :area_id => gamearea44.id)
GameServer.create(
          :name => "天桥沟",
          :game_id => 52,
          :area_id => gamearea44.id)
GameServer.create(
          :name => "秀月锋",
          :game_id => 52,
          :area_id => gamearea44.id)
GameServer.create(
          :name => "永安桥",
          :game_id => 52,
          :area_id => gamearea44.id)
gamearea45 = GameArea.create(
          :name => "辽宁2区",
          :game_id => 52)
GameServer.create(
          :name => "葫芦岛",
          :game_id => 52,
          :area_id => gamearea45.id)
GameServer.create(
          :name => "红海滩",
          :game_id => 52,
          :area_id => gamearea45.id)
GameServer.create(
          :name => "医巫闾山",
          :game_id => 52,
          :area_id => gamearea45.id)
GameServer.create(
          :name => "太子河",
          :game_id => 52,
          :area_id => gamearea45.id)
GameServer.create(
          :name => "玉佛苑",
          :game_id => 52,
          :area_id => gamearea45.id)
GameServer.create(
          :name => "兴城古城",
          :game_id => 52,
          :area_id => gamearea45.id)
gamearea46 = GameArea.create(
          :name => "山东1区",
          :game_id => 52)
GameServer.create(
          :name => "景阳冈",
          :game_id => 52,
          :area_id => gamearea46.id)
GameServer.create(
          :name => "东岳泰山",
          :game_id => 52,
          :area_id => gamearea46.id)
GameServer.create(
          :name => "青岛湾",
          :game_id => 52,
          :area_id => gamearea46.id)
GameServer.create(
          :name => "南天门",
          :game_id => 52,
          :area_id => gamearea46.id)
GameServer.create(
          :name => "锦绣川",
          :game_id => 52,
          :area_id => gamearea46.id)
GameServer.create(
          :name => "海源阁",
          :game_id => 52,
          :area_id => gamearea46.id)
GameServer.create(
          :name => "岱宗坊",
          :game_id => 52,
          :area_id => gamearea46.id)
gamearea47 = GameArea.create(
          :name => "山东2区",
          :game_id => 52)
GameServer.create(
          :name => "锦秋湖",
          :game_id => 52,
          :area_id => gamearea47.id)
GameServer.create(
          :name => "忠义堂",
          :game_id => 52,
          :area_id => gamearea47.id)
GameServer.create(
          :name => "黑风口",
          :game_id => 52,
          :area_id => gamearea47.id)
GameServer.create(
          :name => "水波梁山",
          :game_id => 52,
          :area_id => gamearea47.id)
GameServer.create(
          :name => "太清宫",
          :game_id => 52,
          :area_id => gamearea47.id)
GameServer.create(
          :name => "崂山仙境",
          :game_id => 52,
          :area_id => gamearea47.id)
GameServer.create(
          :name => "白沙河",
          :game_id => 52,
          :area_id => gamearea47.id)
GameServer.create(
          :name => "八大关",
          :game_id => 52,
          :area_id => gamearea47.id)
GameServer.create(
          :name => "花石楼",
          :game_id => 52,
          :area_id => gamearea47.id)
gamearea48 = GameArea.create(
          :name => "山东3区",
          :game_id => 52)
GameServer.create(
          :name => "蓬莱岛",
          :game_id => 52,
          :area_id => gamearea48.id)
GameServer.create(
          :name => "长山岛",
          :game_id => 52,
          :area_id => gamearea48.id)
GameServer.create(
          :name => "刘公岛",
          :game_id => 52,
          :area_id => gamearea48.id)
GameServer.create(
          :name => "环翠楼",
          :game_id => 52,
          :area_id => gamearea48.id)
GameServer.create(
          :name => "青云山",
          :game_id => 52,
          :area_id => gamearea48.id)
GameServer.create(
          :name => "老龙湾",
          :game_id => 52,
          :area_id => gamearea48.id)
GameServer.create(
          :name => "金沙滩",
          :game_id => 52,
          :area_id => gamearea48.id)
GameServer.create(
          :name => "芝罘岛",
          :game_id => 52,
          :area_id => gamearea48.id)
GameServer.create(
          :name => "昆嵛山",
          :game_id => 52,
          :area_id => gamearea48.id)
GameServer.create(
          :name => "宝塔礁",
          :game_id => 52,
          :area_id => gamearea48.id)
gamearea49 = GameArea.create(
          :name => "山东4区",
          :game_id => 52)
GameServer.create(
          :name => "羲之故里",
          :game_id => 52,
          :area_id => gamearea49.id)
GameServer.create(
          :name => "大明湖",
          :game_id => 52,
          :area_id => gamearea49.id)
GameServer.create(
          :name => "千佛山",
          :game_id => 52,
          :area_id => gamearea49.id)
GameServer.create(
          :name => "趵突泉",
          :game_id => 52,
          :area_id => gamearea49.id)
GameServer.create(
          :name => "五龙潭",
          :game_id => 52,
          :area_id => gamearea49.id)
GameServer.create(
          :name => "沂州府",
          :game_id => 52,
          :area_id => gamearea49.id)
GameServer.create(
          :name => "红叶谷",
          :game_id => 52,
          :area_id => gamearea49.id)
GameServer.create(
          :name => "沂水雪山",
          :game_id => 52,
          :area_id => gamearea49.id)
gamearea50 = GameArea.create(
          :name => "山东5区",
          :game_id => 52)
GameServer.create(
          :name => "万平口",
          :game_id => 52,
          :area_id => gamearea50.id)
GameServer.create(
          :name => "东蒙山",
          :game_id => 52,
          :area_id => gamearea50.id)
GameServer.create(
          :name => "玉皇顶",
          :game_id => 52,
          :area_id => gamearea50.id)
GameServer.create(
          :name => "灵岩山",
          :game_id => 52,
          :area_id => gamearea50.id)
GameServer.create(
          :name => "微山湖",
          :game_id => 52,
          :area_id => gamearea50.id)
GameServer.create(
          :name => "曲阜孔庙",
          :game_id => 52,
          :area_id => gamearea50.id)
GameServer.create(
          :name => "台儿庄",
          :game_id => 52,
          :area_id => gamearea50.id)
GameServer.create(
          :name => "百花园",
          :game_id => 52,
          :area_id => gamearea50.id)
gamearea51 = GameArea.create(
          :name => "西北区",
          :game_id => 52)
GameServer.create(
          :name => "嘉峪关",
          :game_id => 52,
          :area_id => gamearea51.id)
GameServer.create(
          :name => "火焰山",
          :game_id => 52,
          :area_id => gamearea51.id)
GameServer.create(
          :name => "可可西里",
          :game_id => 52,
          :area_id => gamearea51.id)
GameServer.create(
          :name => "青海湖",
          :game_id => 52,
          :area_id => gamearea51.id)
gamearea52 = GameArea.create(
          :name => "华北区",
          :game_id => 52)
GameServer.create(
          :name => "凌云殿",
          :game_id => 52,
          :area_id => gamearea52.id)
GameServer.create(
          :name => "摘星台",
          :game_id => 52,
          :area_id => gamearea52.id)
GameServer.create(
          :name => "悬空寺",
          :game_id => 52,
          :area_id => gamearea52.id)
gamearea53 = GameArea.create(
          :name => "天津区",
          :game_id => 52)
GameServer.create(
          :name => "醉月城",
          :game_id => 52,
          :area_id => gamearea53.id)
GameServer.create(
          :name => "精武门",
          :game_id => 52,
          :area_id => gamearea53.id)
GameServer.create(
          :name => "天津卫",
          :game_id => 52,
          :area_id => gamearea53.id)
GameServer.create(
          :name => "卫津河",
          :game_id => 52,
          :area_id => gamearea53.id)
GameServer.create(
          :name => "天塔湖",
          :game_id => 52,
          :area_id => gamearea53.id)
GameServer.create(
          :name => "津门故里",
          :game_id => 52,
          :area_id => gamearea53.id)
GameServer.create(
          :name => "铃铛阁",
          :game_id => 52,
          :area_id => gamearea53.id)
GameServer.create(
          :name => "望海楼",
          :game_id => 52,
          :area_id => gamearea53.id)
GameServer.create(
          :name => "五大道",
          :game_id => 52,
          :area_id => gamearea53.id)
gamearea54 = GameArea.create(
          :name => "华南区",
          :game_id => 52)
GameServer.create(
          :name => "天上人间",
          :game_id => 52,
          :area_id => gamearea54.id)
GameServer.create(
          :name => "逍遥城",
          :game_id => 52,
          :area_id => gamearea54.id)
GameServer.create(
          :name => "忘忧谷",
          :game_id => 52,
          :area_id => gamearea54.id)
GameServer.create(
          :name => "千寻塔",
          :game_id => 52,
          :area_id => gamearea54.id)
GameServer.create(
          :name => "日月湾",
          :game_id => 52,
          :area_id => gamearea54.id)
GameServer.create(
          :name => "五指山",
          :game_id => 52,
          :area_id => gamearea54.id)
GameServer.create(
          :name => "大东海",
          :game_id => 52,
          :area_id => gamearea54.id)
gamearea55 = GameArea.create(
          :name => "海外专区",
          :game_id => 52)
GameServer.create(
          :name => "侠客岛",
          :game_id => 52,
          :area_id => gamearea55.id)
GameServer.create(
          :name => "仙踪林",
          :game_id => 52,
          :area_id => gamearea55.id)
gamearea56 = GameArea.create(
          :name => "追忆",
          :game_id => 52)
GameServer.create(
          :name => "地久天长",
          :game_id => 52,
          :area_id => gamearea56.id)
GameServer.create(
          :name => "梦回唐朝",
          :game_id => 52,
          :area_id => gamearea56.id)
GameServer.create(
          :name => "青山绿水",
          :game_id => 52,
          :area_id => gamearea56.id)
GameServer.create(
          :name => "再续前缘",
          :game_id => 52,
          :area_id => gamearea56.id)
GameServer.create(
          :name => "梦回望月",
          :game_id => 52,
          :area_id => gamearea56.id)
GameServer.create(
          :name => "梦回奔日",
          :game_id => 52,
          :area_id => gamearea56.id)
gamearea57 = GameArea.create(
          :name => "月光宝盒",
          :game_id => 52)
GameServer.create(
          :name => "缤纷岁月",
          :game_id => 52,
          :area_id => gamearea57.id)
GameServer.create(
          :name => "群英荟萃",
          :game_id => 52,
          :area_id => gamearea57.id)
GameServer.create(
          :name => "花样年华",
          :game_id => 52,
          :area_id => gamearea57.id)
GameServer.create(
          :name => "黄金时代",
          :game_id => 52,
          :area_id => gamearea57.id)
  end

  def self.down
  end
end
