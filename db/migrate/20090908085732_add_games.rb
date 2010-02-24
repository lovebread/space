class AddGames < ActiveRecord::Migration
  def self.up
    wow = Game.create(
        :name => "M-魔兽世界",
        :official_web => "http://www.warcraftchina.com/index.html",
        :sale_date => "2005-4-26",
        :company => "暴雪",
        :agent => "网易",
        :description => "欧美大型角色扮演游戏")
    wow.tag_list = "史诗, 奇幻, 时间收费, 即时战斗, 3D"
    wow.save
    yonghengzhita = Game.create(
        :name => "Y-永恒之塔",
        :official_web => "http://aion.sdo.com/web3/home/index.html",
        :sale_date => "2009-4-16",
        :company => "NCSOFT",
        :agent => "盛大在线",
        :description => "韩国大型角色扮演游戏")
    yonghengzhita.tag_list = "史诗, 奇幻, 时间收费, 即时战斗, 3D"
    yonghengzhita.save
game3 = Game.create(
      :name => "J-剑侠情缘2网络版（免费版）",
      :official_web => "http://jx2.xoyo.com/index2",
      :sale_date => "2005-9-28",
      :company => "金山西山居",
      :agent => "金山西山居",
      :no_races => true,
      :description => "国产大型角色扮演游戏")
      game3.tag_list = "热血, 武侠, 道具收费, 即时战斗, 2D"
      game3.save
game4 = Game.create(
      :name => "T-天堂2",
      :official_web => "http://www.lineage2.com.cn/",
      :sale_date => "2004-9-8",
      :company => "韩国Ncsoft",
      :agent => "新浪",
      :no_areas => true,
      :description => "韩国大型角色扮演游戏")
      game4.tag_list = "热血, 奇幻, 时间收费, 道具收费, 即时战斗, 2D"
      game4.save
game5 = Game.create(
      :name => "F-风火之旅",
      :official_web => "http://fj.9you.com/web_v3/index.html",
      :sale_date => "2007-12-19",
      :company => "北京林果",
      :agent => "久游网",
      :no_races => true,
      :description => "国产3D大型多人在线角色扮演游戏")
      game5.tag_list = "史诗, 奇幻, 时间收费, 道具收费, 即时战斗, 3D"
      game5.save
game6 = Game.create(
      :name => "Luna",
      :official_web => "http://www.lunajoy.com/main.html",
      :sale_date => "2009-6-12",
      :company => "EYA",
      :agent => "天游",
      :description => "粉可爱的Q版网游")
      game6.tag_list = "Q版, 奇幻, 道具收费, 即时战斗, 3D"
      game6.save
game7 = Game.create(
      :name => "J-剑侠情缘2网络版（收费版）",
      :official_web => "http://jx2.xoyo.com/index1",
      :sale_date => "2005-9-28",
      :company => "金山西山居",
      :agent => "金山西山居",
      :no_races => true,
      :description => "国产大型角色扮演游戏")
      game7.tag_list = "热血, 武侠, 时间收费, 即时战斗, 2D"
      game7.save
game8 = Game.create(
      :name => "C-传奇归来",
      :official_web => "http://mymir.sdo.com/web1/home/index.html",
      :sale_date => "2009-10-23",
      :company => "盛大在线",
      :agent => "盛大在线",
      :no_races => true,
      :description => "盛大开发传奇系列角色扮演游戏")
      game8.tag_list = "热血, 奇幻, 道具收费, 即时战斗, 2D"
      game8.save
game9 = Game.create(
      :name => "Q-千年3",
      :official_web => "http://1000y.sdo.com/web/home/index.asp",
      :sale_date => "2008-11-18",
      :company => "盛大在线",
      :agent => "盛大在线",
      :no_races => true,
      :description => "国产2D角色扮演游戏")
      game9.tag_list = "热血, 武侠, 时间收费, 道具收费, 即时战斗, 2D"
      game9.save
game10 = Game.create(
      :name => "J-剑侠情缘3",
      :official_web => "http://jx3.xoyo.com/",
      :sale_date => "2009-8-28",
      :company => "金山西山居",
      :agent => "金山西山居",
      :no_races => true,
      :description => "国产大型3D武侠角色扮演游戏")
      game10.tag_list = "史诗, 武侠, 时间收费, 即时战斗, 3D"
      game10.save
game11 = Game.create(
      :name => "C-超级舞者",
      :official_web => "http://sdo.9you.com/",
      :sale_date => "2005-12-1",
      :company => "久游网",
      :agent => "久游网",
      :no_areas => true,
      :no_races => true,
      :no_professions => true,
      :description => "国产音乐舞蹈休闲游戏")
      game11.tag_list = "轻松, 音乐, 道具收费, 舞蹈, 3D"
      game11.save
game12 = Game.create(
      :name => "Z-征服",
      :official_web => "http://zf.91.com/index/",
      :sale_date => "2003-4-16",
      :company => "天晴数码",
      :agent => "网龙",
      :no_races => true,
      :description => "国产2D武侠角色扮演游戏")
      game12.tag_list = "热血, 武侠, 道具收费, 即时战斗, 2D"
      game12.save
