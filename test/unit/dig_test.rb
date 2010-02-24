require 'test_helper'

class DigTest < ActiveSupport::TestCase

  test "没有发表者" do
    c = Dig.create(:poster_id => nil)
    assert_equal c.errors.on_base, '没有发布者'
  end

  test "没有被挖的资源" do
    c = Dig.create(:poster_id => 1, :diggable_id => 1, :diggable_type => nil)
    assert_equal c.errors.on_base, '没有被挖的资源'

    c = Dig.create(:poster_id => 1, :diggable_id => nil, :diggable_type => 'Blog')
    assert_equal c.errors.on_base, '没有被挖的资源'
  end

  test "被挖的资源不存在" do
    c = Dig.create(:poster_id => 1, :diggable_id => 1, :diggable_type => 'Blog')
    assert_equal c.errors.on_base, '被挖的资源不存在'
  end

  test "已经挖过了" do
    setup_blog

    Dig.create(:poster_id => 1, :diggable_id => @b1.id, :diggable_type => 'Blog')
    c = Dig.create(:poster_id => 1, :diggable_id => @b1.id, :diggable_type => 'Blog')
    assert_equal c.errors.on_base, '已经挖过了'
  end

  # 挖日志
  test "本人挖日志" do
    setup_blog

    d = Dig.create(:poster_id => 2, :diggable_id => @b1.id, :diggable_type => 'Blog')
    @b1.reload
    assert_nil d.errors.on_base
    assert_equal @b1.digs_count, 1

    d = Dig.create(:poster_id => 2, :diggable_id => @b2.id, :diggable_type => 'Blog')
    @b2.reload
    assert_nil d.errors.on_base
    assert_equal @b2.digs_count, 1

    d = Dig.create(:poster_id => 2, :diggable_id => @b3.id, :diggable_type => 'Blog')
    @b3.reload
    assert_nil d.errors.on_base
    assert_equal @b3.digs_count, 1

    d = Dig.create(:poster_id => 2, :diggable_id => @b4.id, :diggable_type => 'Blog')
    @b4.reload
    assert_nil d.errors.on_base
    assert_equal @b4.digs_count, 1
  end

  test "好友挖日志" do
    setup_blog

    d = Dig.create(:poster_id => 1, :diggable_id => @b1.id, :diggable_type => 'Blog')
    @b1.reload
    assert_nil d.errors.on_base
    assert_equal @b1.digs_count, 1

    d = Dig.create(:poster_id => 1, :diggable_id => @b2.id, :diggable_type => 'Blog')
    @b2.reload
    assert_nil d.errors.on_base
    assert_equal @b2.digs_count, 1
  
    d = Dig.create(:poster_id => 1, :diggable_id => @b3.id, :diggable_type => 'Blog')
    @b3.reload
    assert_nil d.errors.on_base
    assert_equal @b3.digs_count, 1

    d = Dig.create(:poster_id => 1, :diggable_id => @b4.id, :diggable_type => 'Blog')
    @b4.reload
    assert_not_nil d.errors.on_base
    assert_equal @b4.digs_count, 0
  end

  test "相同游戏者挖日志" do
    setup_blog

    d = Dig.create(:poster_id => 3, :diggable_id => @b1.id, :diggable_type => 'Blog')
    @b1.reload
    assert_nil d.errors.on_base
    assert_equal @b1.digs_count, 1

    d = Dig.create(:poster_id => 3, :diggable_id => @b2.id, :diggable_type => 'Blog')
    @b2.reload
    assert_nil d.errors.on_base
    assert_equal @b2.digs_count, 1
  
    d = Dig.create(:poster_id => 3, :diggable_id => @b3.id, :diggable_type => 'Blog')
    @b3.reload
    assert_nil d.errors.on_base
    assert_equal @b3.digs_count, 1

    d = Dig.create(:poster_id => 3, :diggable_id => @b4.id, :diggable_type => 'Blog')
    @b4.reload
    assert_not_nil d.errors.on_base
    assert_equal @b4.digs_count, 0
  end

  test "陌生人挖日志" do
    setup_blog

    d = Dig.create(:poster_id => 4, :diggable_id => @b1.id, :diggable_type => 'Blog')
    @b1.reload
    assert_nil d.errors.on_base
    assert_equal @b1.digs_count, 1

    d = Dig.create(:poster_id => 4, :diggable_id => @b2.id, :diggable_type => 'Blog')
    @b2.reload
    assert_nil d.errors.on_base
    assert_equal @b2.digs_count, 1
  
    d = Dig.create(:poster_id => 4, :diggable_id => @b3.id, :diggable_type => 'Blog')
    @b3.reload
    assert_nil d.errors.on_base
    assert_equal @b3.digs_count, 1

    d = Dig.create(:poster_id => 4, :diggable_id => @b4.id, :diggable_type => 'Blog')
    @b4.reload
    assert_not_nil d.errors.on_base
    assert_equal @b4.digs_count, 0
  end

  # 挖 视频
  test "本人挖视频" do
    setup_Video

    d = Dig.create(:poster_id => 2, :diggable_id => @v1.id, :diggable_type => 'Video')
    @v1.reload
    assert_nil d.errors.on_base
    assert_equal @v1.digs_count, 1

    d = Dig.create(:poster_id => 2, :diggable_id => @v2.id, :diggable_type => 'Video')
    @v2.reload
    assert_nil d.errors.on_base
    assert_equal @v2.digs_count, 1

    d = Dig.create(:poster_id => 2, :diggable_id => @v3.id, :diggable_type => 'Video')
    @v3.reload
    assert_nil d.errors.on_base
    assert_equal @v3.digs_count, 1

    d = Dig.create(:poster_id => 2, :diggable_id => @v4.id, :diggable_type => 'Video')
    @v4.reload
    assert_nil d.errors.on_base
    assert_equal @v4.digs_count, 1
  end

  test "好友挖视频" do
    setup_Video

    d = Dig.create(:poster_id => 1, :diggable_id => @v1.id, :diggable_type => 'Video')
    @v1.reload
    assert_nil d.errors.on_base
    assert_equal @v1.digs_count, 1

    d = Dig.create(:poster_id => 1, :diggable_id => @v2.id, :diggable_type => 'Video')
    @v2.reload
    assert_nil d.errors.on_base
    assert_equal @v2.digs_count, 1
  
    d = Dig.create(:poster_id => 1, :diggable_id => @v3.id, :diggable_type => 'Video')
    @v3.reload
    assert_nil d.errors.on_base
    assert_equal @v3.digs_count, 1

    d = Dig.create(:poster_id => 1, :diggable_id => @v4.id, :diggable_type => 'Video')
    @v4.reload
    assert_not_nil d.errors.on_base
    assert_equal @v4.digs_count, 0
  end

  test "相同游戏者挖视频" do
    setup_Video

    d = Dig.create(:poster_id => 3, :diggable_id => @v1.id, :diggable_type => 'Video')
    @v1.reload
    assert_nil d.errors.on_base
    assert_equal @v1.digs_count, 1

    d = Dig.create(:poster_id => 3, :diggable_id => @v2.id, :diggable_type => 'Video')
    @v2.reload
    assert_nil d.errors.on_base
    assert_equal @v2.digs_count, 1
  
    d = Dig.create(:poster_id => 3, :diggable_id => @v3.id, :diggable_type => 'Video')
    @v3.reload
    assert_nil d.errors.on_base
    assert_equal @v3.digs_count, 1

    d = Dig.create(:poster_id => 3, :diggable_id => @v4.id, :diggable_type => 'Video')
    @v4.reload
    assert_not_nil d.errors.on_base
    assert_equal @v4.digs_count, 0
  end

  test "陌生人挖视频" do
    setup_Video

    d = Dig.create(:poster_id => 4, :diggable_id => @v1.id, :diggable_type => 'Video')
    @v1.reload
    assert_nil d.errors.on_base
    assert_equal @v1.digs_count, 1

    d = Dig.create(:poster_id => 4, :diggable_id => @v2.id, :diggable_type => 'Video')
    @v2.reload
    assert_nil d.errors.on_base
    assert_equal @v2.digs_count, 1
  
    d = Dig.create(:poster_id => 4, :diggable_id => @v3.id, :diggable_type => 'Video')
    @v3.reload
    assert_nil d.errors.on_base
    assert_equal @v3.digs_count, 1

    d = Dig.create(:poster_id => 4, :diggable_id => @v4.id, :diggable_type => 'Video')
    @v4.reload
    assert_not_nil d.errors.on_base
    assert_equal @v4.digs_count, 0
  end

  # 挖 投票
  test "人人可挖投票" do
    setup_poll

    d = Dig.create(:poster_id => 1, :diggable_id => @p1.id, :diggable_type => 'Poll')
    @p1.reload
    assert_nil d.errors.on_base
    assert_equal @p1.digs_count, 1

    d = Dig.create(:poster_id => 2, :diggable_id => @p1.id, :diggable_type => 'Poll')
    @p1.reload
    assert_nil d.errors.on_base
    assert_equal @p1.digs_count, 2
  
    d = Dig.create(:poster_id => 3, :diggable_id => @p1.id, :diggable_type => 'Poll')
    @p1.reload
    assert_nil d.errors.on_base
    assert_equal @p1.digs_count, 3

    d = Dig.create(:poster_id => 4, :diggable_id => @p1.id, :diggable_type => 'Poll')
    @p1.reload
    assert_nil d.errors.on_base
    assert_equal @p1.digs_count, 4
  end

  # 挖 个人照片
  test "本人挖个人照片" do
    setup_personal_album

    d = Dig.create(:poster_id => 2, :diggable_id => @p1.id, :diggable_type => 'Photo')
    @p1.reload
    assert_nil d.errors.on_base
    assert_equal @p1.digs_count, 1

    d = Dig.create(:poster_id => 2, :diggable_id => @p2.id, :diggable_type => 'Photo')
    @p2.reload
    assert_nil d.errors.on_base
    assert_equal @p2.digs_count, 1

    d = Dig.create(:poster_id => 2, :diggable_id => @p3.id, :diggable_type => 'Photo')
    @p3.reload
    assert_nil d.errors.on_base
    assert_equal @p3.digs_count, 1

    d = Dig.create(:poster_id => 2, :diggable_id => @p4.id, :diggable_type => 'Photo')
    @p4.reload
    assert_not_nil d.errors.on_base
    assert_equal @p4.digs_count, 0
  end

  test "好友挖个人照片" do
    setup_personal_album

    d = Dig.create(:poster_id => 1, :diggable_id => @p1.id, :diggable_type => 'Photo')
    @p1.reload
    assert_nil d.errors.on_base
    assert_equal @p1.digs_count, 1

    d = Dig.create(:poster_id => 1, :diggable_id => @p2.id, :diggable_type => 'Photo')
    @p2.reload
    assert_nil d.errors.on_base
    assert_equal @p2.digs_count, 1

    d = Dig.create(:poster_id => 1, :diggable_id => @p3.id, :diggable_type => 'Photo')
    @p3.reload
    assert_nil d.errors.on_base
    assert_equal @p3.digs_count, 1

    d = Dig.create(:poster_id => 1, :diggable_id => @p4.id, :diggable_type => 'Photo')
    @p4.reload
    assert_not_nil d.errors.on_base
    assert_equal @p4.digs_count, 0
  end

  test "相同游戏挖个人照片" do
    setup_personal_album
  
    d = Dig.create(:poster_id => 3, :diggable_id => @p1.id, :diggable_type => 'Photo')
    @p1.reload
    assert_nil d.errors.on_base
    assert_equal @p1.digs_count, 1

    d = Dig.create(:poster_id => 3, :diggable_id => @p2.id, :diggable_type => 'Photo')
    @p2.reload
    assert_nil d.errors.on_base
    assert_equal @p2.digs_count, 1

    d = Dig.create(:poster_id => 3, :diggable_id => @p3.id, :diggable_type => 'Photo')
    @p3.reload
    assert_nil d.errors.on_base
    assert_equal @p3.digs_count, 1

    d = Dig.create(:poster_id => 3, :diggable_id => @p4.id, :diggable_type => 'Photo')
    @p4.reload
    assert_not_nil d.errors.on_base
    assert_equal @p4.digs_count, 0
  end

  test "陌生人挖个人照片" do
    setup_personal_album
  
    d = Dig.create(:poster_id => 4, :diggable_id => @p1.id, :diggable_type => 'Photo')
    @p1.reload
    assert_nil d.errors.on_base
    assert_equal @p1.digs_count, 1

    d = Dig.create(:poster_id => 4, :diggable_id => @p2.id, :diggable_type => 'Photo')
    @p2.reload
    assert_nil d.errors.on_base
    assert_equal @p2.digs_count, 1

    d = Dig.create(:poster_id => 4, :diggable_id => @p3.id, :diggable_type => 'Photo')
    @p3.reload
    assert_nil d.errors.on_base
    assert_equal @p3.digs_count, 1

    d = Dig.create(:poster_id => 4, :diggable_id => @p4.id, :diggable_type => 'Photo')
    @p4.reload
    assert_not_nil d.errors.on_base
    assert_equal @p4.digs_count, 0
  end

  # 挖 头像
  test "本人挖头像" do
    setup_avatar_album

    d = Dig.create(:poster_id => 2, :diggable_id => @p.id, :diggable_type => 'Photo')
    @p.reload
    assert_nil d.errors.on_base
    assert_equal @p.digs_count, 1
  end

  test "好友挖头像" do
    setup_avatar_album

    d = Dig.create(:poster_id => 1, :diggable_id => @p.id, :diggable_type => 'Photo')
    @p.reload
    assert_nil d.errors.on_base
    assert_equal @p.digs_count, 1
  end

  test "相同游戏挖头像" do
    setup_avatar_album

    d = Dig.create(:poster_id => 3, :diggable_id => @p.id, :diggable_type => 'Photo')
    @p.reload
    assert_nil d.errors.on_base
    assert_equal @p.digs_count, 1
  end

  test "陌生人挖头像" do
    setup_avatar_album

    d = Dig.create(:poster_id => 4, :diggable_id => @p.id, :diggable_type => 'Photo')
    @p.reload
    assert_nil d.errors.on_base
    assert_equal @p.digs_count, 1
  end

  # 挖 活动照片
  test "参与者挖活动照片" do
    setup_event
  
    d = Dig.create(:poster_id => 2, :diggable_id => @p.id, :diggable_type => 'Photo')
    @p.reload
    assert_nil d.errors.on_base
    assert_equal @p.digs_count, 1  
  end

  test "被邀请的人挖活动照片" do
    setup_event
    Participation.create(:status => 0, :participant_id => 1, :event_id => @e.id)  

    d = Dig.create(:poster_id => 1, :diggable_id => @p.id, :diggable_type => 'Photo')
    @p.reload
    assert_nil d.errors.on_base
    assert_equal @p.digs_count, 1
  end

  test "请求加入的人挖活动照片" do
    setup_event
    Participation.create(:status => 1, :participant_id => 1, :event_id => @e.id)

    d = Dig.create(:poster_id => 1, :diggable_id => @p.id, :diggable_type => 'Photo')
    @p.reload
    assert_nil d.errors.on_base
    assert_equal @p.digs_count, 1
  end
  
  test "不参加的人挖活动照片" do
    setup_event

    d = Dig.create(:poster_id => 1, :diggable_id => @p.id, :diggable_type => 'Photo')
    @p.reload
    assert_nil d.errors.on_base
    assert_equal @p.digs_count, 1
  end

  # 挖 工会照片
  test "会长挖工会照片" do
    setup_guild
  
    d = Dig.create(:poster_id => 2, :diggable_id => @p.id, :diggable_type => 'Photo')
    @p.reload
    assert_nil d.errors.on_base
    assert_equal @p.digs_count, 1
  end
  
  test "长老挖工会照片" do
    setup_guild
    Membership.create(:user_id => 1, :status => 4, :guild_id => @g.id)

    d = Dig.create(:poster_id => 1, :diggable_id => @p.id, :diggable_type => 'Photo')
    @p.reload
    assert_nil d.errors.on_base
    assert_equal @p.digs_count, 1
  end

  test "会员挖工会照片" do
    setup_guild
    Membership.create(:user_id => 1, :status => 5, :guild_id => @g.id)

    d = Dig.create(:poster_id => 1, :diggable_id => @p.id, :diggable_type => 'Photo')
    @p.reload
    assert_nil d.errors.on_base
    assert_equal @p.digs_count, 1
  end  

  test "被邀请的人挖工会照片" do
    setup_guild
    Membership.create(:user_id => 1, :status => 0, :guild_id => @g.id)

    d = Dig.create(:poster_id => 1, :diggable_id => @p.id, :diggable_type => 'Photo')
    @p.reload
    assert_nil d.errors.on_base
    assert_equal @p.digs_count, 1
  end

  test "请求加入的人挖工会照片" do
    setup_guild
    Membership.create(:user_id => 1, :status => 1, :guild_id => @g.id)

    d = Dig.create(:poster_id => 1, :diggable_id => @p.id, :diggable_type => 'Photo')
    @p.reload
    assert_nil d.errors.on_base
    assert_equal @p.digs_count, 1
  end

  test "不参加的人挖工会照片" do
    setup_guild

    d = Dig.create(:poster_id => 1, :diggable_id => @p.id, :diggable_type => 'Photo')
    @p.reload
    assert_nil d.errors.on_base
    assert_equal @p.digs_count, 1
  end

