require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  fixtures :all

  def setup
    @forum = Forum.create(:name => 'forum', :description => 'forum')
    @topic = @forum.topics.create(:subject => 'subject', :content => 'content', :poster_id => 1)
    @forum.reload
  end

  test "没有发布者" do
    post = @topic.posts.create(:content => 'c', :forum_id => @forum.id)
    assert_equal post.errors.on_base, "没有发布者"
  end

  test "没有内容" do
    post = @topic.posts.create(:poster_id => 2, :forum_id => @forum.id)
    assert_equal post.errors.on_base, "没有内容"
  end

  test "没有论坛" do
    post = @topic.posts.create(:poster_id => 2, :content => 'c')
    assert_equal post.errors.on_base, "没有论坛" 
  end

  test "论坛不存在" do
    post = @topic.posts.create(:poster_id => 2, :content => 'c', :forum_id => 123)
    assert_equal post.errors.on_base, "论坛不存在"
  end

  test "没有话题" do
    post = Post.create(:poster_id => 2, :content => 'x', :forum_id => @forum.id)
    assert_equal post.errors.on_base, "没有话题"
  end

  test "话题不存在" do
    post = Post.create(:poster_id => 2, :content => 'x', :topic_id => 123123, :forum_id => @forum.id)
    assert_equal post.errors.on_base, "话题不存在"
  end
  
  test "计数器" do
    p1 = Post.create(:poster_id => 2, :content => 'x', :topic_id => @topic.id, :forum_id => @forum.id)
    @forum.reload
    @topic.reload
    assert_equal @forum.posts_count, 1
    assert_equal @forum.topics_count, 1
    assert_equal @topic.posts_count, 1
    
    p2 = Post.create(:poster_id => 2, :content => 'x', :topic_id => @topic.id, :forum_id => @forum.id)
    @forum.reload
    @topic.reload
    assert_equal @forum.posts_count, 2
    assert_equal @forum.topics_count, 1
    assert_equal @topic.posts_count, 2

    p3 = Post.create(:poster_id => 2, :content => 'x', :topic_id => @topic.id, :forum_id => @forum.id)
    @forum.reload
    @topic.reload
    assert_equal @forum.posts_count, 3
    assert_equal @forum.topics_count, 1
    assert_equal @topic.posts_count, 3

    # delete post2
    p2.destroy
    @forum.reload
    @topic.reload
    assert_equal @forum.posts_count, 2
    assert_equal @forum.topics_count, 1
    assert_equal @topic.posts_count, 2

    # delete topic
    @topic.destroy
    @forum.reload
    assert_equal @forum.posts_count, 0
    assert_equal @forum.topics_count, 0
    
  end

  test "测试 floor" do
    p1 = Post.create(:poster_id => 2, :content => 'x', :topic_id => @topic.id, :forum_id => @forum.id)
    assert_equal p1.floor, 1

    p2 = Post.create(:poster_id => 2, :content => 'x', :topic_id => @topic.id, :forum_id => @forum.id)
    assert_equal p2.floor, 2

    p3 = Post.create(:poster_id => 2, :content => 'x', :topic_id => @topic.id, :forum_id => @forum.id)
    assert_equal p3.floor, 3

    # delete post2
    p3.destroy
    p1.reload
    p2.reload
    assert_equal p1.floor, 1
    assert_equal p2.floor, 2

    p4 = Post.create(:poster_id => 2, :content => 'x', :topic_id => @topic.id, :forum_id => @forum.id)
    assert_equal p3.floor, 3
  end

end