game13 = Game.create(
      :name => "T-吞食天地online",
      :official_web => "http://tsfree.online-game.com.cn/index.asp",
      :sale_date => "2004-9-16",
      :company => "龙图智库",
      :agent => "龙图智库",
      :no_areas => true,
      :no_races => true,
      :description => "2D回合制角色扮演游戏")
      game13.tag_list = "Q版, 武侠, 时间收费, 道具收费, 回合战斗, 2D"
      game13.save
game14 = Game.create(
      :name => "GT劲舞团2",
      :official_web => "http://jw2.9you.com/web_v2/index.html",
      :sale_date => "2009-05-20",
      :company => "久游网",
      :agent => "久游网",
      :no_races => true,
      :no_professions => true,
      :description => "音乐休闲游戏")
      game14.tag_list = "轻松, 音乐, 道具收费, 舞蹈, 3D"
      game14.save
game15 = Game.create(
      :name => "R-热舞派对2",
      :official_web => "http://rwpd.wanmei.com/",
      :sale_date => "2009-9-24",
      :company => "完美世界",
      :agent => "完美世界",
      :no_areas => true,
      :no_races => true,
      :no_professions => true,
      :description => "音乐休闲游戏")
      game15.tag_list ="轻松, 音乐, 道具收费, 舞蹈, 3D"
      game15.save
game16 = Game.create(
      :name => "J-街头篮球",
      :official_web => "http://www.fsjoy.com/",
      :sale_date => "2005-11-11",
      :company => "JC Entertainment",
      :agent => "天联世纪",
      :no_races => true,
      :description => "3D休闲篮球")
      game16.tag_list ="轻松, 运动, 道具收费, 篮球, 3D"
      game16.save
game17 = Game.create(
      :name => "S-神泣",
      :official_web => "http://shaiya.gtgame.com.cn/index.htm",
      :sale_date => "2006-11-20",
      :company => "韩国SONOKONG",
      :agent => "中华网游戏集团",
      :no_races => true,
      :description => "韩国3D角色扮演游戏")
      game17.tag_list = "史诗, 奇幻, 道具收费, 即时战斗, 3D"
      game17.save
game18 = Game.create(
      :name => "C-传奇世界",
      :official_web => "http://home.woool.sdo.com/home/homepage/default.html",
      :sale_date => "2003-7-1",
      :company => "盛大网络",
      :agent => "盛大网络",
      :no_races => true,
      :description => "2D角色扮演游戏")
      game18.tag_list = "热血, 奇幻, 道具收费, 即时战斗, 2D"
      game18.save
game19 = Game.create(
      :name => "R-热血传奇",
      :official_web => "http://mir2.sdo.com/web/index.html",
      :sale_date => "2001-9-28",
      :company => "维美德",
      :agent => "盛大网络",
      :no_races => true,
      :description => "2D经典角色扮演游戏")
      game19.tag_list = "热血, 奇幻, 道具收费, 即时战斗, 2D"
      game19.save
game20 = Game.create(
      :name => "Z-卓越之剑",
      :official_web => "http://ge.the9.com/",
      :sale_date => "2007-10-24",
      :company => "IMC Games",
      :agent => "第九城市",
      :no_races => true,
      :description => "大型3D角色扮演游戏")
      game20.tag_list = "热血, 奇幻, 时间收费, 道具收费, 即时战斗, 3D"
      game20.save
game21 = Game.create(
      :name => "T-天骄",
      :official_web => "http://www.tjnet.com.cn/",
      :sale_date => "2005-9-28",
      :company => "目标软件",
      :agent => "目标软件",
      :no_areas => true,
      :no_races => true,
      :description => "2D角色扮演游戏")
      game21.tag_list = "热血, 武侠, 道具收费, 即时战斗, 2D"
      game21.save
game22 = Game.create(
      :name => "K-快乐西游",
      :official_web => "http://joyxy.the9.com/",
      :sale_date => "2005-8-18",
      :company => "第九城市",
      :agent => "第九城市",
      :no_areas => true,
      :no_races => true,
      :description => "2D横板角色扮演游戏")
      game22.tag_list = "Q版, 休闲, 道具收费, 横板战斗, 2D"
      game22.save
game23 = Game.create(
      :name => "W-武林群侠传2online",
      :official_web => "http://50.catv.net/",
      :sale_date => "2009-7-11",
      :company => "中华网龙",
      :agent => "中广网",
      :no_races => true,
      :description => "大型3D角色扮演游戏")
      game23.tag_list = "史诗, 武侠, 道具收费, 即时战斗, 3D"
      game23.save
game24 = Game.create(
      :name => "P-跑跑卡丁车",
      :official_web => "http://popkart.tiancity.com/homepage/",
      :sale_date => "2006-3-17",
      :company => "韩国NEXON",
      :agent => "世纪天成",
      :no_areas => true,
      :no_races => true,
      :no_professions => true,
      :description => "经典赛车类休闲游戏")
      game24.tag_list = "Q版, 休闲, 道具收费, 赛车, 3D"
      game24.save
