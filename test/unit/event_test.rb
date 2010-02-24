require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  def setup
    @user = User.find(1)
    @params = {:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => @user.id, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'event description'} 
    @g = Guild.create({:game_id => 1, :game_area_id => 1, :game_server_id => 1, :name => 'name', :description => 'description', :president_id => 1, :character_id => 1})
    @user.reload
  end

  # 测试 aGpp/observer/event.rb
  test "创建事件会同时创建一个相册" do
    e = Event.create(@params)
    e.reload

    assert_equal e.confirmed_count, 1
    assert_not_nil e.album
  end

  # 测试validate
  test "没有标题" do
    e = Event.create(@params.merge({:title => nil}))
    assert_equal e.errors.on_base, '标题不能为空'
  end

  test "没有描述" do
    e = Event.create(@params.merge({:description => nil}))
    assert_equal e.errors.on_base, '描述不能为空'
  end

  test "开始时间为空" do
    e = Event.create(@params.merge({:start_time => nil}))
    assert_equal e.errors.on_base, '开始时间不能为空'
  end

  test "结束时间为空" do
    e = Event.create(@params.merge({:end_time => nil}))
    assert_equal e.errors.on_base, '结束时间不能为空'
  end

  test "结束时间比开始时间早" do
    e = Event.create(@params.merge({:end_time => 1.days.from_now.to_s(:db)}))
    assert_equal e.errors.on_base, '结束时间不能比开始时间早'
  end

  test "开始时间比现在早" do
    e = Event.create(@params.merge({:start_time => 1.days.ago.to_s(:db)}))
    assert_equal e.errors.on_base, '开始时间不能比现在早'
  end

  # validate_on_create
  test "没有游戏" do
    e = Event.create(@params.merge({:game_id => nil}))
    assert_equal e.errors.on_base, '游戏类别不能为空'
  end

  test "没有服务器" do
    e = Event.create(@params.merge({:game_server_id => nil}))
    assert_equal e.errors.on_base, '游戏服务器不能为空'
  end

  test "没有服务区" do
    e = Event.create(@params.merge({:game_area_id => nil}))
    assert_equal e.errors.on_base, '游戏服务区不能为空'
  end

  test "游戏不存在" do
    e = Event.create(@params.merge({:game_id => 22}))
    assert_equal e.errors.on_base, '游戏不存在'
  end

  test "对于没有服务区的游戏，游戏服务区应该为空，但是服务器不能为空，且应该存在" do
    e = Event.create(@params.merge({:game_id => 2, :game_area_id => 1, :game_server_id => 4}))
    assert_equal e.errors.on_base, '游戏服务区应该为空'

    e = Event.create(@params.merge({:game_id => 2, :game_area_id => nil, :game_server_id => nil}))
    assert_equal e.errors.on_base, '游戏服务器不能为空'

    e = Event.create(@params.merge({:game_id => 2, :game_area_id => nil, :game_server_id => 1}))
    assert_equal e.errors.on_base, '游戏服务器不存在或者不属于该游戏'
  end

  test "对于有服务区的游戏，游戏服务区不能为空，服务器不能为空，且应该存在" do
    e = Event.create(@params.merge({:game_id => 1, :game_area_id => nil, :game_server_id => 2}))
    assert_equal e.errors.on_base, '游戏服务区不能为空'

    e = Event.create(@params.merge({:game_id => 1, :game_area_id => 1, :game_server_id => nil}))
    assert_equal e.errors.on_base, '游戏服务器不能为空'

    e = Event.create(@params.merge({:game_id => 1, :game_area_id => 1, :game_server_id => 4}))
    assert_equal e.errors.on_base, '游戏服务器不存在或者不属于该区域'
  end
  
  test "工会不存在" do
    e = Event.create(@params.merge({:guild_id => 213}))
    assert_equal e.errors.on_base, "工会不存在"
  end

  test "工会存在，会自动赋值" do
    e = Event.create(@params.merge({:guild_id => @g.id}))
    assert_equal e.game_id, @g.game_id
    assert_equal e.game_server_id, @g.game_server_id
    assert_equal e.game_area_id, @g.game_area_id
  end

  # validate_on_update
  test "不能修改poster_id" do
    e1 = Event.create(@params)
    e2 = Event.create(@params.merge({:guild_id => @g.id}))

    e1.update_attributes(:poster_id => 123) 
    assert_equal e1.errors.on_base, '不能修改poster_id'
    e2.update_attributes(:poster_id => 123)
    assert_equal e2.errors.on_base, '不能修改poster_id'
  end

  test "不能修改game_id, game_area_id, game_server_id" do
    e1 = Event.create(@params)
    e2 = Event.create(@params.merge({:guild_id => @g.id}))

    e1.update_attributes(:game_id => 123) 
    assert_equal e1.errors.on_base, '不能修改game_id'
    e2.update_attributes(:game_id => 123)
    assert_equal e2.errors.on_base, '不能修改game_id'    

    e1.reload
    e2.reload

    e1.update_attributes(:game_area_id => 123)  
    assert_equal e1.errors.on_base, '不能修改game_area_id'
    e2.update_attributes(:game_area_id => 123)
    assert_equal e2.errors.on_base, '不能修改game_area_id' 
 
    e1.reload
    e2.reload

    e1.update_attributes(:game_server_id => 123)  
    assert_equal e1.errors.on_base, '不能修改game_server_id'
    e2.update_attributes(:game_server_id => 123)
    assert_equal e2.errors.on_base, '不能修改game_server_id'
  end

  test "不能修改guild_id" do
    e = Event.create(@params.merge({:guild_id => @g.id}))
    
    e.update_attributes(:guild_id => 123)
    assert_equal e.errors.on_base, "不能修改guild_id"
  end

  # 取消活动
  test "取消活动" do
    e = Event.create(@params.merge({:guild_id => @g.id})) 
    p1 = create_participant :event_id => e.id, :participant_id => 2, :character_id => 3, :status => 5
    p2 = create_participant :event_id => e.id, :participant_id => 2, :character_id => 4, :status => 5

    # 取消活动
    e.set_destroyed
    e.destroy
    @user.reload
    assert_equal @user.events_count, 0
    assert_equal User.find(2).upcoming_events_count, 0
    assert_not_nil Email.find(:all, :conditions => {:to => User.find(2).email}).count, 2
  end

protected

  def create_participant opts
    create_opts = opts.merge({:status => 1})
    p = Participation.create(create_opts)
    p.update_attributes(:status => 4)
    return p
  end
    
end
