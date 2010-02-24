require 'test_helper'

class BlogTest < ActiveSupport::TestCase

  fixtures :all 

  def setup
    @game = Game.find(1)
    @user1 = User.find(1)
    @user2 = User.find(2)
    @user3 = User.find(3)
    @user4 = User.find(4)
    @params = {:game_id => @game.id, :poster_id => @user1.id, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 1} 
    reload
  end
 
  # 测试app/observer/blog_observer.rb
  test "保存日志，日志数增加1" do
    @blog = Blog.create(@params) 
    reload
    assert_equal @user1.blogs_count, 1
    assert_equal @user1.drafts_count, 0
  end

  test "更新日志，日志数和草稿数不变" do
    @blog = Blog.create(@params)
    @blog.update_attributes(:title => '标题')
    reload
    assert_equal @user1.blogs_count, 1
    assert_equal @user1.drafts_count, 0
  end

  test "保存草稿，草稿数增加1" do
    @blog = Blog.create(@params.merge({:draft => true}))
    reload
    assert_equal @user1.blogs_count, 0
    assert_equal @user1.drafts_count, 1
  end

  test "更新草稿，草稿数和日志数不变" do
    @blog = Blog.create(@params.merge({:draft => true}))
    @blog.update_attributes(:title => '标题')
    reload
    assert_equal @user1.blogs_count, 0
    assert_equal @user1.drafts_count, 1
  end

  test "把草稿变为日志，草稿数减1，日志数加1" do
    @blog = Blog.create(@params.merge({:draft => true}))
    @blog.update_attributes(:title => '标题', :draft => false)
    reload
    assert_equal @user1.blogs_count, 1
    assert_equal @user1.drafts_count, 0
  end

  test "删除日志，日志数减1" do
    @blog = Blog.create(@params)
    @blog.destroy
    reload
    assert_equal @user1.blogs_count, 0
    assert_equal @user1.drafts_count, 0
  end

  test "删除草稿，草稿数减1" do
    @blog = Blog.create(@params.merge({:draft => true}))
    @blog.destroy
    reload
    assert_equal @user1.blogs_count, 0
    assert_equal @user1.drafts_count, 0
  end

  # 测试 validate
  test "没有作者" do
    @blog = Blog.create(@params.merge({:poster_id => nil}))
    assert_equal @blog.errors.on_base, "没有作者"
  end

  test "没有标题" do
    @blog = Blog.create(@params.merge({:title => nil}))
    assert_equal @blog.errors.on_base, "标题不能为空" 
  end

  test "没有内容" do
    @blog = Blog.create(@params.merge({:content => nil}))
    assert_equal @blog.errors.on_base, "内容不能为空"
  end

  test "没有游戏类别" do
    @blog = Blog.create(@params.merge({:game_id => nil}))
    assert_equal @blog.errors.on_base, "请选择游戏类别"
  end

  test "游戏不存在" do
    @blog = Blog.create(@params.merge({:game_id => 222}))
    assert_equal @blog.errors.on_base, "游戏不存在"
  end

  #
  # 创建日志（日志有标记好友）
  #
  test "创建带好友标记的日志" do
    @params.merge!({:friend_tags => [@user2.id, @user3.id]})
    @blog = Blog.create(@params)
    @blog.reload
    @user1.reload
    assert_equal @user1.blogs_count, 1
    assert_equal @blog.tags_count, 2
  end

  test "创建带好友标记的日志，但是标记的不是好友" do
    @params.merge!({:friend_tags => [@user2.id, @user3.id, @user4.id]})
    @blog = Blog.create(@params)
    @blog.reload
    @user1.reload
    assert_equal @user1.blogs_count, 1
    assert_equal @blog.tags_count, 2
  end

  test "创建好友标记的日志，然后删除其中一个标记" do
    @params.merge!({:friend_tags => [@user2.id, @user3.id]})
    @blog = Blog.create(@params)
    @blog.tags.find_by_tagged_user_id(@user2.id).destroy
    @blog.reload
    assert_equal @blog.tags_count, 1
  end

  # 测试hot, recent, friends
  test "hot page" do
    v1 = Blog.create(@params.merge({:digs_count => 1, :privilege => 1}))
    v2 = Blog.create(@params.merge({:digs_count => 2, :privilege => 2}))
    v3 = Blog.create(@params.merge({:digs_count => 3, :privilege => 3}))
    v4 = Blog.create(@params.merge({:digs_count => 4, :privilege => 4}))
    hots = Blog.hot
    assert_equal hots.count, 3
    assert_equal hots[0], v3
    assert_equal hots[1], v2
    assert_equal hots[2], v1
  end

  test "recent page" do
    v1 = Blog.create(@params.merge({:created_at => 1.days.ago, :privilege => 1}))
    v2 = Blog.create(@params.merge({:created_at => 2.days.ago, :privilege => 2}))
    v3 = Blog.create(@params.merge({:created_at => 3.days.ago, :privilege => 3}))
    v4 = Blog.create(@params.merge({:created_at => 4.days.ago, :privilege => 4}))
    recents = Blog.recent
    assert_equal recents.count, 3
    assert_equal recents[0], v1
    assert_equal recents[1], v2
    assert_equal recents[2], v3
  end

  test "friend page" do
    v1 = Blog.create(@params.merge({:created_at => 1.days.ago, :privilege => 1}))
    v2 = Blog.create(@params.merge({:created_at => 2.days.ago, :privilege => 2}))
    v3 = Blog.create(@params.merge({:created_at => 3.days.ago, :privilege => 3}))
    v4 = Blog.create(@params.merge({:created_at => 4.days.ago, :privilege => 4}))
    blogs = @user2.blog_feed_items.map(&:originator)
    assert_equal blogs.count, 3
  end

  
private

  def reload
    @user1.reload
    @user2.reload
    @user3.reload
  end

end
