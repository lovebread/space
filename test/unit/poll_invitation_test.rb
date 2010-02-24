require 'test_helper'

class PollInvitationTest < ActiveSupport::TestCase

  fixtures :all

  def setup
    @game = Game.find(1)
    @user = User.find(1)
    @poll = Poll.create({:name => 'poll name', :game_id => @game.id, :poster_id => @user.id, :no_deadline => false, :deadline => 1.days.from_now.to_s(:db), :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}]})
  end

  # 计数器
  test "邀请后，被邀请者的计数器加1" do
    @i = @poll.invitations.create(:user_id => 2)
    assert_equal User.find(2).poll_invitations_count, 1
  end

  # 测试validate
  test "没有人" do
    @i = @poll.invitations.create
    assert_equal @i.errors.on_base, '没有人'
  end

  test "没有投票" do
    @i = PollInvitation.create(:user_id => 2)
    assert_equal @i.errors.on_base, '没有投票'  
  end

  test "邀请的不是好友" do
    @i = PollInvitation.create(:user_id => 4, :poll_id => @poll.id)
    assert_equal @i.errors.on_base, '邀请的不是好友'
  end

  test "已经邀请过了" do
    @i = @poll.invitations.create(:user_id => 2)
    @i = @poll.invitations.create(:user_id => 2)
    assert_equal @i.errors.on_base, '已经邀请过了'
  end
  
end
