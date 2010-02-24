require 'test_helper'

class User::NotificationsControllerTest < ActionController::TestCase

  def setup
    @g = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => 1})
    @i = Membership.create(:user_id => 2, :status => 1, :guild_id => @g.id)
    @i.destroy
    @i = Membership.create(:user_id => 2, :status => 1, :guild_id => @g.id)
    @i.destroy
    @n1 = User.find(2).notifications.first
    @n2 = User.find(2).notifications.last
  end

  test "index" do
    get 'index', {}, {:user_id => 2}
    @n1.reload
    @n2.reload
    assert_template 'user/notifications/index'
    assert_equal assigns(:notifications).count, 2
    assert @n1.read
    assert @n2.read
  end

  test "first_five" do
    get 'first_five', {}, {:user_id => 2}
    @n1.reload
    @n2.reload
    assert_template 'user/notifications/first_five'
    assert_equal assigns(:notifications).count, 2
    assert @n1.read
    assert @n2.read
  end

  test "本人删除通知" do
    delete 'destroy', {:id => @n1.id}, {:user_id => 2}
    assert_equal User.find(2).notifications_count, 1
  end

  test "别人删除通知" do
    delete 'destroy', {:id => @n1.id}, {:user_id => 3}
    assert_template 'not_found'
  end

  test "本人删除所有通知" do
    delete 'destroy_all', {}, {:user_id => 2}
    assert_equal User.find(2).notifications_count, 0
  end

  test "别人删除所有通知" do
    delete 'destroy', {:id => @n1.id}, {:user_id => 3}
    assert_template 'not_found'
  end

end