game25 = Game.create(
      :name => "X-希望online",
      :official_web => "http://www.sealonline.com.cn/default_z1.asp",
      :sale_date => "2004-12-15",
      :company => "韩国Grigon",
      :agent => "光宇华夏",
      :no_races => true,
      :description => "休闲3D角色扮演游戏")
      game25.tag_list = "Q版, 休闲, 道具收费, 即时战斗, 3D"
      game25.save
game26 = Game.create(
      :name => "R2",
      :official_web => "http://www.r2online.cn/",
      :sale_date => "2007-12-19",
      :company => "NHN Games",
      :agent => "联众",
      :no_races => true,
      :description => "3D大型角色扮演游戏")
      game26.tag_list = "史诗, 奇幻, 道具收费, 即时战斗, 3D"
      game26.save
game27 = Game.create(
      :name => "S-三国策",
      :official_web => "http://www1.sgconline.com.cn/index.htm",
      :sale_date => "2008-6-7",
      :company => "皓宇互动科技",
      :agent => "皓宇互动科技",
      :no_races => true,
      :no_professions => true,
      :description => "策略类网络游戏")
      game27.tag_list = "热血, 战争, 道具收费, 策略, 2D"
      game27.save
game28 = Game.create(
      :name => "J-剑侠情缘网络版（收费版）",
      :official_web => "http://jx.xoyo.com/index1/index.shtml",
      :sale_date => "2003-9-23",
      :company => "金山西山居",
      :agent => "金山西山居",
      :no_races => true,
      :description => "国产2D角色扮演游戏")
      game28.tag_list = "热血, 武侠, 时间收费, 即时战斗, 2D"
      game28.save
game29 = Game.create(
      :name => "D-大唐豪侠",
      :official_web => "http://dt.163.com/",
      :sale_date => "2006-5-31",
      :company => "网易",
      :agent => "网易",
      :no_races => true,
      :description => "国产3D角色扮演游戏")
      game29.tag_list = "热血, 武侠, 时间收费, 即时战斗, 3D"
      game29.save
game30 = Game.create(
      :name => "EVE",
      :official_web => "http://www.eve-online.com.cn/",
      :sale_date => "2006-6-12",
      :company => "冰岛 CCP",
      :agent => "光通通信",
      :no_areas => true,
      :description => "大型经营性角色扮演网游")
      game30.tag_list = "史诗, 星战, 时间收费, 即时战斗, 经营, 3D"
      game30.save
game31 = Game.create(
      :name => "Z-诛仙2",
      :official_web => "http://zhuxian.wanmei.com/main.htm",
      :sale_date => "2009-09-22",
      :company => "完美时空",
      :agent => "完美时空",
      :no_races => true,
      :description => "国产3D大型奇幻角色扮演游戏")
      game31.tag_list = "史诗, 中国玄幻, 道具收费, 即时战斗, 3D"
      game31.save
game32 = Game.create(
      :name => "X-寻仙",
      :official_web => "http://xunxian.qq.com/index.shtml",
      :sale_date => "2009-9-17",
      :company => "像素",
      :agent => "腾讯",
      :no_races => true,
      :description => "3D中国玄幻角色扮演游戏")
      game32.tag_list = "轻松, 中国玄幻, 道具收费, 即时战斗, 3D"
      game32.save
game33 = Game.create(
      :name => "M-梦幻诛仙",
      :official_web => "http://mhzx.wanmei.com/",
      :sale_date => "2009-10-22",
      :company => "完美时空",
      :agent => "完美时空",
      :no_races => true,
      :description => "2D回合制角色扮演游戏")
      game33.tag_list = "Q版, 中国玄幻, 回合制战斗, 2D"
      game33.save
game34 = Game.create(
      :name => "M-魔域",
      :official_web => "http://my.91.com/index/",
      :sale_date => "2006-3-8",
      :company => "天晴数码",
      :agent => "网龙",
      :no_races => true,
      :description => "2D奇幻角色扮演游戏")
      game34.tag_list = "热血, 奇幻, 道具收费, 即时战斗, 2D"
      game34.save
game35 = Game.create(
      :name => "W-问道",
      :official_web => "http://wd.gyyx.cn/index_wd.aspx",
      :sale_date => "2006-4-22",
      :company => "吉比特",
      :agent => "光宇华夏科技",
      :no_races => true,
      :description => "2D回合制角色扮演游戏")
      game35.tag_list = "轻松, 中国玄幻, 道具收费, 回合制战斗, 2D"
      game35.save
game36 = Game.create(
      :name => "M-冒险岛online",
      :official_web => "http://mxd.sdo.com/web4/home/index.asp",
      :sale_date => "2004-7-23",
      :company => "韩国WIZET",
      :agent => "盛大网络",
      :no_races => true,
      :description => "2D横板卷轴式绿色休闲游戏")
      game36.tag_list = "Q版, 奇幻, 道具收费, 横板战斗, 2D"
      game36.save
game37 = Game.create(
      :name => "J-巨人",
      :official_web => "http://jr.ztgame.com/",
      :sale_date => "2008-3-28",
      :company => "巨人",
      :agent => "巨人",
      :no_races => true,
      :description => "3D战争题材角色扮演游戏")
      game37.tag_list = "热血, 战争, 道具收费, 即时战斗, 3D"
      game37.save
