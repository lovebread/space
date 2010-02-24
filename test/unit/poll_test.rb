require 'test_helper'

class PollTest < ActiveSupport::TestCase
  
  def setup
    @game = Game.find(1)
    @user = User.find(1)
    @params = {:name => 'poll name', :game_id => @game.id, :poster_id => @user.id, :no_deadline => false, :deadline => 1.days.from_now.to_s(:db), :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}]}
  end

  # 测试poll的创建 
  test "选项的数量" do
    @poll = Poll.create(@params)
    @poll.reload
    @user.reload
    assert_equal @poll.answers_count, 3
    assert_equal @user.polls_count, 1
  end

  test "增加选项的数量" do
    @poll = Poll.create(@params)
    @poll.update_attributes(:answers => [{:description => 'answer4'}, {:description => 'answer5'}])
    @poll.reload
    assert_equal @poll.answers_count, 5
  end

  # 测试 validate
  test "没有名字" do
    @poll = Poll.create(@params.merge({:name => nil}))
    assert_equal @poll.errors.on_base, '名字不能为空'
  end

  test "没有游戏" do
    @poll = Poll.create(@params.merge({:game_id => nil}))
    assert_equal @poll.errors.on_base, '游戏类别不能为空'
  end

  test "游戏不存在" do
    @poll = Poll.create(@params.merge({:game_id => 5}))
    assert_equal @poll.errors.on_base, '游戏不存在'
  end

  test "截止时间比现在早" do
    @poll = Poll.create(@params.merge({:deadline => 1.days.ago.to_s(:db)}))
    assert_equal @poll.errors.on_base, '截止时间不能比现在早'
  end

end
