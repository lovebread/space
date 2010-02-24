require 'test_helper'

class User::Polls::InvitationsControllerTest < ActionController::TestCase

  def setup
    @user = User.find(1)
    @poll = Poll.create({:name => 'name', :game_id => 1, :poster_id => 1, :no_deadline => false, :deadline => 1.days.from_now.to_s(:db), :max_multiple => 1, :answers => [{:description => 'answer1'}, {:description => 'answer1'}, {:description => 'answer3'}], :privilege => 1, :created_at => 1.days.ago})
    @user.reload
  end

  # 测试 new 
  test "创建者试图邀请" do
    get 'new', {:poll_id => @poll.id}, {:user_id => 1}
    assert_template 'user/polls/invitations/new'
  end

  test "其他人试图邀请" do
    get 'new', {:poll_id => @poll.id}, {:user_id => 4}
    assert_template 'not_found'
  end

  # 测试 create_multiple_multiple
  test "创建者邀请，参数正确" do
    post 'create_multiple', {:poll_id => @poll.id, :users => [2]}, {:user_id => 1}
    @poll.reload
    assert_redirected_to poll_url(@poll)
    assert_equal @poll.invitees_count, 1

    post 'create_multiple', {:poll_id => @poll.id, :users => [2,3]}, {:user_id => 1}
    @poll.reload
    assert_redirected_to poll_url(@poll)
    assert_equal @poll.invitees_count, 2
  end

  test "创建者邀请，参数不正确" do
    post 'create_multiple', {:poll_id => @poll.id, :users => [4,45]}, {:user_id => 1}
    @poll.reload
    assert_redirected_to poll_url(@poll)
    assert_equal @poll.invitees_count, 0
  end

  test "其他人邀请" do
    post 'create_multiple', {:poll_id => @poll.id, :users => [1]}, {:user_id => 2}
    assert_template 'not_found'
  end

  # 测试 destroy
  test "被邀请者删除" do
    i = PollInvitation.create(:user_id => 2, :poll_id => @poll.id)
    delete 'destroy', {:poll_id => @poll.id, :id => i.id}, {:user_id => 2}
    @poll.reload
    assert_equal @poll.invitees_count, 0 
  end

  test "其他人删除" do
    i = PollInvitation.create(:user_id => 2, :poll_id => @poll.id)
    delete 'destroy', {:poll_id => @poll.id, :id => i.id}, {:user_id => 4}
    assert_template 'not_found'
  end

end
