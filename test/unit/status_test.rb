require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  
  def setup
    @user = User.find(1)
    @params = {:poster_id => @user.id, :content => 'status content'}
  end

  # 测试计数器
  test "用户计数器" do
    Status.create(@params)
    @user.reload
    assert_equal @user.statuses_count, 1
  end

  # 测试validation
  test "没有作者" do
    @status = Status.create(@params.merge({:poster_id => nil}))
    assert_equal @status.errors.on_base, '没有作者'
  end

  test "没有内容" do
    @status = Status.create(@params.merge({:content => nil}))
    assert_equal @status.errors.on_base, '内容为空'
  end

  # 测试好友的状态
  test "好友状态" do
    s1 = Status.create(:poster_id => 2, :content => '2')
    s2 = Status.create(:poster_id => 2, :content => '2')
    statuses = @user.status_feed_items.map(&:originator)
    assert_equal statuses.count, 2
    assert_equal statuses[0], s1
    assert_equal statuses[1], s2
  end

end
