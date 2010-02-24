require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase

  fixtures :all
  
  def setup
    @user1 = User.find(1)
    @user2 = User.find(2)
    @user3 = User.find(3)
    @user4 = User.find(4)
    reload
  end

  # 测试 app/observer/friendship_observer.rb
  test "好友计数器" do
    Friendship.create(:friend_id => @user4.id, :user_id => @user1.id, :status => 1)
    Friendship.create(:friend_id => @user1.id, :user_id => @user4.id, :status => 1)
    reload
    assert_equal @user1.friends_count, 3
    assert_equal @user4.friends_count, 1
  end

  test "请求发送后，被请求者计数器加1" do
    @friendship = Friendship.create(:friend_id => @user3.id, :user_id => @user2.id, :status => 0)
    reload
    assert_equal @user2.friend_requests_count, 0
    assert_equal @user3.friend_requests_count, 1
    assert_equal @user2.friends_count, 1
    assert_equal @user3.friends_count, 1
  end

  test "请求被接受后，两方的计数器都增加1" do
    @friendship = Friendship.create(:friend_id => @user3.id, :user_id => @user2.id, :status => 0)
    @friendship.accept
    reload
    assert_equal @user2.friends_count, 2
    assert_equal @user3.friend_requests_count, 0
    assert_equal @user3.friends_count, 2
  end

  test "请求被拒绝后，被请求者的计数器减一" do
    @friendship = Friendship.create(:friend_id => @user3.id, :user_id => @user2.id, :status => 0)
    @friendship.destroy
    reload
    assert_equal @user2.friends_count, 1
    assert_equal @user3.friend_requests_count, 0
    assert_equal @user3.friends_count, 1
  end

  test "解除好友关系后，两方的计数器都件减一" do
    @f1 = @user1.friendships.find_by_friend_id(@user2.id)
    @f2 = @user2.friendships.find_by_friend_id(@user1.id)
    @f1.destroy
    @f2.destroy
    reload
    assert_equal @user1.friends_count, 1
    assert_equal @user2.friends_count, 0
  end

  # 测试validate
  test "缺少user_id" do
    @friendship = Friendship.create(:friend_id => @user3.id, :status => 0)
    assert_equal @friendship.errors.on_base, "user_id不能为空"
    @friendship = @user1.friendships.find_by_friend_id(@user2.id)
    @friendship.update_attributes(:user_id => nil)
    assert_equal @friendship.errors.on_base, "user_id不能为空"
  end

  test "缺少friend_id" do
    @friendship = Friendship.create(:user_id => @user2.id, :status => 0)
    assert_equal @friendship.errors.on_base, "friend_id不能为空"
    @friendship = @user1.friendships.find_by_friend_id(@user2.id)
    @friendship.update_attributes(:friend_id => nil)
    assert_equal @friendship.errors.on_base, "friend_id不能为空"
  end

  test "状态为空" do
    @friendship = Friendship.create(:user_id => @user2.id, :friend_id => @user3.id)
    assert_equal @friendship.errors.on_base, "状态不能为空"
  end

  test "状态不对" do
    @friendship = Friendship.create(:user_id => @user2.id, :friend_id => @user3.id, :status => 3)
    assert_equal @friendship.errors.on_base, "状态不对"
  end

  # 测试validate_on_update
  test "将stauts从1变成0" do
    @friendship = @user1.friendships.find_by_friend_id(@user2.id)
    @friendship.update_attributes(:status => 0)
    assert_equal @friendship.errors.on_base, '不能更新为请求'
  end

  # 测试validate_on_create
  # TODO
  test "无法直接保存为好友" do
  end

  test "如果已经是好友了，无法再创建好友请求" do
    @friendship = Friendship.create(:user_id => @user2.id, :friend_id => @user1.id, :status => 0)
    assert_equal @friendship.errors.on_base, "你们已经是好友了"
  end

  test "如果已经是好友了，无法再创建friendship" do
    @friendship = Friendship.create(:user_id => @user2.id, :friend_id => @user1.id, :status => 1)
    assert_equal @friendship.errors.on_base, "你们已经是好友了"
  end

  test "如果已经发送好友请求了，无法再创建好友请求" do
    @friendship = Friendship.create(:user_id => @user2.id, :friend_id => @user3.id, :status => 0)
    assert_nil @friendship.errors.on_base
    @friendship = Friendship.create(:user_id => @user2.id, :friend_id => @user3.id, :status => 0)
    assert_equal @friendship.errors.on_base, "你已经申请加他为好友了"  
  end

  # 测试 取消好友
  test "取消好友" do
    @friendship = @user1.friendships.find_by_friend_id(@user2.id)
    @friendship.cancel
    @user1.reload
    @user2.reload
    assert_equal @user1.friends_count, 1
    assert_equal @user2.friends_count, 0 
  end 

  # 好友新鲜事
  test "好友的新鲜事" do
    # user1 和 user4成为好友
    @friendship = Friendship.create(:friend_id => @user1.id, :user_id => @user4.id, :status => 0)
    @friendship.accept
    reload
    assert_equal @user1.friendship_feed_items.count, 0
    assert_equal @user2.friendship_feed_items.count, 1
    assert_equal @user3.friendship_feed_items.count, 1
    assert_equal @user4.friendship_feed_items.count, 0

    # user2 和 user3成为好朋友
    @friendship = Friendship.create(:friend_id => @user2.id, :user_id => @user3.id, :status => 0)
    @friendship.accept
    reload
    assert_equal @user1.friendship_feed_items.count, 1
    assert_equal @user2.friendship_feed_items.count, 1
    assert_equal @user3.friendship_feed_items.count, 1
    assert_equal @user4.friendship_feed_items.count, 0
  end

private

  def reload
    @user1.reload
    @user2.reload
    @user3.reload
    @user4.reload
  end

end
