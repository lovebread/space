require 'test_helper'

class User::PollsControllerTest < ActionController::TestCase

  fixtures :all

  def setup
    @user = User.find(2)
    @p1 = Poll.create({:name => 'name', :game_id => 1, :poster_id => 2, :no_deadline => false, :deadline => 1.days.from_now.to_s(:db), :max_multiple => 2, :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}], :privilege => 1, :created_at => 1.days.ago})
    @p2 = Poll.create({:name => 'name', :game_id => 1, :poster_id => 2, :no_deadline => true, :max_multiple => 2, :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}], :privilege => 1, :created_at => 2.days.ago})
    @p3 = Poll.create({:name => 'name', :game_id => 1, :poster_id => 2, :no_deadline => false, :deadline => 1.days.from_now.to_s(:db), :max_multiple => 2, :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}], :privilege => 2, :created_at => 3.days.ago})
    @params = {:name => 'name', :game_id => 1, :poster_id => 2, :no_deadline => false, :deadline => 1.days.from_now.to_s(:db), :max_multiple => 2, :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}], :privilege => 2, :created_at => 4.days.ago}
    @user.reload
  end

  # 测试 index
  test "本人查看" do
    get 'index', {:id => 2}, {:user_id => 2}
    assert_template 'user/polls/index'
    polls = assigns(:polls)
    assert_equal polls.count, 3
    assert_equal polls[0], @p1
    assert_equal polls[1], @p2
    assert_equal polls[2], @p3
  end

  test "好友查看" do
    get 'index', {:id => 2}, {:user_id => 1}
    assert_template 'user/polls/index'
    polls = assigns(:polls)
    assert_equal polls.count, 3
    assert_equal polls[0], @p1
    assert_equal polls[1], @p2
    assert_equal polls[2], @p3
  end

  test "相同游戏人查看" do
    get 'index', {:id => 2}, {:user_id => 3}
    assert_redirected_to new_friend_url(:id => 2)
  end

  test "陌生人查看" do
    get 'index', {:id => 2}, {:user_id => 4}
    assert_redirected_to new_friend_url(:id => 2)
  end

  # 测试 show
  test "本人查看投票, 投票有截至日期而且对任何人开放" do
    # 没有投票前
    get 'show', {:id => @p1.id}, {:user_id => 2}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p1
    share_link_exist_for @p1
    edit_deadline_link_exist_for @p1
    new_answers_link_exist_for @p1
    invite_link_exist_for @p1
    delete_link_exist_for @p1
    submit_exist_for @p1
    explanation_not_exist

    @p1.votes.create(:voter_id => 2, :answer_ids => [@p1.answers.first.id])    
   
    # 投票后 
    get 'show', {:id => @p1.id}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p1
    share_link_exist_for @p1
    edit_deadline_link_exist_for @p1
    new_answers_link_exist_for @p1
    invite_link_exist_for @p1
    delete_link_exist_for @p1
    submit_not_exist_for @p1
    explanation_exist
  end

  test "好友查看投票, 投票有截至日期而且对任何人开放" do
    get 'show', {:id => @p1.id}, {:user_id => 1}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p1
    share_link_exist_for @p1
    edit_deadline_link_not_exist_for @p1
    new_answers_link_not_exist_for @p1
    invite_link_not_exist_for @p1
    delete_link_not_exist_for @p1
    submit_exist_for @p1
    explanation_not_exist

    @p1.votes.create(:voter_id => 1, :answer_ids => [@p1.answers.first.id])

    # 投票后
    get 'show', {:id => @p1.id}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p1
    share_link_exist_for @p1
    edit_deadline_link_not_exist_for @p1
    new_answers_link_not_exist_for @p1
    invite_link_not_exist_for @p1
    delete_link_not_exist_for @p1
    submit_not_exist_for @p1
    explanation_exist
  end

  test "相同游戏人查看投票, 投票有截至日期而且对任何人开放" do
    get 'show', {:id => @p1.id}, {:user_id => 3}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p1
    share_link_exist_for @p1
    edit_deadline_link_not_exist_for @p1
    new_answers_link_not_exist_for @p1
    invite_link_not_exist_for @p1
    delete_link_not_exist_for @p1
    submit_exist_for @p1
    explanation_not_exist

    @p1.votes.create(:voter_id => 3, :answer_ids => [@p1.answers.first.id])

    # 投票后
    get 'show', {:id => @p1.id}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p1
    share_link_exist_for @p1
    edit_deadline_link_not_exist_for @p1
    new_answers_link_not_exist_for @p1
    invite_link_not_exist_for @p1
    delete_link_not_exist_for @p1
    submit_not_exist_for @p1
    explanation_exist 
  end

  test "陌生人查看投票, 投票有截至日期而且对任何人开放" do
    get 'show', {:id => @p1.id}, {:user_id => 4}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p1
    share_link_exist_for @p1
    edit_deadline_link_not_exist_for @p1
    new_answers_link_not_exist_for @p1
    invite_link_not_exist_for @p1
    delete_link_not_exist_for @p1
    submit_exist_for @p1
    explanation_not_exist

    @p1.votes.create(:voter_id => 4, :answer_ids => [@p1.answers.first.id])

    # 投票后
    get 'show', {:id => @p1.id}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p1
    share_link_exist_for @p1
    edit_deadline_link_not_exist_for @p1
    new_answers_link_not_exist_for @p1
    invite_link_not_exist_for @p1
    delete_link_not_exist_for @p1
    submit_not_exist_for @p1
    explanation_exist
  end

  test "本人查看投票, 投票有截至日期而且只对好友开放" do
    get 'show', {:id => @p3.id}, {:user_id => 2}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p3
    share_link_exist_for @p3
    edit_deadline_link_exist_for @p3
    new_answers_link_exist_for @p3
    invite_link_exist_for @p3
    delete_link_exist_for @p3
    submit_exist_for @p3
    explanation_not_exist

    @p3.votes.create(:voter_id => 2, :answer_ids => [@p3.answers.first.id])

    # 投票后
    get 'show', {:id => @p3.id}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p3
    share_link_exist_for @p3
    edit_deadline_link_exist_for @p3
    new_answers_link_exist_for @p3
    invite_link_exist_for @p3
    delete_link_exist_for @p3
    submit_not_exist_for @p3
    explanation_exist
  end

  test "好友查看投票, 投票有截至日期而且只对好友开放" do
    get 'show', {:id => @p3.id}, {:user_id => 1}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p3
    share_link_exist_for @p3
    edit_deadline_link_not_exist_for @p3
    new_answers_link_not_exist_for @p3
    invite_link_not_exist_for @p3
    delete_link_not_exist_for @p3
    submit_exist_for @p3
    explanation_not_exist

    @p3.votes.create(:voter_id => 1, :answer_ids => [@p3.answers.first.id])

    # 投票后
    get 'show', {:id => @p3.id}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p3
    share_link_exist_for @p3
    edit_deadline_link_not_exist_for @p3
    new_answers_link_not_exist_for @p3
    invite_link_not_exist_for @p3
    delete_link_not_exist_for @p3
    submit_not_exist_for @p3
    explanation_exist
  end

  test "相同游戏查看投票, 投票有截至日期而且只对好友开放" do
    get 'show', {:id => @p3.id}, {:user_id => 3}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p3
    share_link_exist_for @p3
    edit_deadline_link_not_exist_for @p3
    new_answers_link_not_exist_for @p3
    invite_link_not_exist_for @p3
    delete_link_not_exist_for @p3
    submit_not_exist_for @p3
    explanation_not_exist
  end

  test "陌生人查看投票, 投票有截至日期而且只对好友开放" do
    get 'show', {:id => @p3.id}, {:user_id => 4}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p3
    share_link_exist_for @p3
    edit_deadline_link_not_exist_for @p3
    new_answers_link_not_exist_for @p3
    invite_link_not_exist_for @p3
    delete_link_not_exist_for @p3
    submit_not_exist_for @p3
    explanation_not_exist
  end

  test "本人查看过期投票" do
    setup_expired_poll
    get 'show', {:id => @p.id}, {:user_id => 1}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p
    share_link_not_exist_for @p
    edit_deadline_link_not_exist_for @p3
    new_answers_link_not_exist_for @p3
    invite_link_not_exist_for @p3
    delete_link_not_exist_for @p3
    submit_not_exist_for @p3
    explanation_exist
  end

  test "好友查看过期投票" do
    setup_expired_poll
    get 'show', {:id => @p.id}, {:user_id => 1}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p
    share_link_not_exist_for @p
    edit_deadline_link_not_exist_for @p3
    new_answers_link_not_exist_for @p3
    invite_link_not_exist_for @p3
    delete_link_not_exist_for @p3
    submit_not_exist_for @p3
    explanation_exist
  end

  test "相同游戏查看过期投票" do
    setup_expired_poll
    get 'show', {:id => @p.id}, {:user_id => 3}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p
    share_link_not_exist_for @p
    edit_deadline_link_not_exist_for @p3
    new_answers_link_not_exist_for @p3
    invite_link_not_exist_for @p3
    delete_link_not_exist_for @p3
    submit_not_exist_for @p3
    explanation_exist
  end

  test "陌生人查看过期投票" do
    setup_expired_poll
    get 'show', {:id => @p.id}, {:user_id => 4}
    assert_template 'user/polls/show'
    assert_equal assigns(:poll), @p
    share_link_not_exist_for @p
    edit_deadline_link_not_exist_for @p3
    new_answers_link_not_exist_for @p3
    invite_link_not_exist_for @p3
    delete_link_not_exist_for @p3
    submit_not_exist_for @p3
    explanation_exist
  end

  # 测试 new
  test "nothing to test" do
  end

  # 测试 create
  test "正确参数创建" do
    post 'create', {:poll => @params}, {:user_id => 2}
    @user.reload
    assert_redirected_to poll_url(assigns(:poll))
    assert_equal @user.polls_count, 4    
  end

  test "错误参数创建" do
    post 'create', {:poll => @params.merge({:name => nil})}, {:user_id => 2}
    @user.reload
    assert_template 'user/polls/new'
    assert_equal @user.polls_count, 3
  end

  # 测试 edit
  test "创建者编辑" do
    get 'edit', {:id => @p1.id, :type => 0}, {:user_id => 2}
    assert_template 'user/polls/edit_deadline'
    assert_equal assigns(:poll), @p1
    get 'edit', {:id => @p1.id, :type => 1}
    assert_template 'user/polls/edit_summary'
  end

  test "非创建者编辑" do
    get 'edit', {:id => @p1.id}, {:user_id => 3}
    assert_template 'not_found'
  end

  # 测试 update
  test "创建者更新" do
    put 'update', {:id => @p1.id, :poll => {:answers => [{:description => 'a'}, {:description => 'a'}]}}, {:user_id => 2}
    @p1.reload
    assert_equal @p1.answers_count, 5
  end

  test "非创建者更新" do
    put 'update', {:id => @p1.id, :poll => {:answers => [{:description => 'a'}, {:description => 'a'}]}}, {:user_id => 3}
    assert_template 'not_found'
  end

  # 测试 destroy
  test "创建者删除" do
    delete 'destroy', {:id => @p1.id}, {:user_id => 2}
    @user.reload
    assert_equal @user.polls_count, 2
  end

  test "非创建者删除" do
    delete 'destroy', {:id => @p1.id}, {:user_id => 3}
    assert_template 'not_found'
  end

  # 测试 hot
  test "hot page" do
    @p3.votes.create(:voter_id => 1, :answer_ids => [@p3.answers.first.id])
    @p3.votes.create(:voter_id => 2, :answer_ids => [@p3.answers.first.id])
    @p1.votes.create(:voter_id => 1, :answer_ids => [@p1.answers.first.id])
    @p1.reload
    @p2.reload
    @p3.reload
    get 'hot', {}, {:user_id => 4}
    assert_template 'user/polls/hot'
    polls = assigns(:polls)
    assert_equal polls.count, 3
    assert_equal polls[0], @p3
    assert_equal polls[1], @p1
    assert_equal polls[2], @p2
  end

  test "recent page" do
    get 'recent', {}, {:user_id => 4}
    assert_template 'user/polls/recent'
    polls = assigns(:polls)
    assert_equal polls.count, 3
    assert_equal polls[0], @p1
    assert_equal polls[1], @p2
    assert_equal polls[2], @p3
  end

