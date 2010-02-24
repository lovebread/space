require 'test_helper'

class User::Events::RequestsControllerTest < ActionController::TestCase

  def setup
    @user = User.find(2)
    @event = Event.create({:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => 1, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'description', :created_at => 1.days.ago})
  end

  # 测试 new
  test "已经参加的人尝试创建" do
    Participation.create(:participant_id => 2, :event_id => @event.id, :status => 3)
    get 'new', {:event_id => @event.id}, {:user_id => 2}
    assert_template 'user/events/requests/new'
  end

  test "被邀请的人尝试创建" do
    Participation.create(:participant_id => 2, :event_id => @event.id, :status => 0)
    get 'new', {:event_id => @event.id}, {:user_id => 2}
    assert_template 'user/events/requests/new'
  end

  test "已经要求参加的人尝试创建" do
    Participation.create(:participant_id => 2, :event_id => @event.id, :status => 1)
    get 'new', {:event_id => @event.id}, {:user_id => 2}
    assert_template 'user/events/requests/new'
  end

  test "没参加的人尝试创建" do
    get 'new', {:event_id => @event.id}, {:user_id => 2}
    assert_template 'user/events/requests/new'
  end

  # 测试 create
  test "已经参加的人创建" do
    Participation.create(:participant_id => 2, :event_id => @event.id, :status => 3)
    post 'create', {:event_id => @event.id, :status => 1}, {:user_id => 2}
    @event.reload
    assert_not_nil assigns(:request).errors.on_base
    assert_equal @event.requestors_count, 0
  end

  test "被邀请的人创建" do
    Participation.create(:participant_id => 2, :event_id => @event.id, :status => 0)
    post 'create', {:event_id => @event.id, :status => 1}, {:user_id => 2}
    @event.reload
    assert_not_nil assigns(:request).errors.on_base
    assert_equal @event.requestors_count, 0
  end

  test "已经要求参加的人创建" do
    Participation.create(:participant_id => 2, :event_id => @event.id, :status => 1)
    post 'create', {:event_id => @event.id, :status => 1}, {:user_id => 2}
    @event.reload
    assert_not_nil assigns(:request).errors.on_base
    assert_equal @event.requestors_count, 1
  end

  test "没参加的人创建" do
    post 'create', {:event_id => @event.id, :status => 1}, {:user_id => 2}
    @event.reload
    assert_nil assigns(:request).errors.on_base
    assert_equal @event.requestors_count, 1
  end

  # 测试 accept
  test "组织者接受请求" do
    @p = Participation.create(:participant_id => 2, :event_id => @event.id, :status => 1)
    put 'accept', {:event_id => @event.id, :id => @p.id}, {:user_id => 1}
    @event.reload
    assert_equal @event.confirmed_count, 2
    assert_equal @event.requestors_count, 0
  end

  test "组织者拒绝请求" do
    @p = Participation.create(:participant_id => 2, :event_id => @event.id, :status => 1)
    delete 'decline', {:event_id => @event.id, :id => @p.id}, {:user_id => 1}
    @event.reload
    assert_equal @event.confirmed_count, 1
    assert_equal @event.requestors_count, 0
  end

  test "非组织者接受请求" do
    @p = Participation.create(:participant_id => 2, :event_id => @event.id, :status => 1)
    put 'accept', {:event_id => @event.id, :id => @p.id}, {:user_id => 2}
    assert_template 'not_found'
  end

  test "非组织者决绝请求" do
    @p = Participation.create(:participant_id => 2, :event_id => @event.id, :status => 1)
    delete 'decline', {:event_id => @event.id, :id => @p.id}, {:user_id => 2}
    assert_template 'not_found'
  end

end
