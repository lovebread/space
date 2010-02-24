require 'test_helper'

class User::Events::InvitationsControllerTest < ActionController::TestCase

  def setup
    @user = User.find(2)
    @event = Event.create({:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => 1, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'description', :created_at => 1.days.ago})
  end

  # 测试 new
  test "组织者试图邀请别人" do
    get 'new', {:event_id => @event.id}, {:user_id => 1}
    assert_template 'user/events/invitations/new'
    assert_equal assigns(:event), @event
  end

  test "参加者试图邀请别人" do
    Participation.create(:participant_id => 2, :event_id => @event.id, :status => 3)
    get 'new', {:event_id => @event.id}, {:user_id => 2}
    assert_template 'not_found'
  end

  test "被邀请的人试图邀请别人" do
    Participation.create(:participant_id => 3, :event_id => @event.id, :status => 0)
    get 'new', {:event_id => @event.id}, {:user_id => 3}
    assert_template 'not_found'
  end

  test "请求加入的人试图邀请别人" do
    Participation.create(:participant_id => 4, :event_id => @event.id, :status => 1)
    get 'new', {:event_id => @event.id}, {:user_id => 4}
    assert_template 'not_found'
  end

  test "不参加的人试图邀请别人" do
    get 'new', {:event_id => @event.id}, {:user_id => 4}
    assert_template 'not_found'
  end

  # 测试 create
  test "组织者邀请好友" do
    post 'create_multiple', {:event_id => @event.id, :users => [2]}, {:user_id => 1}
    @event.reload
    assert_redirected_to event_url(@event)
    assert_equal @event.invitees_count, 1
  end

  test "组织者邀请的不是好友或者邀请的用户根本不存在" do
    post 'create_multiple', {:event_id => @event.id, :users => [1,2,3,4,5]}, {:user_id => 1}
    @event.reload
    assert_redirected_to event_url(@event)
    assert_equal @event.invitees_count, 2
  end

  test "参加者邀请别人" do
    Participation.create(:participant_id => 2, :event_id => @event.id, :status => 3)
    post 'create_multiple', {:event_id => @event.id, :users => [1]}, {:user_id => 2}
    assert_template 'not_found'
  end

  test "被邀请的人邀请别人" do
    Participation.create(:participant_id => 3, :event_id => @event.id, :status => 0)
    post 'create_multiple', {:event_id => @event.id, :users => [1]}, {:user_id => 3}
    assert_template 'not_found'
  end

  test "请求加入的人邀请别人" do
    Participation.create(:participant_id => 4, :event_id => @event.id, :status => 1)
    post 'create_multiple', {:event_id => @event.id, :users => [1]}, {:user_id => 4}
    assert_template 'not_found'  
  end

  test "不参加的人邀请别人" do
    post 'create_multiple', {:event_id => @event.id, :users => [1]}, {:user_id => 4}
    assert_template 'not_found'
  end

  # 回复邀请
  test "被邀请的人回复邀请" do
    @p = Participation.create(:participant_id => 2, :event_id => @event.id, :status => 0)
    get 'edit', {:event_id => @event.id, :id => @p.id}, {:user_id => 2}
    assert_template 'user/events/invitations/edit'
  end

  test "非被邀请的人回复邀请" do
    @p = Participation.create(:participant_id => 2, :event_id => @event.id, :status => 0)
    get 'edit', {:event_id => @event.id, :id => @p.id}, {:user_id => 3}
    assert_template 'not_found'
  end

  # 接受拒绝邀请
  test "被邀请的人接受邀请" do
    @p = Participation.create(:participant_id => 2, :event_id => @event.id, :status => 0)
    put 'update', {:event_id => @event.id, :id => @p.id, :status => 3}, {:user_id => 2}
    @event.reload
    @p.reload
    assert_equal @event.invitees_count, 0
    assert_equal @event.confirmed_count, 2 #还有活动组织者
    assert_equal @p.status, 3
    
    # 如果参数错误，接受请求失败
    @p.destroy
    @p = Participation.create(:participant_id => 2, :event_id => @event.id, :status => 0)
    put 'update', {:event_id => @event.id, :id => @p.id, :status => 6}, {:user_id => 2}
    @event.reload
    assert_equal @event.invitees_count, 1
  end

  test "被邀请的人拒绝邀请" do
    @p = Participation.create(:participant_id => 2, :event_id => @event.id, :status => 0)
    put 'update', {:event_id => @event.id, :id => @p.id, :status => 5}, {:user_id => 2}
    @event.reload
    assert_equal @event.invitees_count, 0
    assert_equal @event.declined_count, 1
  end

  test "非被邀请的人接受邀请" do
    @p = Participation.create(:participant_id => 2, :event_id => @event.id, :status => 0)
    put 'update', {:event_id => @event.id, :id => @p.id, :status => 3}, {:user_id => 3}
    assert_template 'not_found'
  end

  test "非被邀请的人拒绝邀请" do
    @p = Participation.create(:participant_id => 2, :event_id => @event.id, :status => 0)
    put 'update', {:event_id => @event.id, :id => @p.id, :status => 5}, {:user_id => 4}
    assert_template 'not_found'
  end

end
