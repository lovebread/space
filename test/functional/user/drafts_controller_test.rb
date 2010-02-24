require 'test_helper'

class User::DraftsControllerTest < ActionController::TestCase

  def setup
    @user = User.find(2)
    @draft = Blog.create({:digs_count => 1, :created_at => 4.days.ago, :game_id => 1, :poster_id => 2, :draft => true, :title => 'title', :content => 'content', :privilege => 1})
    @params = {:digs_count => 2, :created_at => 4.days.ago, :game_id => 1, :poster_id => 2, :draft => true, :title => 'title', :content => 'content', :privilege => 1}
    @user.reload
  end

  # 测试 index
  # 只能看自己的
  test "自己看" do
    get 'index', {:id => 2}, {:user_id => 2}
    assert_equal assigns(:blogs).count, 1
  end

  test "别人试图看，但是只能看自己的" do
    get 'index', {:id => 2}, {:user_id => 1}
    assert_equal assigns(:blogs).count, 0
  end

  # 测试 edit
  test "编辑自己的草稿" do
    get 'edit', {:id => @draft.id}, {:user_id => 2}
    assert_template 'user/drafts/edit'
    assert_equal assigns(:blog), @draft
  end

  test "编辑别人的草稿" do
    get 'edit', {:id=> @draft.id}, {:user_id => 4}
    assert_template 'not_found'
  end

  # 测试保存
  test "保存为草稿" do
    post 'create', {:blog => @params}, {:user_id => 2}
    @user.reload
    assert_equal @user.drafts_count, 2  
  end

  # 测试更新
  test "更新草稿" do
    put 'update', {:id => @draft.id, :blog => @params}, {:user_id => 2}
    @draft.reload
    assert @draft.draft
    assert_equal @draft.digs_count, 2 
  end

  test "更新别人的草稿" do
    put 'update', {:id => @draft.id}, {:user_id => 4}
    assert_template 'not_found'
  end

  # 测试删除
  test "删除草稿" do
    delete 'destroy', {:id => @draft.id}, {:user_id => 2}
    @user.reload
    assert_equal @user.drafts_count, 0 
  end

  test "删除别人的草稿"do
    delete 'destroy', {:id => @draft.id}, {:user_id => 4}
    assert_template 'not_found'
  end

end