protected

  def share_link_exist_for poll
    assert_tag :tag => 'a', :attributes => {:href => CGI.escapeHTML(new_sharing_url(:shareable_type => 'Poll', :shareable_id => poll.id))}
  end

  def share_link_not_exist_for poll
    assert_no_tag :tag => 'a', :attributes => {:href => CGI.escapeHTML(new_sharing_url(:shareable_type => 'Poll', :shareable_id => poll.id))}
  end

  def edit_deadline_link_exist_for poll
    assert_tag :tag => 'a', :attributes => {:href => edit_poll_url(poll, :type => 0)}
  end

  def edit_deadline_link_not_exist_for poll
    assert_no_tag :tag => 'a', :attributes => {:href => edit_poll_url(poll, :type => 0)}
  end

  def new_answers_link_exist_for poll
    assert_tag :tag => 'a', :attributes => {:href => new_poll_answer_url(poll)}
  end

  def new_answers_link_not_exist_for poll 
    assert_no_tag :tag => 'a', :attributes => {:href => new_poll_answer_url(poll)}
  end

  def invite_link_exist_for poll
    assert_tag :tag => 'a', :attributes => {:href => new_poll_invitation_url(poll)}
  end

  def invite_link_not_exist_for poll
    assert_no_tag :tag => 'a', :attributes => {:href => new_poll_invitation_url(poll)}
  end

  def delete_link_exist_for poll
    assert_tag :tag => 'a', :attributes => {:href => poll_url(poll), :rel => 'facebox', :facebox_method => 'delete', :facebox_type => 'confirm'}
  end

  def delete_link_not_exist_for poll
    assert_no_tag :tag => 'a', :attributes => {:href => poll_url(poll), :rel => 'facebox', :facebox_method => 'delete', :facebox_type => 'confirm'}
  end

  def submit_exist_for poll
    assert_tag :tag => 'button', :attributes => {:type => 'submit'}
  end

  def submit_not_exist_for poll
    assert_no_tag :tag => 'button', :attributes => {:type => 'submit'}
  end
  
  def explanation_exist
    assert_tag :tag => 'div', :attributes => {:id => 'poll_explanation'}
  end

  def explanation_not_exist
    assert_no_tag :tag => 'div', :attributes => {:id => 'poll_explanation'}
  end

  def setup_expired_poll
    @p = Poll.new({:name => 'name', :game_id => 1, :poster_id => 2, :no_deadline => false, :deadline => 1.days.ago.to_s(:db), :max_multiple => 2, :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}], :privilege => 1, :created_at => 3.days.ago})
    @p.save_with_validation(false)
  end
 
end
