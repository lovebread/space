require 'test_helper'

class TopicTest < ActiveSupport::TestCase

  fixtures :all

  def setup
    @forum = Forum.create(:name => 'forum', :description => 'forum')
  end
  
  test "没有发布者" do
    topic = Topic.create(:subject => 's', :content => 'c', :forum_id => @forum.id)
    assert_equal topic.errors.on_base, "没有发布者"
  end

  test "没有标题" do
    topic = Topic.create(:poster_id => 1, :content => 'c', :forum_id => @forum.id)
    assert_equal topic.errors.on_base, "没有标题"
  end

  test "没有内容" do
    topic = Topic.create(:poster_id => 1, :subject => 'c', :forum_id => @forum.id)
    assert_equal topic.errors.on_base, "没有内容"
  end

  test "没有论坛" do
    topic = Topic.create(:poster_id => 1, :content => 'c', :subject => 's')
    assert_equal topic.errors.on_base, "没有论坛"
  end

  test "论坛不存在" do
    topic = Topic.create(:poster_id => 1, :content => 'c', :forum_id => 123)
    assert_equal topic.errors.on_base, "论坛不存在"
  end

  test "计数器" do
    topic = Topic.create(:poster_id => 1, :content => 'c', :subject => 's', :forum_id => @forum.id)
    @forum.reload
    assert_equal @forum.topics_count, 1
    
    topic.destroy
    @forum.reload
    assert_equal @forum.topics_count, 0
  end 

  test "置顶" do
    t1 = Topic.create(:poster_id => 1, :content => 'c', :subject => 's', :forum_id => @forum.id, :top => true)
    t2 = Topic.create(:poster_id => 1, :content => 'c', :subject => 's', :forum_id => @forum.id, :top => true)
    tops = @forum.topics.tops
    assert_equal tops.count, 2
    assert_equal tops[0], t1
    assert_equal tops[1], t2

    t3 = Topic.create(:poster_id => 1, :content => 'c', :subject => 's', :forum_id => @forum.id, :top => false)
    t4 = Topic.create(:poster_id => 1, :content => 'c', :subject => 's', :forum_id => @forum.id, :top => false)
    normals = @forum.topics.normals
    assert_equal normals.count, 2
    assert_equal normals[0], t3
    assert_equal normals[1], t4
  end

end
