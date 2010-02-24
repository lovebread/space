require 'test_helper'

class User::StatusesControllerTest < ActionController::TestCase

  fixtures :all
  
  def setup
    @status1 = Status.create(:poster_id => 2, :content => '1', :created_at => 1.days.ago)
    @status2 = Status.create(:poster_id => 2, :content => '2', :created_at => 2.days.ago)
  end

  # 测试index页面
  test "好友查看index页面" do
    get 'index', {:id => 2}, {:user_id => 1}
    
    assert_template 'user/statuses/index'

    statuses = assigns(:statuses)
    assert_equal statuses.count, 2
    assert_equal statuses[0], @status1
    assert_equal statuses[1], @status2

    delete_link_not_exist_for [@status1, @status2]
  end

  test "自己查看index页面" do
    get 'index', {:id => 2}, {:user_id => 2}
    
    assert_template 'user/statuses/index'

    statuses = assigns(:statuses)
    assert_equal statuses.count, 2
    assert_equal statuses[0], @status1
    assert_equal statuses[1], @status2

    delete_link_exist_for [@status1, @status2]
  end

  test "不是好友，但玩相同游戏的人查看" do
    get 'index', {:id => 2}, {:user_id => 3}
    assert_redirected_to new_friend_url(:id => 2)
  end

  test "陌生人查看" do
    get 'index', {:id => 2}, {:user_id => 4}
    assert_redirected_to new_friend_url(:id => 2)
  end

  # 测试friends
  test "查看好友状态" do
    get 'friends', {}, {:user_id => 1}

    assert_template 'user/statuses/friends'

    statuses = assigns(:statuses)
    assert_equal statuses.count, 2

    # 应该有“更多”的连接
    more_link_exist_for [@status1, @status2]
  end

  test "好友没有状态，仍然查看好友状态" do
    get 'friends', {}, {:user_id => 2}
    statuses = assigns(:statuses)
    assert_template 'user/statuses/friends'
    assert_equal statuses.count, 0
  end

  # 测试创建
  test "在状态主页里创建状态" do
    post 'create', {:status => {:content => '123'}, :home => 0}, {:user_id => 2}
    assert_select_rjs :insert, :top, 'statuses'
    assert_equal User.find(2).statuses_count, 3
 
    post 'create', {:status => {:content => '456', :poster_id => 3}, :home => 0}
    assert_select_rjs :insert, :top, 'statuses'
    assert_equal User.find(2).statuses_count, 4

    post 'create', {:status => {:content => nil}, :home => 0}
    assert_equal User.find(2).statuses_count, 4
    status = assigns(:status)
    assert_not_nil status.errors.on_base
  end

  test "在首页更新状态" do
    post 'create', {:status => {:content => '123'}, :home => 1}, {:user_id => 2}
    assert_select_rjs :replace_html, 'latest_status'
    assert_equal User.find(2).statuses_count, 3

    post 'create', {:status => {:content => '456', :poster_id => 3}, :home => 1}
    assert_select_rjs :replace_html, 'latest_status'
    assert_equal User.find(2).statuses_count, 4

    post 'create', {:status => {:content => nil}, :home => 1}
    assert_equal User.find(2).statuses_count, 4
    status = assigns(:status)
    assert_not_nil status.errors.on_base
  end

  # 测试删除
  test "删除自己的" do
    delete 'destroy', {:id => @status1.id}, {:user_id => 2}
    assert_equal User.find(2).statuses_count, 1
  end

  test "删除别人的" do
    delete 'destroy', {:id => @status1.id}, {:user_id => 3}
    assert_template 'not_found'
  end

protected

  def delete_link_exist_for statuses
    statuses.each do |status|
      assert_tag :tag => 'a', :attributes => {:href => status_url(status), :rel => 'facebox', :facebox_type => 'confirm', :facebox_method => 'delete'}
    end
  end

  def delete_link_not_exist_for statuses
    statuses.each do |status|
      assert_no_tag :tag => 'a', :attributes => {:href => status_url(status), :rel => 'facebox', :facebox_type => 'confirm', :facebox_method => 'delete'}
    end
  end

  def more_link_exist_for statuses
    statuses.each do |status|
      assert_tag :tag => 'a', :attributes => {:href => statuses_url(:id => status.poster_id)}
    end
  end

  def more_link_not_exist_for statuses
    statuses.each do |status|
      assert_tag :tag => 'a', :attributes => {:href => statuses_url(:id => status.poster_id)}
    end
  end

end
