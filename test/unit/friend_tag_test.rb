require 'test_helper'

class FriendTagTest < ActiveSupport::TestCase

  # 测试 validate
  test "没有发布者" do
    t = FriendTag.create(:poster_id => nil)
    assert_equal t.errors.on_base, "没有发布者"
  end

  test "没有被标记的人" do
    t = FriendTag.create(:tagged_user_id => nil, :poster_id => 2)
    assert_equal t.errors.on_base, "没有被标记的人"
  end

  test "被标记的人不是好友或本人" do
    t = FriendTag.create(:tagged_user_id => 4, :poster_id => 2)
    assert_equal t.errors.on_base, "被标记的不是好友或本人"
  end

  test "没有资源" do
    t = FriendTag.create(:taggable_id => nil, :tagged_user_id => 1, :poster_id => 2)
    assert_equal t.errors.on_base, "没有被标记的资源"
  
    t = FriendTag.create(:taggable_id => 1, :taggable_type => nil, :tagged_user_id => 1, :poster_id => 2)
    assert_equal t.errors.on_base, "没有被标记的资源"
  end

  test "资源不存在" do
    t = FriendTag.create(:taggable_id => 2323, :taggable_type => 'Blog', :tagged_user_id => 1, :poster_id => 2)
    assert_equal t.errors.on_base, "被标记的资源不存在"
  end

  test "没有权限标记" do
    setup_blog

    t = FriendTag.create(:taggable_id => @b1.id, :taggable_type => 'Blog', :tagged_user_id => 1, :poster_id => 3)
    assert_equal t.errors.on_base, "没有权限标记"
  end

  test "不能重复标记" do
    setup_blog

    FriendTag.create(:taggable_id => @b1.id, :taggable_type => 'Blog', :tagged_user_id => 1, :poster_id => 2)
    t = FriendTag.create(:taggable_id => @b1.id, :taggable_type => 'Blog', :tagged_user_id => 1, :poster_id => 2)
    assert_equal t.errors.on_base, "已经标记过了"
  end 

  # 标记 日志
  test "本人标记日志" do
    setup_blog

    t = FriendTag.create(:taggable_id => @b1.id, :taggable_type => 'Blog', :tagged_user_id => 1, :poster_id => 2)
    @b1.reload
    assert_equal @b1.tags_count, 1

    t.destroy
    @b1.reload
    assert_equal @b1.tags_count, 0
  end

  test "别人标记日志" do
    setup_blog

    t = FriendTag.create(:taggable_id => @b1.id, :taggable_type => 'Blog', :tagged_user_id => 1, :poster_id => 3)
    @b1.reload
    assert_equal @b1.tags_count, 0
  end

  # 标记 视频
  test "本人标记视频" do
    setup_video

    t = FriendTag.create(:taggable_id => @v1.id, :taggable_type => 'Video', :tagged_user_id => 1, :poster_id => 2)
    @v1.reload
    assert_equal @v1.tags_count, 1

    t.destroy
    @v1.reload
    assert_equal @v1.tags_count, 0
  end

  test "别人标记视频" do
    setup_video

    t = FriendTag.create(:taggable_id => @v1.id, :taggable_type => 'Video', :tagged_user_id => 1, :poster_id => 3)
    @v1.reload
    assert_equal @v1.tags_count, 0
  end  

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

end