game38 = Game.create(
      :name => "R-热血江湖online",
      :official_web => "http://www.rxjh.com.cn/",
      :sale_date => "2005-4-20",
      :company => "Mgame&KRGsoft",
      :agent => "一起玩游戏网",
      :no_races => true,
      :description => "3D卡通武侠")
      game38.tag_list = "Q版, 武侠, 道具收费, 即时战斗, 3D"
      game38.save
game39 = Game.create(
      :name => "W-完美世界",
      :official_web => "http://world2.wanmei.com/",
      :sale_date => "2005-11-25",
      :company => "完美时空",
      :agent => "完美时空",
      :no_races => true,
      :description => "3D中国玄幻角色扮演游戏")
      game39.tag_list = "轻松, 中国玄幻, 时间收费, 即时战斗, 3D"
      game39.save
game40 = Game.create(
      :name => "SD敢达",
      :official_web => "http://gd.9you.com/web_v2/index_top.html",
      :sale_date => "2008-12-30",
      :company => "BANDAI KOREA",
      :agent => "久游网",
      :no_areas => true,
      :no_races => true,
      :no_professions => true,
      :description => "休闲3D第一人称动作射击")
      game40.tag_list = "Q版, 第一人称射击, 科幻, 道具收费, 3D"
      game40.save
game41 = Game.create(
      :name => "D-大话西游外传",
      :official_web => "http://xyw.163.com/index.html",
      :sale_date => "2008-7-5",
      :company => "网易",
      :agent => "网易",
      :description => "2D回合制角色扮演游戏")
      game41.tag_list = "Q版, 中国玄幻, 道具收费, 回合制战斗, 2D"
      game41.save
game42 = Game.create(
      :name => "T-天下贰",
      :official_web => "http://tx2.163.com/",
      :sale_date => "2009-9-20",
      :company => "网易",
      :agent => "网易",
      :no_races => true,
      :description => "国产3D大型角色扮演游戏")
      game42.tag_list = "热血, 中国玄幻, 时间收费, 即时战斗, 3D"
      game42.save
game43 = Game.create(
      :name => "P-漂流幻境",
      :official_web => "http://wl.catv.net/",
      :sale_date => "2007-11-20",
      :company => "中华网龙",
      :agent => "中广网",
      :no_areas => true,
      :no_races => true,
      :description => "Q版回合制角色扮演游戏")
      game43.tag_list = "Q版, 奇幻, 道具收费, 回合制战斗, 2D"
      game43.save
game44 = Game.create(
      :name => "D-大话西游",
      :official_web => "http://xy2.163.com/",
      :sale_date => "2002-6-7",
      :company => "网易",
      :agent => "网易",
      :no_races => true,
      :description => "国产2D休闲角色扮演游戏")
      game44.tag_list = "Q版, 中国玄幻, 时间收费, 回合制战斗, 2D"
      game44.save
game45 = Game.create(
      :name => "K-口袋西游",
      :official_web => "http://kdxy.wanmei.com/",
      :sale_date => "2008-10-16",
      :company => "完美时空",
      :agent => "完美时空",
      :description => "Q版3D即时宠物网游")
      game45.tag_list = "Q版, 中国玄幻, 道具收费, 即时战斗, 3D"
      game45.save
game46 = Game.create(
      :name => "C-赤壁",
      :official_web => "http://chibi.wanmei.com/",
      :sale_date => "2008-2-28",
      :company => "完美时空",
      :agent => "完美时空",
      :no_races => true,
      :description => "国产3D大型网络游戏")
      game46.tag_list = "热血, 武侠, 道具收费, 即时战斗, 3D"
      game46.save
game47 = Game.create(
        :name => "D-地下城与勇士",
        :official_web => "http://dnf.qq.com",
        :sale_date => "2008-6-19",
        :company => "Neople",
        :agent => "腾讯",
        :description => "2D横版格斗网游")
    game47.tag_list = "热血, 奇幻, 道具收费, 横板战斗, 2D"
    game47.save
game48 = Game.create(
      :name => "彩虹岛online",
      :official_web => "http://chd.sdo.com/web1.0/home/index.asp",
      :sale_date => "2007-5-1",
      :company => "Actoz",
      :agent => "盛大网络",
      :no_races => true,
      :description => "Q版横板过关式角色扮演游戏")
      game48.tag_list = "Q版, 奇幻, 道具收费, 横板战斗, 2D"
      game48.save
game49 = Game.create(
      :name => "新奇迹世界",
      :official_web => "http://sun.the9.com/",
      :sale_date => "2009-5-15",
      :company => "WebZen(网禅)",
      :agent => "第九城市",
      :no_races => true,
      :description => "3D大型角色扮演游戏")
      game49.tag_list = "史诗, 奇幻, 道具收费, 即时战斗, 3D"
      game49.save
game50 = Game.create(
      :name => "劲舞团",
      :official_web => "http://au.9you.com/web_v5/index.html",
      :sale_date => "2005-5-12",
      :company => "韩国韩光软件",
      :agent => "久游网",
      :no_races => true,
      :no_professions => true,
      :description => "休闲音乐类游戏")
      game50.tag_list = "Q版, 音乐, 道具收费, 舞蹈, 3D"
      game50.save
