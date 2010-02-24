require 'test_helper'

class User::EventsControllerTest < ActionController::TestCase

  def setup
    @user1 = User.find(1)
    @user2 = User.find(2)
    @user3 = User.find(3)
    @user4 = User.find(4)
    @event1 = Event.create({:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => 2, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'description', :created_at => 1.days.ago})
    @event2 = Event.create({:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => 2, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 2, :description => 'description', :created_at => 2.days.ago})
    @event3 = Event.create({:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => 1, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 4.days.from_now.to_s(:db), :privilege => 2, :description => 'description', :created_at => 3.days.ago})
    @event4 = Event.create({:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => 1, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 4.days.from_now.to_s(:db), :privilege => 2, :description => 'description', :created_at => 4.days.ago})
    Participation.create(:event_id => @event3.id, :participant_id => 2, :status => 3)
    Participation.create(:event_id => @event4.id, :participant_id => 2, :status => 3)
  end

  # 测试 index
  test "本人看index" do
    get 'index', {:id => 2}, {:user_id => 2}

    assert_template 'user/events/index'

    # 共2个活动，按照时间顺序
    events = assigns(:events)
    assert_equal events.count, 2 
    assert_equal events[0], @event1
    assert_equal events[1], @event2

    # 能看到自己的状态，并编辑自己的状态
    assert_event_status @event1, @user2
    assert_event_status @event2, @user2
  end

  test "好友看index" do
    # 如果好友没被邀请，也没请求加入，也没参加
    get 'index', {:id => 2}, {:user_id => 1}
    assert_template 'user/events/index'
    events = assigns(:events)
    assert_equal events.count, 2
    assert_equal events[0], @event1
    assert_equal events[1], @event2
    assert_event_status @event1, @user1
    assert_event_status @event2, @user1

    # 创建邀请和请求
    p1 = Participation.create(:event_id => @event1.id, :participant_id => 2, :status => 0)
    p2 = Participation.create(:event_id => @event2.id, :participant_id => 2, :status => 1)
    
    # 这时候再次查看index
    get 'index', {:id => 2}, {:user_id => 1}
    assert_template 'user/events/index'
    events = assigns(:events)
    assert_equal events.count, 2
    assert_equal events[0], @event1
    assert_equal events[1], @event2
    assert_event_status @event1, @user1
    assert_event_status @event2, @user1
    
    # 接受邀请和请求
    p1.update_attributes(:status => 4)
    p2.accept

    # 如果好友参加了活动, 再查看
    get 'index', {:id => 2}, {:user_id => 1}
    assert_template 'user/events/index'
    events = assigns(:events)
    assert_equal events.count, 2
    assert_equal events[0], @event1
    assert_equal events[1], @event2
    assert_event_status @event1, @user1
    assert_event_status @event2, @user1
  end

  test "玩相同游戏的人看index" do
    get 'index', {:id => 2}, {:user_id => 3}
    assert_redirected_to new_friend_url(:id => @user2.id)
  end

  test "陌生人看index" do
    get 'index', {:id => 2}, {:user_id => 4}
    assert_redirected_to new_friend_url(:id => @user2.id)
  end

  # 测试 upcoming
  test "本人看upcoming" do
    get 'upcoming', {:id => 2}, {:user_id => 2}
    
    # 返回upcoming
    assert_template 'user/events/upcoming'

    # 返回2个活动，按照时间排列
    events = assigns(:events)
    assert_equal events.count, 2
    assert_equal events[0], @event3
    assert_equal events[1], @event4

    # 检查活动状态
    assert_event_status @event3, @user2
    assert_event_status @event4, @user2
  end

  test "好友看upcoming" do
    get 'upcoming', {:id => 2}, {:user_id => 1}

    # 返回upcoming
    assert_template 'user/events/upcoming'

    # 返回2个活动，按照时间排列
    events = assigns(:events)
    assert_equal events.count, 2
    assert_equal events[0], @event3
    assert_equal events[1], @event4

    # 检查活动状态
    assert_event_status @event3, @user1
    assert_event_status @event4, @user1
  end

  test "玩相同游戏的人看upcoming" do
    get 'upcoming', {:id => 2}, {:user_id => 3}
    assert_redirected_to new_friend_url(:id => @user2.id)
  end

  test "陌生人看upcoming" do
    get 'upcoming', {:id => 2}, {:user_id => 4}
    assert_redirected_to new_friend_url(:id => @user2.id)
  end

  # 测试 participated
  test "本人看participated" do
    # 怎么测？ 
  end

  test "好友看participated" do
    # 怎么测？
  end

  test "玩相同游戏的人看participated" do
    get 'participated', {:id => 2}, {:user_id => 3}
    assert_redirected_to new_friend_url(:id => @user2.id)
  end

  test "陌生人看participated" do
    get 'participated', {:id => 2}, {:user_id => 3}
    assert_redirected_to new_friend_url(:id => @user2.id)
  end

  # 测试 show
  test "创建者看活动" do
    get 'show', {:id => @event1.id}, {:user_id => 2}
    assert_template 'user/events/show'
    assert_tag :tag => 'h3', :content => "你改变主意了?"
  end

  test "参加的人看活动" do
    Participation.create(:participant_id => 1, :event_id => @event1.id, :status => 4)
    get 'show', {:id => @event1.id}, {:user_id => 1}
    assert_template 'user/events/show'
    assert_tag :tag => 'h3', :content => "你改变主意了?"
  end

  test "被邀请的人看活动" do
    Participation.create(:participant_id => 1, :event_id => @event1.id, :status => 0)
    get 'show', {:id => @event1.id}, {:user_id => 1}
    assert_template 'user/events/show'
    assert_tag :tag => 'h3', :content => "你已经被邀请了"
  end

  test "请求加入的人看活动" do
    Participation.create(:participant_id => 1, :event_id => @event1.id, :status => 1)
    get 'show', {:id => @event1.id}, {:user_id => 1}
    assert_template 'user/events/show'
    assert_tag :tag => 'h3', :content => "你已经发送请求了，请等候"
  end

  test "没参加也没被邀请也没请求加入的人看活动" do
    # 如果活动是人人可参加的
    get 'show', {:id => @event1.id}, {:user_id => 4}
    assert_template 'user/events/show'
    assert_tag :tag => 'form', :attributes => {:action => event_requests_url(@event1, :show => 1)}
  
    # 如果活动只有好友可以参加
    @event1.update_attributes(:privilege => 2)
    get 'show', {:id => @event1.id}, {:user_id => 4}
    assert_template 'user/events/show'
    assert_tag :tag => 'a', :attributes => {:href => new_friend_request_url(:friend_id => 2)}
  end

  # 测试 create
  test "创建活动" do
    # 正确参数
    post 'create', {:event => {:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => 2, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'description', :created_at => 1.days.ago}}, {:user_id => 2}
    assert_redirected_to new_event_invitation_url(assigns(:event))
    
    # 错误参数
    post 'create', {:event => {:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => 2, :title => nil, :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'description', :created_at => 1.days.ago}}, {:user_id => 2}
    assert_template 'user/events/new'
    assert_not_nil assigns(:event).errors.on_base
  end

  # 测试 edit
  test "更新自己的活动" do
    get 'edit', {:id => @event1.id}, {:user_id => 2}
    assert_template 'user/events/edit'
  end

  test "更新他人的活动" do
    get 'edit', {:id => @event1.id}, {:user_id => 3}
    assert_template 'not_found'
  end

  # 测试 update
  test "更新活动" do
    # 正确参数
    put 'update', {:event => {:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => 2, :title => 't', :start_time => 2.days.from_now, :end_time => 3.days.from_now, :privilege => 1, :description => 'd', :created_at => 1.days.ago}, :id => @event1.id}, {:user_id => 2}
    assert_redirected_to event_url(@event1)

    # 错误参数
    put 'update', {:event => {:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => 2, :title => nil, :start_time => 2.days.from_now, :end_time => 3.days.from_now, :privilege => 1, :description => 'd', :created_at => 1.days.ago}, :id => @event1.id}, {:user_id => 2}
    assert_template 'user/events/edit'
    assert_not_nil assigns(:event).errors.on_base
  end

  test "更新别人的活动" do
    put 'update', {:event => {:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => 2, :title => 't', :start_time => 2.days.from_now, :end_time => 3.days.from_now, :privilege => 1, :description => 'd', :created_at => 1.days.ago}, :id => @event1.id}, {:user_id => 4}
    assert_template 'not_found'
  end

  # 测试 destroy
  test "删除自己的活动" do
    delete 'destroy', {:id => @event3.id}, {:user_id => 1}
    @user1.reload
    @user2.reload
    assert_equal @user1.events_count, 1
    assert_equal @user2.upcoming_events_count, 1
  end

  test "删除别人的活动" do
    delete 'destroy', {:id => @event3.id}, {:user_id => 3}
    assert_template 'not_found'
  end

  # 测试 hot
  test "只显示与自己游戏相关的热门活动" do
    # user4 creates an event whose game is "stone age"
    event = Event.create({:game_id => 2, :game_server_id => 5, :poster_id => 4, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 4.days.from_now.to_s(:db), :privilege => 2, :description => 'description', :created_at => 4.days.ago})    
     
    get 'hot', {}, {:user_id => 2}
    events = assigns(:events)
    assert_template 'user/events/hot'
    assert_equal events.count, 4
    assert_equal events[0], @event3
    assert_equal events[1], @event4
    assert_equal events[2], @event1
    assert_equal events[3], @event2
  end

  test "只显示与自己游戏相关的最近活动" do
    # user4 creates an event whose game is "stone age"
    event = Event.create({:game_id => 2, :game_server_id => 5, :poster_id => 4, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 4.days.from_now.to_s(:db), :privilege => 2, :description => 'description', :created_at => 4.days.ago})

    get 'recent', {}, {:user_id => 2}
    events = assigns(:events)
    assert_template 'user/events/recent'
    assert_equal events.count, 4
    assert_equal events[0], @event1
    assert_equal events[1], @event2
    assert_equal events[2], @event3
    assert_equal events[3], @event4
  end

