require 'test_helper'

class TaggingTest < ActiveSupport::TestCase

  fixtures :all

  def setup
    @g = Game.find(1)
    @p = User.find(2).profile
  end

  test "没有标签" do
    t = Tagging.create(:poster_id => 1, :taggable_type => 'Game', :taggable_id => 1, :tag_name => nil)
    assert_equal t.errors.on_base, '没有标签'
    assert_nil Tag.find_by_name('hello')
  end

  test "没有发布者" do
    t = Tagging.create(:poster_id => nil, :taggable_type => 'Game', :taggable_id => 1, :tag_name => 'hello')
    assert_equal t.errors.on_base, '没有发布者'
    assert_nil Tag.find_by_name('hello')
  end

  test "没有被标记的资源" do
    t = Tagging.create(:poster_id => 1, :taggable_type => nil, :taggable_id => 1, :tag_name => 'hello')
    assert_equal t.errors.on_base, '没有被标记的资源'
    assert_nil Tag.find_by_name('hello')

    t = Tagging.create(:poster_id => 1, :taggable_type => 'Game', :taggable_id => nil, :tag_name => 'world')
    assert_equal t.errors.on_base, '没有被标记的资源'
    assert_nil Tag.find_by_name('world')
  end

  test "被标记的资源不存在" do
    t = Tagging.create(:poster_id => 1, :taggable_type => 'Game', :taggable_id => 1234, :tag_name => 'hello')
    assert_equal t.errors.on_base, '被标记的资源不存在'
    assert_nil Tag.find_by_name('hello')
  end

  # 标记 游戏
  test "标记游戏" do
    Tagging.create(:poster_id => 1, :taggable_id => 1, :taggable_type => 'Game', :tag_name => 'hello')
    @g.reload
    t = Tag.find_by_name('hello')
    assert_equal t.taggings_count, 1
    assert_equal t.taggable_type, 'Game'
    assert_equal @g.taggings.count, 1

    Tagging.create(:poster_id => 1, :taggable_id => 1, :taggable_type => 'Game', :tag_name => 'world')
    @g.reload
    t = Tag.find_by_name('world')
    assert_nil t
    assert_equal @g.taggings.count, 1
  end

  # 目前游戏的标记还没人可以删除

  # 标记 profile
  test "本人标记profile" do
    t = Tagging.create(:poster_id => 2, :taggable_id => @p.id, :taggable_type => 'Profile', :tag_name => 'hello')
    @p.reload
    assert_nil Tag.find_by_name('hello')
    assert_equal t.errors.on_base, "没有权限标记"
    assert_equal @p.taggings.count, 0
  end

  test "好友标记profile" do
    t1 = Tagging.create(:poster_id => 1, :taggable_id => @p.id, :taggable_type => 'Profile', :tag_name => 'hello')
    @p.reload
    tag = Tag.find_by_name('hello')
    assert_equal tag.taggings_count, 1
    assert_equal tag.taggable_type, 'Profile'
    assert_nil t1.errors.on_base
    assert_equal @p.taggings.count, 1

    t2 = Tagging.create(:poster_id => 1, :taggable_id => @p.id, :taggable_type => 'Profile', :tag_name => 'world')
    @p.reload
    tag = Tag.find_by_name('world')
    assert_nil tag
    assert_equal t2.errors.on_base, "没有权限标记"
    assert_equal @p.taggings.count, 1
  end

  test "相同游戏标记profile" do
    t2 = Tagging.create(:poster_id => 3, :taggable_id => @p.id, :taggable_type => 'Profile', :tag_name => 'world')
    @p.reload
    tag = Tag.find_by_name('world')
    assert_nil tag
    assert_equal t2.errors.on_base, "没有权限标记"
    assert_equal @p.taggings.count, 0
  end

  test "陌生人标记profile" do
    t2 = Tagging.create(:poster_id => 4, :taggable_id => @p.id, :taggable_type => 'Profile', :tag_name => 'world')
    @p.reload
    tag = Tag.find_by_name('world')
    assert_nil tag
    assert_equal t2.errors.on_base, "没有权限标记"
    assert_equal @p.taggings.count, 0
  end

  test "删除profile标记" do
    t2 = Tagging.create(:poster_id => 1, :taggable_id => @p.id, :taggable_type => 'Profile', :tag_name => 'hello')
    t2.destroy
    @p.reload
    tag = Tag.find_by_name('hello')
    assert_equal @p.taggings.count, 0
    assert_equal tag.taggings_count, 0
  end

  # 测试 add_tag
  test "测试 game.add_tag" do
    @g.add_tag User.find(1), 'hello'
    t = Tag.find_by_name('hello')
    assert_not_nil t
    assert_equal t.taggings_count, 1
    assert_equal @g.taggings.count, 1
  end

  test "测试 profile.add_tag" do
    # 有权限
    t = @p.add_tag User.find(1), 'h1'
    t = Tag.find_by_name('h1')
    assert_not_nil t
    assert_equal t.taggings_count, 1
    assert_equal @p.taggings.count, 1

    # 没有权限
    @p.add_tag User.find(1), 'h11'
    t = Tag.find_by_name('h11')
    assert_nil t
    assert_equal @p.taggings.count, 1    
  
    @p.add_tag User.find(3), 'h11'   
    t = Tag.find_by_name('h11')  
    assert_nil t
    assert_equal @p.taggings.count, 1
  end

  # 测试 destroy_taggings
  test "测试 game.destroy_taggings" do
    @g.add_tag User.find(1), 'hello'
    @g.add_tag User.find(2), 'world'
    t1 = Tag.find_by_name('hello')
    t2 = Tag.find_by_name('world')
 
    @g.destroy_tag 'hello'
    @g.reload
    t1.reload
    assert_not_nil t1
    assert_equal @g.taggings.count, 1
    assert_equal t1.taggings_count, 0

    @g.destroy_tag 'world'
    @g.reload
    t2.reload
    assert_not_nil t2
    assert_equal @g.taggings.count, 0
    assert_equal t2.taggings_count, 0
  end

  test "测试 profile.destroy_taggings" do
    @p.add_tag User.find(1), 'hello'
    t1 = Tag.find_by_name('hello')

    @p.destroy_tag 'hello'
    @p.reload
    t1.reload
    assert_not_nil t1
    assert_equal @p.taggings.count, 0
    assert_equal t1.taggings_count, 0
  end

end