game51 = Game.create(
      :name => "神鬼传奇",
      :official_web => "http://sgcq.wanmei.com/",
      :sale_date => "2009-4-2",
      :company => "完美时空",
      :agent => "完美时空",
      :no_races => true,
      :description => "大型2D角色扮演游戏")
      game51.tag_list = "热血, 奇幻, 道具收费, 即时战斗, 2D"
      game51.save
game52 = Game.create(
      :name => "梦幻西游",
      :official_web => "http://xyq.163.com/",
      :sale_date => "2003-12-18",
      :company => "网易",
      :agent => "网易",
      :no_races => true,
      :description => "Q版2D回合制角色扮演游戏")
      game52.tag_list = "Q版, 中国玄幻, 时间收费, 即时战斗, 2D"
      game52.save
game53 = Game.create(
      :name => "FIFA_online_2",
      :official_web => "http://www.eafifaonline2.com/",
      :sale_date => "2009-4-22",
      :company => "艺电EA，韩国Neowiz Games",
      :agent => "第九城市",
      :no_areas => true,
      :no_races => true,
      :no_professions => true,
      :description => "休闲在线足球游戏")
      game53.tag_list = "休闲, 运动, 道具收费, 足球, 3D"
      game53.save
game54 = Game.create(
      :name => "蜀门",
      :official_web => "http://www.shumenol.com/",
      :sale_date => "2009-6-26",
      :company => "云蟾网络",
      :agent => "绿岸网络",
      :no_races => true,
      :description => "中国玄幻类角色扮演游戏")
      game54.tag_list = "热血, 中国玄幻, 道具收费, 即时战斗, 3D"
      game54.save
game55 = Game.create(
      :name => "天龙八部",
      :official_web => "http://tl.sohu.com/",
      :sale_date => "2007-5-9",
      :company => "搜狐畅游",
      :agent => "搜狐畅游",
      :no_races => true,
      :description => "中国武侠类角色扮演游戏")
      game55.tag_list = "史诗, 武侠, 道具收费, 即时战斗, 3D"
      game55.save
game56 = Game.create(
      :name => "刀剑英雄",
      :official_web => "http://bo.sohu.com/",
      :sale_date => "2006-12-27",
      :company => "像素",
      :agent => "搜狐畅游",
      :no_races => true,
      :description => "大型奇幻网络游戏")
      game56.tag_list = "热血, 奇幻, 道具收费, 即时战斗, 2D"
      game56.save
game57 = Game.create(
      :name => "征途",
      :official_web => "http://zt.ztgame.com/",
      :sale_date => "2006-4-21",
      :company => "巨人",
      :agent => "巨人",
      :no_races => true,
      :description => "大型中古玄幻网络游戏")
      game57.tag_list = "热血, 中国玄幻, 道具收费, 即时战斗, 2D"
      game57.save
game58 = Game.create(
      :name => "剑侠情缘网络版（免费版）",
      :official_web => "http://jx.xoyo.com/index1/ib/index.shtml",
      :sale_date => "2003-9-23",
      :company => "金山西山居",
      :agent => "金山西山居",
      :no_races => true,
      :description => "国产2D角色扮演游戏")
      game28.tag_list = "热血, 武侠, 时间收费, 即时战斗, 2D"
game59 = Game.create(
      :name => "封神榜二",
      :official_web => "http://fs2.xoyo.com/",
      :sale_date => "2008-3-6",
      :company => "金山西山居",
      :agent => "金山西山居",
      :no_races => true,
      :description => "国产2D角色扮演游戏")
      game59.tag_list = "热血, 中国玄幻, 道具收费, 即时战斗, 2D"
      game59.save
game60 = Game.create(
      :name => "奇迹",
      :official_web => "http://www.muchina.com/muchina_main.htm",
      :sale_date => "2006-8-12",
      :company => "网禅",
      :agent => "第九城市",
      :no_races => true,
      :description => "国产2D角色扮演游戏")
      game60.tag_list = "热血, 奇幻, 时间收费, 道具收费, 即时战斗, 2D"
      game60.save
game61 = Game.create(
      :name => "功夫世界",
      :official_web => "http://www.wokchina.com/website/index.html",
      :sale_date => "2007-11-11",
      :company => "腾仁",
      :agent => "盛大网络",
      :no_races => true,
      :description => "3D大型角色扮演游戏")
      game61.tag_list = "热血, 武侠, 道具收费, 即时战斗, 3D"
      game61.save
game62 = Game.create(
      :name => "妖怪A梦",
      :official_web => "http://www.yaoguai.com/",
      :sale_date => "2009-07-29",
      :company => "朗玛信息",
      :agent => "朗玛信息",
      :no_races => true,
      :description => "Q版3D角色扮演游戏")
      game62.tag_list = "Q版, 奇幻, 道具收费, 回合制战斗, 3D"
      game62.save
game63 = Game.create(
      :name => "兽血沸腾",
      :official_web => "http://sx.baiyou100.com/",
      :sale_date => "2009-4-9",
      :company => "百游公司",
      :agent => "百游公司",
      :no_races => true,
      :description => "2D奇幻角色扮演游戏")
      game63.tag_list = "热血, 奇幻, 道具收费, 即时战斗, 2D"
      game63.save
