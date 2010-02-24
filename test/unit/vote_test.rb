require 'test_helper'

class VoteTest < ActiveSupport::TestCase

  fixtures :all

  def setup
    @game = Game.find(1)
    @user = User.find(1)
    @poll = Poll.create({:name => 'poll name', :game_id => @game.id, :poster_id => @user.id, :no_deadline => false, :deadline => 1.days.from_now.to_s(:db), :max_multiple => 2, :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}], :privilege => 2})
    @answer1 = @poll.answers[0]
    @answer2 = @poll.answers[1]
    @answer3 = @poll.answers[2]
    @poll2 = Poll.new({:name => 'poll name', :game_id => @game.id, :poster_id => @user.id, :no_deadline => false, :deadline => 1.days.ago.to_s(:db), :max_multiple => 2, :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}], :privilege => 1})
    @poll2.save_with_validation(false)
  end

  # 测试计数器，app/observer/vote_observer.rb
  test "投票后，每个选项的投票人数增加，投票的人数增加" do
    @vote = @poll.votes.create(:voter_id => 1, :answer_ids => [@answer1.id, @answer2.id])
    reload
    assert_equal @poll.voters_count, 1
    assert_equal @poll.votes_count, 2
    assert_equal @answer1.votes_count, 1
    assert_equal @answer2.votes_count, 1
    assert_equal User.find(1).participated_polls_count, 0
    assert_equal User.find(1).polls_count, 2

    @vote = @poll.votes.create(:voter_id => 2, :answer_ids => [@answer3.id, @answer2.id])
    reload
    assert_equal @poll.voters_count, 2
    assert_equal @poll.votes_count, 4
    assert_equal @answer1.votes_count, 1
    assert_equal @answer2.votes_count, 2
    assert_equal @answer3.votes_count, 1
    assert_equal User.find(2).participated_polls_count, 1
    assert_equal User.find(2).polls_count, 0

    @vote = @poll.votes.create(:voter_id => 3, :answer_ids => [@answer3.id])
    reload
    assert_equal @poll.voters_count, 3
    assert_equal @poll.votes_count, 5
    assert_equal @answer1.votes_count, 1
    assert_equal @answer2.votes_count, 2
    assert_equal @answer3.votes_count, 2
    assert_equal User.find(3).participated_polls_count, 1
    assert_equal User.find(3).polls_count, 0

    # 反复投，没有效果
    @vote = @poll.votes.create(:voter_id => 3, :answer_ids => [@answer3.id])
    reload
    assert_equal @vote.errors.on_base, "已经投过票了"
    assert_equal @poll.voters_count, 3
    assert_equal @poll.votes_count, 5
    assert_equal @answer1.votes_count, 1
    assert_equal @answer2.votes_count, 2
    assert_equal @answer3.votes_count, 2
    assert_equal User.find(3).participated_polls_count, 1
    assert_equal User.find(3).polls_count, 0
  end

  test "没有权限投票" do
    @vote = @poll.votes.create(:voter_id => 4, :answer_ids => [@answer3.id])
    reload
    assert_equal @vote.errors.on_base, "权限不够"
    assert_equal @poll.voters_count, 0
    assert_equal @poll.votes_count, 0
    assert_equal @answer1.votes_count, 0
    assert_equal @answer2.votes_count, 0
    assert_equal @answer3.votes_count, 0
    assert_equal User.find(3).participated_polls_count, 0
    assert_equal User.find(3).polls_count, 0
  end

  test "有权限，但是过期" do
    @vote = @poll2.votes.create(:voter_id => 4, :answer_ids => [@poll2.answers.first.id])
    reload
    assert_equal @vote.errors.on_base, "投票已经过期"
    assert_equal @poll.voters_count, 0
    assert_equal @poll.votes_count, 0
    assert_equal @answer1.votes_count, 0
    assert_equal @answer2.votes_count, 0
    assert_equal @answer3.votes_count, 0
    assert_equal User.find(3).participated_polls_count, 0
    assert_equal User.find(3).polls_count, 0
  end

  # 测试validate
  test "没有投票者" do
    @vote = @poll.votes.create(:answer_ids => [@answer1.id])
    assert_equal @vote.errors.on_base, '没有投票者'
  end

  test "没有投票" do
    @vote = Vote.create(:voter_id => 2, :answer_ids => [@answer1.id])
    assert_equal @vote.errors.on_base, '没有投票'
  end

  test "没有选项" do
    @vote = @poll.votes.create(:voter_id => 2)
    assert_equal @vote.errors.on_base, '没有选项'
  end

  test "选项不存在" do
    @vote = @poll.votes.create(:voter_id => 2, :answer_ids => [12312312,123123213])
    assert_equal @vote.errors.on_base, '选项不存在'
  end

  test "选太多了" do
    @vote = @poll.votes.create(:voter_id => 2, :answer_ids => [@answer1.id, @answer2.id, @answer3.id])
    assert_equal @vote.errors.on_base, '选太多了'
  end

  test "已经投过票了" do
    @poll.votes.create(:voter_id => 2, :answer_ids => [@answer2.id, @answer3.id])
    @vote = @poll.votes.create(:voter_id => 2, :answer_ids => [@answer1.id, @answer2.id])
    assert_equal @vote.errors.on_base, '已经投过票了'
  end

  test "投票的权限不够" do
    @vote = @poll.votes.create(:voter_id => 2, :answer_ids => [@answer2.id])
    assert_equal @vote.errors.on_base, '权限不够'
  end

protected

  def reload
    @poll.reload
    @answer1.reload
    @answer2.reload
    @answer3.reload
  end

end
