require 'test_helper'

class SharingTest < ActiveSupport::TestCase

  test "没有发布者" do
    s = Sharing.create(:poster_id => nil)
    assert_equal s.errors.on_base, "没有发布者"
  end

  test "没有被分享的资源" do
    s = Sharing.create(:poster_id => 1, :shareable_id => nil, :shareable_type => 'Blog')
    assert_equal s.errors.on_base, "没有被分享的资源"

    s = Sharing.create(:poster_id => 1, :shareable_id => 1, :shareable_type => nil)
    assert_equal s.errors.on_base, "没有被分享的资源"
  end

  test "被分享的资源不存在" do
    s = Sharing.create(:poster_id => 1, :shareable_id => 1, :shareable_type => 'Blog')
    assert_equal s.errors.on_base, "被分享的资源不存在"
  end

  test "已经分享过了" do
    setup_blog

    s = Sharing.create(:poster_id => 1, :shareable_id => @b1.id, :shareable_type => 'Blog')
    s = Sharing.create(:poster_id => 1, :shareable_id => @b1.id, :shareable_type => 'Blog')
    assert_equal s.errors.on_base, "已经分享过了"
  end

  # 分享博客
  test "分享权限是1的博客" do
  end

  # 分享视频

protected

  def setup_blog
    @b1 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 1})
    @b2 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 2})
    @b3 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 3})
    @b4 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 4})
  end

  def setup_video
    @v1 = Video.create({:game_id => 1, :poster_id => 2, :title => 't', :privilege => 1, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.htmli"})
    @v2 = Video.create({:game_id => 1, :poster_id => 2, :title => 't', :privilege => 2, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.htmli"}) 
    @v3 = Video.create({:game_id => 1, :poster_id => 2, :title => 't', :privilege => 3, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.htmli"}) 
    @v4 = Video.create({:game_id => 1, :poster_id => 2, :title => 't', :privilege => 4, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.htmli"}) 
  end

  def setup_status
    @s = Status.create({:poster_id => 2, :content => 'hello world'})
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
    @a = @user2.avatar_album
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

  def setup_poll
    @p1 = Poll.create({:name => 'poll name', :game_id => 1, :poster_id => 2, :no_deadline => false, :deadline => 1.days.from_now.to_s(:db), :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}], :privilege => 1})
    @p2 = Poll.create({:name => 'poll name', :game_id => 1, :poster_id => 2, :no_deadline => false, :deadline => 1.days.from_now.to_s(:db), :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}], :privilege => 2})
  end

  def setup_profile
    @p = @user2.profile
  end

  def save_photo photo_type, opts={}
    path = 'public/images/default_guild.jpg' 
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    photo_type.constantize.create({:uploaded_data => ActionController::TestUploadedFile.new(path, mimetype)}.merge(opts))
  end

end