game64 = Game.create(
      :name => "英雄无敌online",
      :official_web => "http://yx.91.com/",
      :sale_date => "2009-7-8",
      :company => "网龙公司",
      :agent => "网龙公司",
      :no_races => true,
      :description => "策略型回合制网游")
      game64.tag_list = "热血, 奇幻, 道具收费, 回合制战斗, 2D"
      game64.save
game65 = Game.create(
      :name => "霸王2",
      :official_web => "http://ac.sdo.com/web2.0/home2/index.asp",
      :sale_date => "2008-9-18",
      :company => "韩国NHN",
      :agent => "盛大网络",
      :no_races => true,
      :description => "3D奇幻角色扮演游戏")
      game65.tag_list = "热血, 奇幻, 道具收费, 即时战斗, 3D"
      game65.save
game66 = Game.create(
      :name => "洛奇",
      :official_web => "http://luoqi.tiancity.com/homepage/",
      :sale_date => "2005-06-28",
      :company => "NEXON",
      :agent => "世纪天成",
      :no_races => true,
      :description => "Q版3D角色扮演游戏")
      game66.tag_list = "Q版, 奇幻, 道具收费, 即时战斗, 3D"
      game66.save
game67 = Game.create(
      :name => "盛大富翁",
      :official_web => "http://rich.sdo.com/web2.0/index.asp",
      :sale_date => "2005-11-18",
      :company => "盛大网络",
      :agent => "盛大网络",
      :no_areas => true,
      :no_races => true,
      :no_professions => true,
      :description => "大富翁类休闲游戏")
      game67.tag_list = "Q版, 休闲, 道具收费, 大富翁, 2D"
      game67.save
game68 = Game.create(
      :name => "大海战2",
      :official_web => "http://nf2.9hgame.com/",
      :sale_date => "2005-5-13",
      :company => "SD EnterNET",
      :agent => "九合天下",
      :no_races => true,
      :no_professions => true,
      :description => "大型多人在线战术模拟游戏")
      game68.tag_list = "仿真, 战争, 道具收费, 策略, 2D"
      game68.save
game69 = Game.create(
      :name => "超级乐者",
      :official_web => "http://baf.9you.com/",
      :sale_date => "2006-6-22",
      :company => "久游网",
      :agent => "久游网",
      :no_areas => true,
      :no_professions => true,
      :no_races => true,
      :description => "音乐休闲游戏")
      game69.tag_list = "轻松, 音乐, 道具收费, 歌曲, 2D"
      game69.save
game70 = Game.create(
      :name => "天子",
      :official_web => "http://tz.woniu.com/",
      :sale_date => "2008-9-15",
      :company => "蜗牛电子",
      :agent => "蜗牛电子",
      :no_races => true,
      :description => "2D奇幻角色扮演游戏")
      game70.tag_list = "热血, 奇幻, 道具收费, 即时战斗, 2D"
      game70.save
game71 = Game.create(
      :name => "预言online",
      :official_web => "http://www.yuyan.com/",
      :sale_date => "2008-4-29",
      :company => "暴雨信息",
      :agent => "暴雨信息",
      :no_races => true,
      :description => "2D奇幻角色扮演游戏")
      game71.tag_list = "热血, 奇幻, 道具收费, 即时战斗, 2D"
      game71.save
game72 = Game.create(
      :name => "新武林外传",
      :official_web => "http://wulin2.wanmei.com/main.htm",
      :sale_date => "2006-8-28",
      :company => "完美时空",
      :agent => "完美时空",
      :no_races => true,
      :description => "Q版3D中国玄幻角色扮演游戏")
      game72.tag_list = "Q版, 中国玄幻, 道具收费, 即时战斗, 3D"
      game72.save
game73 = Game.create(
      :name => "新飞飞",
      :official_web => "http://ff.163.com/",
      :sale_date => "2008-10-15",
      :company => "aeonsoft",
      :agent => "网易",
      :no_races => true,
      :description => "Q版3D角色扮演游戏")
      game73.tag_list = "Q版, 奇幻, 道具收费, 即时战斗, 3D"
      game73.save
game74 = Game.create(
      :name => "宝贝坦克",
      :official_web => "http://tank.moliyo.com/",
      :sale_date => "2007-8-24",
      :company => "摩力游",
      :agent => "摩力游",
      :no_areas => true,
      :no_races => true,
      :no_professions => true,
      :description => "回合类休闲射击")
      game74.tag_list = "Q版, 休闲, 道具收费, 射击, 2D"
      game74.save
game75 = Game.create(
      :name => "梦想世界",
      :official_web => "http://www.henhaoji.com/",
      :sale_date => "2007-11-1",
      :company => "多益网络",
      :agent => "多益网络",
      :description => "2D回合制角色扮演游戏")
      game75.tag_list = "Q版, 奇幻, 道具收费, 回合制战斗, 2D"
      game75.save
game76 = Game.create(
      :name => "天神世界",
      :official_web => "http://ts.920game.com/",
      :sale_date => "2009-1-9",
      :company => "创联世纪",
      :agent => "创联世纪",
      :no_areas => true,
      :no_races => true,
      :description => "3D奇幻角色扮演游戏")
      game76.tag_list = "热血, 奇幻, 道具收费, 即时战斗, 3D"
      game76.save
