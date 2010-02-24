require 'test_helper'

class User::Polls::AnswersControllerTest < ActionController::TestCase

  def setup
    @user = User.find(2)
    @poll = Poll.create({:name => 'name', :game_id => 1, :poster_id => 2, :no_deadline => false, :deadline => 1.days.from_now.to_s(:db), :max_multiple => 2, :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}], :privilege => 1, :created_at => 1.days.ago})
    @user.reload
  end

  # 测试 new
  test "创建者试图增加选项" do
    get 'new', {:poll_id => @poll.id}, {:user_id => 2}
    assert_template 'user/polls/answers/new'
  end

  test "别人试图增加选项" do
    get 'new', {:poll_id => @poll.id}, {:user_id => 4}
    assert_template 'not_found'
  end

  # 测试 create
  test "创建者增加选项" do
    post 'create', {:poll_id => @poll.id, :poll => {:answers => [{:description => '123'}, {:description => '456'}]}}, {:user_id => 2}
    @poll.reload
    assert_equal @poll.answers_count, 5
  end

  test "别人增加选项" do
    post 'create', {:poll_id => @poll.id, :poll => {:answers => [{:description => '123'}, {:description => '456'}]}}, {:user_id => 4}
    assert_template 'not_found'
  end

end
