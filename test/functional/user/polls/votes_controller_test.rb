require 'test_helper'

class User::Polls::VotesControllerTest < ActionController::TestCase

  def setup
    @user = User.find(1)
    @poll = Poll.create({:name => 'name', :game_id => 1, :poster_id => 1, :no_deadline => false, :deadline => 1.days.from_now.to_s(:db), :max_multiple => 2, :answers => [{:description => 'answer1'}, {:description => 'answer1'}, {:description => 'answer3'}], :privilege => 2, :created_at => 1.days.ago})
    @poll2 = Poll.new({:name => 'name', :game_id => 1, :poster_id => 1, :no_deadline => false, :deadline => 1.days.ago.to_s(:db), :max_multiple => 2, :answers => [{:description => 'answer1'}, {:description => 'answer1'}, {:description => 'answer3'}], :privilege => 2, :created_at => 1.days.ago})
    @poll2.save_with_validation(false)
    @user.reload
  end

  # 测试 create 
  test "投票没过期，有权限，而且参数正确" do
    post 'create', {:poll_id => @poll.id, :votes => [@poll.answers.first.id, @poll.answers.last.id]}, {:user_id => 2}
    @poll.reload
    assert_redirected_to poll_url(@poll)
    assert_equal User.find(2).participated_polls_count, 1
    assert_equal @poll.voters_count, 1
    assert_equal @poll.votes_count, 2
    assert_equal @poll.answers.first.votes_count, 1
    assert_equal @poll.answers.last.votes_count, 1
  end

  test "投票没过期，有权限，而且参数不正确" do
    post 'create', {:poll_id => @poll.id, :votes => [@poll.answers.first.id, @poll.answers.last.id, 123]}, {:user_id => 2}
    @poll.reload
    assert_redirected_to poll_url(@poll)
    assert_not_nil assigns(:vote).errors.on_base
    assert_equal User.find(2).participated_polls_count, 0
    assert_equal @poll.voters_count, 0
    assert_equal @poll.votes_count, 0
    assert_equal @poll.answers.first.votes_count, 0
    assert_equal @poll.answers.last.votes_count, 0
  end

  test "投票没过期，没有权限" do
    post 'create', {:poll_id => @poll.id, :votes => [@poll.answers.first.id, @poll.answers.last.id]}, {:user_id => 4}
    @poll.reload
    assert_redirected_to poll_url(@poll)
    assert_not_nil assigns(:vote).errors.on_base
    assert_equal User.find(4).participated_polls_count, 0
    assert_equal @poll.voters_count, 0
    assert_equal @poll.votes_count, 0
    assert_equal @poll.answers.first.votes_count, 0
    assert_equal @poll.answers.last.votes_count, 0
  end

  test "投票过期，有权限" do
    post 'create', {:poll_id => @poll2.id, :votes => [@poll2.answers.first.id, @poll2.answers.last.id]}, {:user_id => 2}
    @poll2.reload
    assert_redirected_to poll_url(@poll2)
    assert_not_nil assigns(:vote).errors.on_base
    assert_equal User.find(2).participated_polls_count, 0
    assert_equal @poll.voters_count, 0
    assert_equal @poll.votes_count, 0
    assert_equal @poll.answers.first.votes_count, 0
    assert_equal @poll.answers.last.votes_count, 0
  end

  test "投票过期，没有权限" do
    post 'create', {:poll_id => @poll2.id, :votes => [@poll2.answers.first.id, @poll2.answers.last.id]}, {:user_id => 4}
    @poll2.reload
    assert_redirected_to poll_url(@poll2)
    assert_not_nil assigns(:vote).errors.on_base
    assert_equal User.find(4).participated_polls_count, 0
    assert_equal @poll.voters_count, 0
    assert_equal @poll.votes_count, 0
    assert_equal @poll.answers.first.votes_count, 0
    assert_equal @poll.answers.last.votes_count, 0
  end

end
