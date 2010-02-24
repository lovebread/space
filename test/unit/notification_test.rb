require 'test_helper'

class NotificationTest < ActiveSupport::TestCase

  def setup
    @user1 = User.find(1)
    @user2 = User.find(2)
    @user3 = User.find(3)
    @user4 = User.find(4)
  end

  test "没有接受者" do
    n = Notification.create(:user_id => nil)
    assert_equal n.errors.on_base, "没有接受者"
  end

  test "没有内容" do
    n = Notification.create(:user_id => 2, :data => nil)
    assert_equal n.errors.on_base, "没有内容"
  end

  test "接受好友请求" do
    setup_friendship

    @r.accept
    @user4.reload  
    assert_equal @user4.notifications_count, 1
    assert_equal @user4.unread_notifications_count, 1
    @user1.reload
    assert_equal @user1.notifications_count, 0
    assert_equal @user1.unread_notifications_count, 0
  end

  test "拒绝好友请求" do
    setup_friendship

    @r.destroy
    @user4.reload
    assert_equal @user4.notifications_count, 1
    assert_equal @user4.unread_notifications_count, 1
    @user1.reload
    assert_equal @user1.notifications_count, 0
    assert_equal @user1.unread_notifications_count, 0
  end

  test "解除好友关系" do
    setup_friendship

    @f.cancel
    @user2.reload
    assert_equal @user2.notifications_count, 1
    assert_equal @user2.unread_notifications_count, 1
    @user1.reload
    assert_equal @user1.notifications_count, 1
    assert_equal @user1.unread_notifications_count, 1
  end  

  test "改动活动的时间，地点" do
    setup_event

    @e.update_attributes(:game_id => 1, :game_area_id => 1, :game_server_id => 2)
    @user4.reload
    assert_equal @user4.notifications_count, 1
    assert_equal @user4.unread_notifications_count, 1

    @e.update_attributes(:end_time => 4.days.from_now.to_s(:db))
    @user4.reload
    assert_equal @user4.notifications_count, 2
    assert_equal @user4.unread_notifications_count, 2 
  end

  test "取消活动" do
    setup_event

    @e.destroy
    @user4.reload
    assert_equal @user4.notifications_count, 1
    assert_equal @user4.unread_notifications_count, 1 
  end

  test "拒绝活动请求" do
    setup_event

    @r.destroy
    @user3.reload
    assert_equal @user3.notifications_count, 1
    assert_equal @user3.unread_notifications_count, 1
    @user1.reload
    assert_equal @user1.notifications_count, 0
    assert_equal @user1.unread_notifications_count, 0
  end

  test "接受活动请求" do
    setup_event

    @r.accept
    @user3.reload
    assert_equal @user3.notifications_count, 1
    assert_equal @user3.unread_notifications_count, 1
    @user1.reload
    assert_equal @user1.notifications_count, 0
    assert_equal @user1.unread_notifications_count, 0
  end

  test "接受活动邀请" do
    setup_event

    @i.update_attributes(:status => 4)
    @user2.reload
    assert_equal @user3.notifications_count, 0
    assert_equal @user3.unread_notifications_count, 0
    @user1.reload
    assert_equal @user1.notifications_count, 1
    assert_equal @user1.unread_notifications_count, 1
  end

  test "拒绝工会请求" do
    setup_guild

    @r.destroy
    @user3.reload
    assert_equal @user3.notifications_count, 1
    assert_equal @user3.unread_notifications_count, 1
    @user1.reload
    assert_equal @user1.notifications_count, 0
    assert_equal @user1.unread_notifications_count, 0
  end

  test "接受工会请求" do
    setup_guild

    @r.accept_request
    @user3.reload
    assert_equal @user3.notifications_count, 1
    assert_equal @user3.unread_notifications_count, 1
    @user1.reload
    assert_equal @user1.notifications_count, 0
    assert_equal @user1.unread_notifications_count, 0
  end

  test "接受工会邀请" do
    setup_guild
    
    @i.accept_invitation
    @user2.reload
    assert_equal @user2.notifications_count, 0
    assert_equal @user2.unread_notifications_count, 0
    @user1.reload
    assert_equal @user1.notifications_count, 1
    assert_equal @user1.unread_notifications_count, 1
  end

  test "拒绝工会邀请" do
    setup_guild

    @i.destroy
    @user2.reload
    assert_equal @user2.notifications_count, 0
    assert_equal @user2.unread_notifications_count, 0
    @user1.reload
    assert_equal @user1.notifications_count, 1
    assert_equal @user1.unread_notifications_count, 1
  end

protected

  def setup_friendship
    @r = Friendship.create(:friend_id => @user1.id, :user_id => @user4.id, :status => 0)    
    @f = @user1.friendships.find_by_friend_id(@user2.id)
  end

  def setup_event
    @e = Event.create({:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => 1, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'event description'})
    @i = Participation.create(:participant_id => 2, :status => 0, :event_id => @e.id)
    @r = Participation.create(:participant_id => 3, :status => 1, :event_id => @e.id)
    @p = Participation.create(:participant_id => 4, :status => 3, :event_id => @e.id)
  end

  def setup_guild
    @g = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => 1})
    @i = Membership.create(:user_id => 2, :status => 0, :guild_id => @g.id)
    @r = Membership.create(:user_id => 3, :status => 1, :guild_id => @g.id)
    @m = Membership.create(:user_id => 4, :status => 5, :guild_id => @g.id)
  end

end