game77 = Game.create(
      :name => "剑侠世界",
      :official_web => "http://jxsj.xoyo.com/",
      :sale_date => "2008-3-3",
      :company => "金山西山居",
      :agent => "金山西山居",
      :no_races => true,
      :description => "2D武侠角色扮演游戏")
      game77.tag_list = "热血, 武侠, 道具收费, 即时战斗, 2D"
      game77.save
game78 = Game.create(
      :name => "机甲世纪",
      :official_web => "http://aoa.woniu.com/",
      :sale_date => "2009-6-19",
      :company => "蜗牛电子",
      :agent => "蜗牛电子",
      :no_races => true,
      :description => "科幻3D角色扮演游戏")
      game78.tag_list = "科幻, 战争, 道具收费, 即时战斗, 3D"
      game78.save
game79 = Game.create(
      :name => "泡泡堂",
      :official_web => "http://home.bnb.sdo.com/yindao/index.html",
      :sale_date => "2003-4-12",
      :company => "NEXON",
      :agent => "盛大网络",
      :no_areas => true,
      :no_races => true,
      :no_professions => true,
      :description => "2D休闲炸弹人类游戏")
      game79.tag_list = "Q版, 休闲, 道具收费, 炸弹人, 2D"
      game79.save
game80 = Game.create(
      :name => "魔法之门",
      :official_web => "http://mfm.moliyo.com/",
      :sale_date => "2009-6-18",
      :company => "摩力游",
      :agent => "摩力游",
      :no_races => true,
      :description => "3D奇幻角色扮演游戏")
      game80.tag_list = "热血, 奇幻, 道具收费, 即时战斗, 3D"
      game80.save
game81 = Game.create(
      :name => "仙剑online",
      :official_web => "http://xj.9you.com/xj_v2/index_top.html",
      :sale_date => "2009-1-9",
      :company => "大宇",
      :agent => "久游",
      :no_races => true,
      :description => "3D中国玄幻角色扮演游戏")
      game81.tag_list = "热血, 中国玄幻, 道具收费, 即时战斗, 3D"
      game81.save
game82 = Game.create(
      :name => "真三国无双",
      :official_web => "http://www.wushuangol.com/",
      :sale_date => "2008-4-11",
      :company => "日本光荣",
      :agent => "上海天希",
      :no_areas => true,
      :description => "3D动作竞技游戏")
      game82.tag_list = "热血, 动作, 道具收费, 即时战斗, 3D"
      game82.save
game83 = Game.create(
      :name => "开心online",
      :official_web => "http://kx.91.com/",
      :sale_date => "2009-3-5",
      :company => "天晴数码",
      :agent => "网龙公司",
      :no_races => true,
      :description => "Q版3D回合制角色扮演")
      game83.tag_list = "Q版, 中国玄幻, 道具收费, 回合制战斗, 3D"
      game83.save
game84 = Game.create(
      :name => "航海世纪",
      :official_web => "http://vc.woniu.com/",
      :sale_date => "2004-12-8",
      :company => "蜗牛电子",
      :agent => "蜗牛电子",
      :no_races => true,
      :description => "3D角色扮演游戏")
      game84.tag_list = "热血, 海战, 道具收费, 即时战斗, 3D"
      game84.save
game85 = Game.create(
      :name => "天堂",
      :official_web => "http://www.lineage.com.cn/page=default",
      :sale_date => "2003-1-8",
      :company => "NCSoft",
      :agent => "新浪乐谷",
      :description => "2D奇幻角色扮演游戏")
      game85.tag_list = "热血, 奇幻, 时间收费, 即时战斗, 2D"
      game85.save
game86 = Game.create(
      :name => "石器世界",
      :official_web => "http://sq.ferrygame.com/",
      :sale_date => "2008-11-14",
      :company => "韩国eNium",
      :agent => "渡口网络",
      :no_areas => true,
      :no_races => true,
      :description => "Q版3D角色扮演游戏")
      game86.tag_list = "Q版, 奇幻, 道具收费, 即时战斗, 3D"
      game86.save
game87 = Game.create(
      :name => "西游Q记",
      :official_web => "http://xy.gyyx.cn/Index_xy.aspx",
      :sale_date => "2008-12-26",
      :company => "火石软件",
      :agent => "光宇在线",
      :description => "回合制角色扮演游戏")
      game87.tag_list = "Q版, 中国玄幻, 道具收费, 回合制战斗, 2D"
      game87.save
game88 = Game.create(
      :name => "劲舞世界",
      :official_web => "http://gp.higame.com.cn",
      :sale_date => "2007-9-13",
      :company => "未知",
      :agent => "尚禾互动",
      :no_areas => true,
      :no_races => true,
      :no_professions => true,
      :description => "音乐休闲游戏")
      game88.tag_list = "休闲, 轻松, 道具收费, 音乐, 3D"
      game88.save
