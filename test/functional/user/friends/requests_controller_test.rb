require 'test_helper'

class User::Friends::RequestsControllerTest < ActionController::TestCase

  def setup
    @user1 = User.find(1)
    @user2 = User.find(2)
    @user3 = User.find(3)
    @user4 = User.find(4)
  end 

  # 测试 new
  test "已经是好友了,试图发送好友请求" do
    get 'new', {:friend_id => 2}, {:user_id => 1}
    assert_template 'user/friends/requests/new'
  end

  test "已经发送好友请求了，试图发送好友请求" do
    Friendship.create(:user_id => 3, :friend_id => 2, :status => 0) 
    get 'new', {:friend_id => 2}, {:user_id => 3}
    assert_template 'user/friends/requests/new'
  end

  test "不是好友的也没发送好友请求的，试图发送好友请求" do
    get 'new', {:friend_id => 2}, {:user_id => 3}
    assert_template 'user/friends/requests/new'
  end

  test "不是好友的也没发送好友请求的，试图发送好友请求，请求的参数有问题" do
    get 'new', {:friend_id => 23}, {:user_id => 1}
    assert_template 'not_found'
  end

  # 测试 create
  test "已经是好友了，发送好友请求" do
    post 'create', {:request => {:friend_id => 2}}, {:user_id => 1}
    @user2.reload
    @user1.reload
    assert_not_nil assigns(:request).errors.on_base
    assert_equal @user2.friend_requests_count, 0
    assert_equal @user2.friends_count, 1
    assert_equal @user1.friends_count, 2
  end

  test "已经发送好友请求了，发送好友请求" do
    Friendship.create(:user_id => 3, :friend_id => 2, :status => 0)
    @user2.reload
    @user3.reload
    assert_equal @user2.friend_requests_count, 1
    assert_equal @user2.friends_count, 1
    assert_equal @user3.friends_count, 1
    
    post 'create', {:request => {:friend_id => 2}}, {:user_id => 3}
    @user2.reload
    @user3.reload
    assert_not_nil assigns(:request).errors.on_base
    assert_equal @user2.friend_requests_count, 1
    assert_equal @user2.friends_count, 1
    assert_equal @user3.friends_count, 1
  end

  test "不是好友的也没发送好友请求的，发送好友请求" do
    post 'create', {:request => {:friend_id => 2}}, {:user_id => 3}
    @user2.reload
    @user3.reload
    assert_nil assigns(:request).errors.on_base 
    assert_equal @user2.friend_requests_count, 1
    assert_equal @user2.friends_count, 1
    assert_equal @user3.friends_count, 1 
  end

  # 测试 accept
  test "被请求的人接受好友请求" do
    f = Friendship.create(:user_id => 3, :friend_id => 2, :status => 0)
    put 'accept', {:id => f.id}, {:user_id => 2}
    @user2.reload
    @user3.reload
    assert_equal @user2.friends_count, 2
    assert_equal @user3.friends_count, 2
  end

  test "不是被请求的人接受好友请求" do
    f = Friendship.create(:user_id => 3, :friend_id => 2, :status => 0)
    put 'accept', {:id => f.id}, {:user_id => 3}
    assert_template 'not_found'
  end

  # 测试 decline
  test "被请求的人拒绝好友请求" do
    f = Friendship.create(:user_id => 3, :friend_id => 2, :status => 0)
    delete 'decline', {:id => f.id}, {:user_id => 2}
    @user2.reload
    @user3.reload
    assert_equal @user2.friends_count, 1
    assert_equal @user3.friends_count, 1
  end

  test "不是被请求的人拒绝好友请求" do
    f = Friendship.create(:user_id => 3, :friend_id => 2, :status => 0)
    delete 'decline', {:id => f.id}, {:user_id => 3}
    assert_template 'not_found'
  end

end
