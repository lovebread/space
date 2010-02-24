require 'test_helper'

class User::NoticesControllerTest < ActionController::TestCase

  def setup
    @b1 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 't', :content => 'c', :privilege => 1})
    @b2 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 't', :content => 'c', :friend_tags => [1, 2], :privilege => 1})
    c = @b1.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123')
    @n1 = c.notices.first
    c = @b1.comments.create(:poster_id => 3, :recipient_id => 2, :content => '234')
    @n2 = c.notices.first
    c = @b2.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123')
    @n3 = c.notices.first
    c = @b2.comments.create(:poster_id => 3, :recipient_id => 2, :content => '234')
    @n4 = c.notices.first
  end

  # 测试 index
  test "index" do
    get 'index', {}, {:user_id => 2}
    assert_template 'user/notices/index'
    assert_equal assigns(:notices).count, 4
    @n1.reload
    @n2.reload
    @n3.reload
    @n4.reload
    assert !@n1.read
    assert !@n2.read
    assert !@n3.read
    assert !@n4.read
  end

  # 测试 first_ten
  test "first ten" do
    get 'first_ten', {}, {:user_id => 2}
    assert_template :partial => 'user/notices/_notices'
    assert_equal assigns(:notices).count, 4
    @n1.reload
    @n2.reload
    @n3.reload
    @n4.reload
    assert !@n1.read
    assert !@n2.read
    assert !@n3.read
    assert !@n4.read
  end

  # 测试 read
  test "本人read" do
    put 'read', {:id => @n1.id}, {:user_id => 2}
    assert_template :partial => 'user/notices/_notices'
    assert_equal assigns(:notices).count, 2
    @n1.reload
    @n2.reload
    @n3.reload
    @n4.reload
    assert @n1.read
    assert @n2.read
    assert !@n3.read
    assert !@n4.read

    put 'read', {:id => @n3.id}
    assert_template :partial => 'user/notices/_notices'
    assert_equal assigns(:notices).count, 0
    @n1.reload
    @n2.reload
    @n3.reload
    @n4.reload
    assert @n1.read
    assert @n2.read
    assert @n3.read
    assert @n4.read
  end

  test "别人read" do
    put 'read', {:id => @n1.id}, {:user_id => 3}
    assert_template 'not_found'
  end

end