game89 = Game.create(
      :name => "水浒Q传",
      :official_web => "http://sh.xoyo.com/",
      :sale_date => "2006-9-15",
      :company => "火石软件",
      :agent => "金山西山居",
      :no_races => true,
      :description => "2D回合制角色扮演游戏")
      game89.tag_list = "Q版, 中国玄幻, 道具收费, 回合制战斗, 3D"
      game89.save
game90 = Game.create(
      :name => "华夏2",
      :official_web => "http://www.huaxia2.com/",
      :sale_date => "2006-8-28",
      :company => "深圳网域",
      :agent => "腾讯",
      :no_races => true,
      :description => "2D奇幻角色扮演")
      game90.tag_list = "热血, 奇幻, 道具收费, 即时战斗, 2D"
      game90.save
game91 = Game.create(
      :name => "王者世界",
      :official_web => "http://at.the9.com/",
      :sale_date => "2009-6-10",
      :company => "Ndoors",
      :agent => "第九城市",
      :no_races => true,
      :description => "3D回合制策略型角色扮演游戏")
      game91.tag_list = "热血, 奇幻, 道具收费, 回合制战斗, 3D"
      game91.save
game92 = Game.create(
      :name => "疯狂赛车2",
      :official_web => "http://kart.sdo.com/web4/home/index.asp",
      :sale_date => "2008-5-10",
      :company => "盛大网络",
      :agent => "盛大网络",
      :no_areas => true,
      :no_races => true,
      :no_professions => true,
      :description => "休闲赛车")
      game92.tag_list = "轻松, 休闲, 道具收费, 赛车, 3D"
      game92.save
game93 = Game.create(
      :name => "街舞区",
      :official_web => "http://5jq.woniu.com/",
      :sale_date => "2007-7-1",
      :company => "蜗牛电子",
      :agent => "蜗牛电子",
      :no_areas => true,
      :no_races => true,
      :no_professions => true,
      :description => "休闲社交音乐类游戏")
      game93.tag_list = "轻松, 休闲, 道具收费, 音乐, 3D"
      game93.save
game94 = Game.create(
      :name => "大话西游3",
      :official_web => "http://xy3.163.com",
      :sale_date => "2007-8-15",
      :company => "网易",
      :agent => "网易",
      :no_races => true,
      :description => "回合制角色扮演游戏")
      game94.tag_list = "热血, 奇幻, 时间收费, 回合制战斗, 3D"
      game94.save
game95 = Game.create(
      :name => "勇气online",
      :official_web => "http://y.qwd1.com/",
      :sale_date => "2008-09-25",
      :company => "思开美琪",
      :agent => "趣味第一",
      :no_races => true,
      :description => "Q版即时战斗角色扮演")
      game95.tag_list = "Q版, 武侠, 道具收费, 即时战斗, 2D"
      game95.save
game96 = Game.create(
      :name => "冲锋岛",
      :official_web => "http://cfd.tiancity.com/homepage/v3/",
      :sale_date => "2009-3-24",
      :company => "symmetric space",
      :agent => "世纪天成",
      :no_races => true,
      :description => "2D横版角色扮演")
      game96.tag_list = "Q版, 奇幻, 道具收费, 横板战斗, 2D"
      game96.save
game97 = Game.create(
      :name => "魔力宝贝2",
      :official_web => "http://cg2.9you.com/index.shtml",
      :sale_date => "2008-11-1",
      :company => "SQUARE ENIX",
      :agent => "久游网",
      :no_races => true,
      :description => "3D半即时制角色扮演游戏")
      game97.tag_list = "Q版, 奇幻, 道具收费, 半即时制战斗, 3D"
      game97.save
game98 = Game.create(
      :name => "刀剑英雄2",
      :official_web => "http://dj2.changyou.com/",
      :sale_date => "2009-4-21",
      :company => "搜狐畅游",
      :agent => "搜狐畅游",
      :no_races => true,
      :description => "2D奇幻角色扮演游戏")
      game98.tag_list = "热血, 奇幻, 道具收费, 即时战斗, 2D"
      game98.save
game99 = Game.create(
      :name => "英雄连online",
      :official_web => "http://coho.sdo.com/homepage/index.html",
      :sale_date => "2009-8-6",
      :company => "THQ",
      :agent => "盛大网络",
      :no_areas => true,
      :no_races => true,
      :no_professions => true,
      :description => "策略经营类")
      game99.tag_list = "战争, 策略, 道具收费, 即时战争, 3D"
      game99.save
game100 = Game.create(
      :name => "大航海时代online",
      :official_web => "http://dol.zrplay.com/index.html",
      :sale_date => "2007-10-30",
      :company => "光荣",
      :agent => "中荣巡游",
      :no_areas => true,
      :description => "3D角色扮演")
      game100.tag_list = "史诗, 海战, 时间收费, 即时战斗, 3D"
      game100.save
game101 = Game.create(
      :name => "壮志凌云",
      :official_web => "http://ace.yetime.cn/",
      :sale_date => "2007-9-20",
      :company => "韩国Masangsoft",
      :agent => "易当网络",
      :no_races => true,
      :description => "大型3D全方位立体飞行射击网络游戏")
      game101.tag_list = "战争, 射击, 道具收费, 热血, 3D"
      game101.save
  end

  def self.down
  end

end
