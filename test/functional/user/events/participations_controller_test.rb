require 'test_helper'

class User::Events::ParticipationsControllerTest < ActionController::TestCase

  def setup
    @user = User.find(2)
    @event = Event.create({:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => 2, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'description', :created_at => 1.days.ago})
    @p = Participation.create(:status => 3, :participant_id => 3, :event_id => @event.id)
  end

  # 测试 index
  test "本人能看" do
    get 'index', {:event_id => @event.id, :type => 0}, {:user_id => 2}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 1}, {:user_id => 2}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 2}, {:user_id => 2}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 3}, {:user_id => 2}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 4}, {:user_id => 2}
    assert_template 'user/events/participations/index'
  end

  test "请求加入的人能看" do
    Participation.create(:status => 1, :participant_id => 1, :event_id => @event.id)
    get 'index', {:event_id => @event.id, :type => 0}, {:user_id => 1}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 1}, {:user_id => 1}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 2}, {:user_id => 1}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 3}, {:user_id => 1}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 4}, {:user_id => 1}
    assert_template 'user/events/participations/index'
  end

  test "被邀请的人能看" do
    Participation.create(:status => 0, :participant_id => 1, :event_id => @event.id)
    get 'index', {:event_id => @event.id, :type => 0}, {:user_id => 1}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 1}, {:user_id => 1}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 2}, {:user_id => 1}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 3}, {:user_id => 1}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 4}, {:user_id => 1}
    assert_template 'user/events/participations/index'
  end

  test "已经参加的人能看" do
    Participation.create(:status => 3, :participant_id => 1, :event_id => @event.id)
    get 'index', {:event_id => @event.id, :type => 0}, {:user_id => 1}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 1}, {:user_id => 1}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 2}, {:user_id => 1}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 3}, {:user_id => 1}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 4}, {:user_id => 1}
    assert_template 'user/events/participations/index'
  end

  test "没参加的人能看" do
    get 'index', {:event_id => @event.id, :type => 0}, {:user_id => 1}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 1}, {:user_id => 1}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 2}, {:user_id => 1}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 3}, {:user_id => 1}
    assert_template 'user/events/participations/index'
    get 'index', {:event_id => @event.id, :type => 4}, {:user_id => 1}
    assert_template 'user/events/participations/index'
  end

  # 测试 edit
  test "拥有者编辑" do
    get 'edit', {:event_id => @event.id, :id => @p.id}, {:user_id => 3}
    assert_template 'user/events/participations/edit'
    assert_equal assigns(:participation), @p
  end

  test "非拥有者编辑" do
    get 'edit', {:event_id => @event.id, :id => @p.id}, {:user_id => 4}
    assert_template 'not_found'
  end

  # 测试 update
  test "拥有者更新" do
    put 'update', {:event_id => @event.id, :id => @p.id, :status => 4}, {:user_id => 3}
    @p.reload
    @event.reload
    assert_equal @p.status, 4
    assert_equal @event.maybe_count, 1
    assert_equal @event.confirmed_count, 1
  end

  test "非拥有者更新" do
    put 'update', {:event_id => @event.id, :id => @p.id, :status => 4}, {:user_id => 4}
    assert_template 'not_found'
  end
 
end
