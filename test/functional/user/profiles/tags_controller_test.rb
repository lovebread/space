require 'test_helper'

class User::Profiles::TagsControllerTest < ActionController::TestCase

  fixtures :all

  def setup
    @user = User.find(2)
    @profile = @user.profile
  end
  
  # 测试 create
  test "本人创建" do
    post 'create', {:profile_id => @profile.id, :name => '2b'}, {:user_id => 2}
    @profile.reload
    tag = Tag.find_by_name('2b')
    assert_nil tag
    assert_equal @profile.taggings.count, 0
  end

  test "好友创建" do
    post 'create', {:profile_id => @profile.id, :name => '2b'}, {:user_id => 1}
    @profile.reload
    tag = Tag.find_by_name('2b')
    assert_equal tag.taggings_count, 1
    assert_equal @profile.taggings.count, 1

    post 'create', {:profile_id => @profile.id, :name => '2b'}
    @profile.reload
    tag.reload
    assert_equal tag.taggings_count, 1
    assert_equal @profile.taggings.count, 1
  
    post 'create', {:profile_id => @profile.id, :name => 'sb'}, {:user_id => 1}
    @profile.reload
    tag = Tag.find_by_name('sb')
    assert_nil tag
    assert_equal @profile.taggings.count, 1
  end

  test "相同游戏的人创建" do
    post 'create', {:profile_id => @profile.id, :name => '2b'}, {:user_id => 3}
    @profile.reload
    tag = Tag.find_by_name('2b')
    assert_nil tag
    assert_equal @profile.taggings.count, 0
  end

  test "陌生人创建" do
    post 'create', {:profile_id => @profile.id, :name => '2b'}, {:user_id => 4}
    @profile.reload
    tag = Tag.find_by_name('2b')
    assert_nil tag 
    assert_equal @profile.taggings.count, 0
  end

  # 测试 destroy
  test "本人删除" do
    @profile.add_tag User.find(1), 'sb'
    tag = Tag.find_by_name('sb')
    
    delete 'destroy', {:id => tag.id}, {:user_id => 2}
    tag.reload
    @profile.reload

    assert_not_nil tag
    assert_equal tag.taggings_count, 1
    assert_equal @profile.taggings.count, 1
  end

  test "好友删除" do
    @profile.add_tag User.find(1), 'sb'
    tag = Tag.find_by_name('sb')
    
    delete 'destroy', {:id => tag.id}, {:user_id => 1}
    assert_template 'not_found'
  end

  test "相同游戏的人删除" do
    @profile.add_tag User.find(1), 'sb'
    tag = Tag.find_by_name('sb')

    delete 'destroy', {:id => tag.id}, {:user_id => 3}
    assert_template 'not_found'
  end

  test "陌生人删除" do
    @profile.add_tag User.find(1), 'sb'
    tag = Tag.find_by_name('sb')

    delete 'destroy', {:id => tag.id}, {:user_id => 4}
    assert_template 'not_found'
  end

end
