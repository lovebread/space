require 'test_helper'

class ParticipationTest < ActiveSupport::TestCase

  fixtures :all

  def setup
    @user = User.find(1)
    @e1 = Event.create({:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => 1, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'event description'})
    @e2 = Event.create({:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => 1, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 2, :description => 'event description'})
    @g = Guild.create({:game_id => 1, :game_area_id => 1, :game_server_id => 1, :name => 'name', :description => 'description', :president_id => 1, :character_id => 1})
    @e3 = Event.create({:guild_id => @g.id, :character_id => 1, :poster_id => 1, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'event description'})
    reload
  end

  # 测试计数器, app/observer/participation_observer.rb
  test "创建活动后，活动的confirmed计数加1, 用户的计数器加1" do
    assert_equal @e1.participations.count, 1
    assert_equal @e1.participations.first.status, 3
    assert_equal @e1.confirmed_count, 1
    assert_equal @e2.confirmed_count, 1
    assert_equal @e3.confirmed_count, 1
    assert_equal @user.events_count, 3
  end
  
  test "请求参加活动后，活动的计数器加1，活动组织者的请求计数器加1" do
    @e1.participations.create(:participant_id => 2, :character_id => 3, :status => 1)
    reload
    assert_equal @e1.poster.event_requests_count, 1
    assert_equal @e1.requests_count, 1

    @e1.participations.create(:participant_id => 2, :character_id => 4, :status => 1)
    reload
    assert_equal @e1.poster.event_requests_count, 2
    assert_equal @e1.requests_count, 2

    @e1.participations.create(:participant_id => 3, :character_id => 5, :status => 1)
    reload
    assert_equal @e1.poster.event_requests_count, 3
    assert_equal @e1.requests_count, 3
  end

  test "活动请求被活动组织者同意" do
    p1 = @e1.participations.create(:participant_id => 2, :character_id => 3, :status => 1)
    p2 = @e1.participations.create(:participant_id => 2, :character_id => 4, :status => 1)
    p3 = @e1.participations.create(:participant_id => 3, :character_id => 5, :status => 1)

    # 先同意其中一个请求
    p1.reload and p1.update_attributes(:status => 3) 
    reload
    assert_equal p1.status, 3
    assert_equal @e1.requests_count, 2
    assert_equal @e1.poster.event_requests_count, 2 
    assert_equal User.find(2).upcoming_events_count, 1

    # 再同意一个
    p2.reload and p2.update_attributes(:status => 3)
    reload
    assert_equal p2.status, 3
    assert_equal @e1.requests_count, 1
    assert_equal @e1.poster.event_requests_count, 1
    assert_equal User.find(2).upcoming_events_count, 1

    # 再同意一个
    p3.reload and p3.update_attributes(:status => 3)
    reload
    assert_equal p3.status, 3
    assert_equal @e1.requests_count, 0
    assert_equal @e1.poster.event_requests_count, 0
    assert_equal User.find(3).upcoming_events_count, 1
  end

  test "活动请求被活动组织者拒绝" do
    p1 = @e1.participations.create(:participant_id => 2, :character_id => 3, :status => 1)
    p2 = @e1.participations.create(:participant_id => 2, :character_id => 4, :status => 1)
    p3 = @e1.participations.create(:participant_id => 3, :character_id => 5, :status => 1)

    # 先同意其中一个请求
    p1.reload and p1.update_attributes(:status => 3)
    reload
    assert_equal p1.status, 3
    assert_equal @e1.requests_count, 2
    assert_equal @e1.poster.event_requests_count, 2
    assert_equal User.find(2).upcoming_events_count, 1

    # 拒绝一个
    p2.reload and p2.destroy
    reload
    assert_equal @e1.requests_count, 1
    assert_equal @e1.poster.event_requests_count, 1
    assert_equal User.find(2).upcoming_events_count, 1

    # 再拒绝一个
    p3.reload and p3.destroy
    reload
    assert_equal @e1.requests_count, 0
    assert_equal @e1.poster.event_requests_count, 0
    assert_equal User.find(3).upcoming_events_count, 0
  end

  test "活动组织者邀请好友" do
    p1 = @e1.participations.create(:participant_id => 2, :character_id => 3, :status => 0)
    reload
    assert_equal @e1.invitations_count, 1
    assert_equal p1.participant.event_invitations_count, 1

    p2 = @e1.participations.create(:participant_id => 2, :character_id => 4, :status => 0)
    reload
    assert_equal @e1.invitations_count, 2
    assert_equal p2.participant.event_invitations_count, 2

    p3 = @e1.participations.create(:participant_id => 3, :character_id => 5, :status => 0)
    reload
    assert_equal @e1.invitations_count, 3
    assert_equal p3.participant.event_invitations_count, 1
  end

  test "活动组织者的邀请被接受" do
    p1 = @e1.participations.create(:participant_id => 2, :character_id => 3, :status => 0)
    p2 = @e1.participations.create(:participant_id => 2, :character_id => 4, :status => 0)
    p3 = @e1.participations.create(:participant_id => 3, :character_id => 5, :status => 0)

    p1.reload and p1.update_attributes(:status => 3)
    reload
    assert_equal @e1.invitations_count, 2
    assert_equal @e1.confirmed_count, 2
    assert_equal @e1.maybe_count, 0
    assert_equal p1.participant.event_invitations_count, 1
    assert_equal p1.participant.upcoming_events_count, 1

    p2.reload and p2.update_attributes(:status => 4)
    reload
    assert_equal @e1.invitations_count, 1
    assert_equal @e1.confirmed_count, 2
    assert_equal @e1.maybe_count, 1
    assert_equal p2.participant.event_invitations_count, 0
    assert_equal p2.participant.upcoming_events_count, 1

    p3.reload and p3.update_attributes(:status => 3)
    reload
    assert_equal @e1.invitations_count, 0
    assert_equal @e1.confirmed_count, 3
    assert_equal @e1.maybe_count, 1
    assert_equal p3.participant.event_invitations_count, 0
    assert_equal p3.participant.upcoming_events_count, 1
  end

  test "活动组织者的邀请被拒绝" do
    p1 = @e1.participations.create(:participant_id => 2, :character_id => 3, :status => 0)
    p2 = @e1.participations.create(:participant_id => 2, :character_id => 4, :status => 0)
    p3 = @e1.participations.create(:participant_id => 3, :character_id => 5, :status => 0)

    p1.reload and p1.update_attributes(:status => 3)
    reload
    assert_equal @e1.invitations_count, 2
    assert_equal @e1.confirmed_count, 2
    assert_equal @e1.maybe_count, 0
    assert_equal p1.participant.event_invitations_count, 1
    assert_equal p1.participant.upcoming_events_count, 1

    p2.reload and p2.destroy
    reload
    assert_equal @e1.invitations_count, 1
    assert_equal @e1.confirmed_count, 2
    assert_equal @e1.maybe_count, 0
    assert_equal p2.participant.event_invitations_count, 0
    assert_equal p2.participant.upcoming_events_count, 1

    p3.reload and p3.destroy
    reload
    assert_equal @e1.invitations_count, 0
    assert_equal @e1.confirmed_count, 2
    assert_equal @e1.maybe_count, 0
    assert_equal p3.participant.event_invitations_count, 0
    assert_equal p3.participant.upcoming_events_count, 0
  end

  test "活动参与者修改状态" do
    p = @e1.participations.find_by_participant_id(1)

    # 变成可能去
    p.update_attributes(:status => 4)
    reload
    assert_equal @e1.confirmed_count, 0
    assert_equal @e1.maybe_count, 1

    # 变成肯定去
    p.update_attributes(:status => 3)
    reload
    assert_equal @e1.confirmed_count, 1
    assert_equal @e1.maybe_count, 0
  end

  test "活动邀请由于过期被删除" do
  end

  test "活动请求由于过期被删除" do
  end

  # 测试validate
  test "状态为空" do
    p = Participation.create(:event_id => @e1.id, :participant_id => 2, :character_id => 3)
    assert_equal p.errors.on_base, '状态不能为空'
  end

  test "状态不对" do
    p = Participation.create(:event_id => @e1.id, :participant_id => 2, :character_id => 4, :status => 6)
    assert_equal p.errors.on_base, '状态不对'
  end

  # 测试 validate_on_create
  test "活动有问题" do
    p = Participation.create(:participant_id => 2, :character_id => 3, :status => 0)
    assert_equal p.errors.on_base, '活动不能为空'
    
    p = Participation.create(:participant_id => 2, :character_id => 3, :status => 0, :event_id => 123123)
    assert_equal p.errors.on_base, '活动不存在'
  end

  test "游戏角色有问题" do
    p = Participation.create(:event_id => @e1.id, :participant_id => 2, :character_id => nil, :status => 0)
    assert_equal p.errors.on_base, "没有游戏角色"

    p = Participation.create(:event_id => @e1.id, :participant_id => 2, :character_id => 123, :status => 0)
    assert_equal p.errors.on_base, "游戏角色不存在"

    p = Participation.create(:event_id => @e1.id, :participant_id => 4, :character_id => 8, :status => 0)
    assert_equal p.errors.on_base, "游戏角色和活动不匹配"
  end

  test "不能直接创建" do
    p = Participation.create(:event_id => @e1.id, :participant_id => 2, :character_id => 3, :status => 3)
    assert_equal p.errors.on_base, "不能直接创建"
  end

  test "邀请不是好友的人" do
    p1 = @e1.invitations.create(:participant_id => 4, :character_id => 7)
    p2 = @e1.invitations.create(:participant_id => 2, :character_id => 3)
    p3 = @e1.invitations.create(:participant_id => 2, :character_id => 4)

    reload
    assert_equal p1.errors.on_base, '不能邀请非好友'
    assert_equal User.find(2).event_invitations_count, 2
    assert_equal @e1.invitations_count, 2
  end

  test "请求不能参加的活动" do
    # 活动只对好友开放，但是请求者不是好友
    p = @e2.requests.create(:participant_id => 4, :character_id => 7)
    assert_equal p.errors.on_base, '权限不够'

    # 活动是工会的活动，请求者不是工会的人
    p = @e3.requests.create(:participant_id => 2, :character_id => 3)
    assert_equal p.errors.on_base, "权限不够" 
  end

  test "已经发送活动请求的，无法再发送活动请求" do
    @e1.requests.create(:participant_id => 2, :character_id => 3)
    p = @e1.requests.create(:participant_id => 2, :character_id => 3) 

    reload
    assert_equal p.errors.on_base, '已经发送请求了'
    assert_equal @user.event_requests_count, 1
    assert_equal @e1.requests_count, 1
  end

  test "已经发送活动请求的，无法被邀请" do
    @e1.requests.create(:participant_id => 2, :character_id => 3)
    p = @e1.invitations.create(:participant_id => 2, :character_id => 3)

    reload
    assert_equal p.errors.on_base, '已经发送请求了'
    assert_equal @user.event_requests_count, 1
    assert_equal User.find(2).event_invitations_count, 0
    assert_equal @e1.requests_count, 1
    assert_equal @e1.invitations_count, 0
  end

  test "已经邀请的，无法再邀请" do
    @e1.invitations.create(:participant_id => 2, :character_id => 3)
    p = @e1.invitations.create(:participant_id => 2, :character_id => 3)
    
    reload
    assert_equal p.errors.on_base, '已经被邀请了'
    assert_equal User.find(2).event_invitations_count, 1
    assert_equal @e1.invitations_count, 1
  end

  test "已经被邀请的，无法发送活动请求" do
    @e1.invitations.create(:participant_id => 2, :character_id => 3)
    p = @e1.requests.create(:participant_id => 2, :character_id => 3)

    reload
    assert_equal p.errors.on_base, '已经被邀请了'
    assert_equal @user.event_requests_count, 0
    assert_equal User.find(2).event_invitations_count, 1
    assert_equal @e1.invitations_count, 1
    assert_equal @e1.requests_count, 0
  end

  test "已经参加活动的，无法再发送请求" do
    puts "本来有: #{@e1.characters}"
    p = @e1.requests.create(:participant_id => 1, :character_id => 1)
    puts "现在有: #{@e1.participations.find_by_participant_id(1)}"
    reload
    #assert_equal p.errors.on_base, '已经参加了该活动'
    assert_equal @user.events_count, 3
    assert_equal @user.upcoming_events_count, 0
    assert_equal @e1.requests_count, 0
  end

  test "已经参加活动的，无法被邀请" do
    p = @e1.invitations.create(:participant_id => 1, :character_id => 1)

    reload
    assert_equal p.errors.on_base, '已经参加了该活动'
    assert_equal @user.events_count, 2
    assert_equal @user.upcoming_events_count, 0
    assert_equal @e1.invitations_count, 0
  end

=begin
   test "从请求变成邀请" do
    p = Participation.create(:event_id => @e1.id, :participant_id => 2, :status => 1)
    p.update_attributes(:status => 0)
    assert_equal p.errors.on_base, '不能从请求变成邀请' 
  end

  test "从participation变成请求" do
    p = @e1.participations.find_by_participant_id(1)
    p.update_attributes(:status => 1)
    assert_equal p.errors.on_base, '不能从参加变成请求'
  end

  test "从邀请变成请求" do
    p = Participation.create(:event_id => @e1.id, :participant_id => 2, :status => 0)
    p.update_attributes(:status => 1)
    assert_equal p.errors.on_base, '不能从邀请变成请求'
  end

  test "从participation变成邀请" do
    p = @e1.participations.find_by_participant_id(1)
    p.update_attributes(:status => 0, :participant_id => 1)
    assert_equal p.errors.on_base, '不能从参加变成邀请'
  end
=end

protected

  def reload
    @user.reload
    @e1.reload
    @e2.reload
    @e3.reload
    @g.reload
  end

end