protected

  def assert_event_status event, user
    p = event.participations.find_by_participant_id(user.id)
    if p.blank?
      if event.participantable? user
        assert_tag :tag => 'span', :attributes => {:id => "event_status_#{event.id}"}, :content => "没有参加"
        assert_tag :tag => 'a', :attributes => {:href => new_event_request_url(event)}
      else
        assert_tag :tag => 'span', :attributes => {:id => "event_status_#{event.id}"}, :content => /好友才能参加/
      end
    elsif p.is_invitation?
      assert_tag :tag => 'span', :attributes => {:id => "event_status_#{event.id}"}, :content => "受邀请" 
      assert_tag :tag => 'a', :attributes => {:href => edit_event_invitation_url(event, p, :show => 0), :rel => 'facebox', :facebox_type => 'normal'}
    elsif p.is_request?
      assert_tag :tag => 'span', :attributes => {:id => "event_status_#{event.id}"}, :content => "等待回复"
    elsif p.is_authorized?
      assert_tag :tag => 'span', :attributes => {:id => "event_status_#{event.id}"}, :content => p.to_s
      assert_tag :tag => 'a', :attributes => {:href => edit_event_participation_url(event, p, :show => 0), :rel => 'facebox', :facebox_type => 'normal'}
    end
  end

end
