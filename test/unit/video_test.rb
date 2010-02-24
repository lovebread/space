require 'test_helper'

class VideoTest < ActiveSupport::TestCase

  fixtures :all

  def setup
    @game = Game.find(1)
    @user1 = User.find(1)
    @user2 = User.find(2)
    @user3 = User.find(3)
    @user4 = User.find(4)
    @params = {:game_id => @game.id, :poster_id => @user1.id, :title => 'video title', :privilege => 1, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.html"} 
    reload 
  end

  # 测试计数器
  test "用户的计数器" do
    @video = Video.create(@params)
    reload
    assert_equal @user1.videos_count, 1
  end

  # 测试validate
  test "没有标题" do
    @video = Video.create(@params.merge({:title => nil}))
    assert_equal @video.errors.on(:title), "不能为空"
  end

  test "没有url" do
    @video = Video.create(@params.merge({:video_url => nil}))
    assert_equal @video.errors.on(:video_url), "不能为空"
  end

  test "无法识别的url" do
    @video = Video.create(@params.merge({:video_url => 'ads!@#$dfas.adsf'}))
    @user1.reload
    assert_equal Video.count, 0
    assert_equal @user1.videos_count, 0
    assert_equal @video.errors.on_base, "不能识别的视频url"
  end

  test "没有游戏类别" do
    @video = Video.create(@params.merge({:game_id => nil}))
    assert_equal @video.errors.on(:game_id), "不能为空"
  end

  test "游戏不存在" do
    @video = Video.create(@params.merge({:game_id => 111}))
    assert_equal @video.errors.on(:game_id), "不存在"
  end

  test "该用户没有这个游戏" do
    @video = Video.create(@params.merge({:game_id => 4}))
    assert_equal @video.errors.on(:game_id), "该用户没有这个游戏"
  end

  test "没有作者" do
    @video = Video.create(@params.merge({:poster_id => nil}))
    assert_equal @video.errors.on(:poster_id), "不能为空"
  end

  # 创建带有tag的video
  test "创建带有tag的视频" do
    @params.merge!({:new_friend_tags => [@user2.id, @user3.id]})
    @video = Video.create(@params)
    @video.reload
    assert_equal @video.tags_count, 2 
  end

  test "创建带有tag的视频，但是tag的不是好友" do
    @params.merge!({:new_friend_tags => [@user2.id, @user4.id]})
    @video = Video.create(@params)
    @video.reload
    assert_equal @video.tags_count, 1
  end

  # 测试hot, recent, friends
  test "hot page" do
    v1 = Video.create(@params.merge({:digs_count => 1, :privilege => 1}))
    v2 = Video.create(@params.merge({:digs_count => 2, :privilege => 2}))
    v3 = Video.create(@params.merge({:digs_count => 3, :privilege => 3}))
    v4 = Video.create(@params.merge({:digs_count => 4, :privilege => 4}))
    hots = Video.hot
    assert_equal hots.count, 3
    assert_equal hots[0], v3
    assert_equal hots[1], v2
    assert_equal hots[2], v1
  end

  test "recent page" do
    v1 = Video.create(@params.merge({:created_at => 1.days.ago, :privilege => 1}))
    v2 = Video.create(@params.merge({:created_at => 2.days.ago, :privilege => 2}))
    v3 = Video.create(@params.merge({:created_at => 3.days.ago, :privilege => 3}))
    v4 = Video.create(@params.merge({:created_at => 4.days.ago, :privilege => 4}))
    recents = Video.recent
    assert_equal recents.count, 3 
    assert_equal recents[0], v1
    assert_equal recents[1], v2
    assert_equal recents[2], v3
  end

  test "friend page" do
    v1 = Video.create(@params.merge({:created_at => 1.days.ago, :privilege => 1}))
    v2 = Video.create(@params.merge({:created_at => 2.days.ago, :privilege => 2}))
    v3 = Video.create(@params.merge({:created_at => 3.days.ago, :privilege => 3}))
    v4 = Video.create(@params.merge({:created_at => 4.days.ago, :privilege => 4}))
    videos = @user2.video_feed_items.map(&:originator)
    assert_equal videos.count, 3
  end

protected

  def reload
    @user1.reload
    @user2.reload
    @user3.reload
    @user4.reload
  end

end