protected

  def setup_blog
    @b1 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 1})
    @b2 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 2})
    @b3 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 3})
    @b4 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 4})
  end

  def setup_Video
    @v1 = Video.create({:game_id => 1, :poster_id => 2, :title => 't', :privilege => 1, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.htmli"})
    @v2 = Video.create({:game_id => 1, :poster_id => 2, :title => 't', :privilege => 2, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.htmli"})
    @v3 = Video.create({:game_id => 1, :poster_id => 2, :title => 't', :privilege => 3, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.htmli"})
    @v4 = Video.create({:game_id => 1, :poster_id => 2, :title => 't', :privilege => 4, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.htmli"})
  end

  def setup_poll
    @p1 = Poll.create({:name => 'poll name', :game_id => 1, :poster_id => 2, :no_deadline => false, :deadline => 1.days.from_now.to_s(:db), :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}], :privilege => 1})
    @p2 = Poll.create({:name => 'poll name', :game_id => 1, :poster_id => 2, :no_deadline => false, :deadline => 1.days.from_now.to_s(:db), :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}], :privilege => 2})
  end

  def setup_personal_album
    @a1 = PersonalAlbum.create(:owner_id => 2, :game_id => 1, :title => 'album title', :description => 'description', :privilege => 1)
    @a2 = PersonalAlbum.create(:owner_id => 2, :game_id => 1, :title => 'album title', :description => 'description', :privilege => 2)
    @a3 = PersonalAlbum.create(:owner_id => 2, :game_id => 1, :title => 'album title', :description => 'description', :privilege => 3)
    @a4 = PersonalAlbum.create(:owner_id => 2, :game_id => 1, :title => 'album title', :description => 'description', :privilege => 4)
    @p1 = save_photo 'PersonalPhoto', :album_id => @a1.id
    @p2 = save_photo 'PersonalPhoto', :album_id => @a2.id
    @p3 = save_photo 'PersonalPhoto', :album_id => @a3.id
    @p4 = save_photo 'PersonalPhoto', :album_id => @a4.id
  end

  def setup_avatar_album
    @a = User.find(2).avatar_album
    @p = save_photo 'Avatar', :album_id => @a.id
  end

  def setup_event
    @e = Event.create({:game_id => 1, :game_area_id => 1, :game_server_id => 1, :poster_id => 2, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'event description'})
    @a = @e.album
    @p = save_photo 'EventPhoto', :album_id => @a.id, :poster_id => 2
  end

  def setup_guild
    @g = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => 2})
    @a = @g.album
    @p = save_photo 'GuildPhoto', :album_id => @a.id, :poster_id => 2
  end

  def save_photo photo_type, opts={}
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    photo_type.constantize.create({:uploaded_data => ActionController::TestUploadedFile.new(path, mimetype)}.merge(opts))
  end

end
