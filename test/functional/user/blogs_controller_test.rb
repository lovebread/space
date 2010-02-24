require 'test_helper'

# 如何测试page.redirect_to
class User::BlogsControllerTest < ActionController::TestCase

  include AuthenticatedTestHelper

  fixtures :all

  def setup
    @user1 = User.find(1)
    @user2 = User.find(2)
    @user3 = User.find(3)
    @user4 = User.find(4)
    @blog1 = Blog.create({:digs_count => 1, :created_at => 1.days.ago, :game_id => 1, :poster_id => 2, :draft => false, :title => 'title', :content => 'content', :privilege => 1})
    @blog2 = Blog.create({:digs_count => 2, :created_at => 2.days.ago, :game_id => 1, :poster_id => 2, :draft => false, :title => 'title', :content => 'content', :privilege => 2})
    @blog3 = Blog.create({:digs_count => 3, :created_at => 3.days.ago, :game_id => 1, :poster_id => 2, :draft => false, :title => 'title', :content => 'content', :privilege => 3})
    @blog4 = Blog.create({:digs_count => 4, :created_at => 4.days.ago, :game_id => 1, :poster_id => 2, :draft => false, :title => 'title', :content => 'content', :privilege => 4})
    @draft = Blog.create({:created_at => 4.days.ago, :game_id => 1, :poster_id => 2, :draft => true, :title => 'title', :content => 'content', :privilege => 1})
    @params = {:game_id => 1, :draft => false, :title => 'title', :content => 'content', :privilege => 1}
    @user2.reload
  end

  # 测试index页面
  test "自己观看" do
    get 'index', {:id => 2}, {:user_id => 2}
    
    # 返回的是index页面
    assert_template 'user/blogs/index'

    # 显示4个日志，并且按照创建时间排列
    blogs = assigns(:blogs)
    assert_equal blogs.count, 4
    assert_equal blogs[0], @blog1
    assert_equal blogs[1], @blog2
    assert_equal blogs[2], @blog3
    assert_equal blogs[3], @blog4

    # 可以对这4个日志编辑或者删除
    edit_link_exist_for [@blog1, @blog2, @blog3, @blog4]
    delete_link_exist_for [@blog1, @blog2, @blog3, @blog4]
  end

  test "好友观看" do
    get 'index', {:id => 2}, {:user_id => 1}

    # 返回的是index页面
    assert_template 'user/blogs/index'

    # 显示3个日志，按照创建时间排列
    blogs = assigns(:blogs)
    assert_equal blogs.count, 3
    assert_equal blogs[0], @blog1
    assert_equal blogs[1], @blog2
    assert_equal blogs[2], @blog3

    # 不能编辑或者删除
    edit_link_not_exist_for [@blog1, @blog2, @blog3]   
    delete_link_not_exist_for [@blog1, @blog2, @blog3]
  end

  test "非好友，但是有相同游戏的人观看" do
    get 'index', {:id => 2}, {:user_id => 3}

    # 不能看到，必须先成为好友
    assert_redirected_to new_friend_url(:id => @user2.id)
  end

  test "完全陌生人观看" do
    get 'index', {:id => 2}, {:user_id => 4}

    # 不能看到，必须先成为好友
    assert_redirected_to new_friend_url(:id => @user2.id)
  end

  # 测试show页面
  test "user1观看user2的所有博客" do
    # 只能看，不能编辑和删除
    get 'show', {:id => @blog1.id}, {:user_id => 1}
    assert_template 'user/blogs/show'
    assert_equal assigns(:blog), @blog1
    edit_link_not_exist_for [@blog1]
    delete_link_not_exist_for [@blog1]

    # 只能看，不能编辑和删除
    get 'show', {:id => @blog2.id}
    assert_template 'user/blogs/show' 
    assert_equal assigns(:blog), @blog2
    edit_link_not_exist_for [@blog2]
    delete_link_not_exist_for [@blog2]

    # 只能看，不能编辑和删除
    get 'show', {:id => @blog3.id}
    assert_template 'user/blogs/show' 
    assert_equal assigns(:blog), @blog3
    edit_link_not_exist_for [@blog3]
    delete_link_not_exist_for [@blog3]

    # 没有权限看
    get 'show', {:id => @blog4.id}
    assert_not_found
  end

  test "user2观看user2的所有博客" do
    # 本人有权限看自己的所有日志，并能编辑和删除
    get 'show', {:id => @blog1.id}, {:user_id => 2}
    assert_template 'user/blogs/show'
    assert_equal assigns(:blog), @blog1
    edit_link_exist_for [@blog1]
    delete_link_exist_for [@blog1]

    get 'show', {:id => @blog2.id}
    assert_template 'user/blogs/show' 
    assert_equal assigns(:blog), @blog2
    edit_link_exist_for [@blog2]
    delete_link_exist_for [@blog2]

    get 'show', {:id => @blog3.id}
    assert_template 'user/blogs/show' 
    assert_equal assigns(:blog), @blog3
    edit_link_exist_for [@blog3]
    delete_link_exist_for [@blog3]

    get 'show', {:id => @blog4.id}
    assert_template 'user/blogs/show'
    assert_equal assigns(:blog), @blog4
    edit_link_exist_for [@blog4]
    delete_link_exist_for [@blog4]
  end

  test "user3观看user2的所有博客" do
    # 可以看，但是不能编辑和删除
    get 'show', {:id => @blog1.id}, {:user_id => 3}
    assert_template 'user/blogs/show'
    assert_equal assigns(:blog), @blog1
    edit_link_not_exist_for [@blog1]
    delete_link_not_exist_for [@blog1]

    # 可以看，但是不能编辑和删除
    get 'show', {:id => @blog2.id}
    assert_template 'user/blogs/show' 
    assert_equal assigns(:blog), @blog2
    edit_link_not_exist_for [@blog2]
    delete_link_not_exist_for [@blog2]

    # 只有好友能看，必须先加为好友
    get 'show', {:id => @blog3.id}
    redirect_to_new_friend

    # 没有权限看
    get 'show', {:id => @blog4.id}
    assert_not_found
  end

  test "user4观看user2的所有博客" do
    # 可以看，不能编辑和删除
    get 'show', {:id => @blog1.id}, {:user_id => 4}
    assert_template 'user/blogs/show'
    assert_equal assigns(:blog), @blog1
    edit_link_not_exist_for [@blog1]
    delete_link_not_exist_for [@blog1]

    # 必须先加为好友才能看
    get 'show', {:id => @blog2.id}
    redirect_to_new_friend
    get 'show', {:id => @blog3.id}
    redirect_to_new_friend

    # 没有权限看
    get 'show', {:id => @blog4.id}
    assert_not_found
  end

  # 测试create
  test "创建博客" do
    # 正确的params
    post 'create', {:blog => @params}, {:user_id => 3}
    @user3.reload
    assert_equal @user3.blogs_count, 1
   
    # 带有tag的博客
    post 'create', {:blog => @params.merge({:friend_tags => [1]})}
    @user3.reload
    blog = assigns(:blog)
    blog.reload
    assert_equal @user3.blogs_count, 2
    assert_equal blog.tags_count, 1
 
    # 错误的params
    post 'create', {:blog => nil}
    @user3.reload
    assert_equal @user3.blogs_count, 2
  end

  test "将草稿保存为博客" do
    put 'update', {:id => @draft.id}, {:user_id => 2}
    @user2.reload
    assert_equal @user2.blogs_count, 5
    assert_equal @user2.drafts_count, 0
  end

  # 测试edit
  test "编辑自己的博客" do
    get 'edit', {:id => @blog1.id}, {:user_id => 2}
    assert_template 'user/blogs/edit'
  end

  test "编辑别人的博客" do
    get 'edit', {:id => @blog1.id}, {:user_id => 4}
    assert_not_found
  end

  # 测试update
  test "更新自己博客" do
    # 正确的params
    put 'update', {:blog => @params, :id => @blog2.id}, {:user_id => 2}
    @blog2.reload
    assert_equal @blog2.privilege, 1
    
    # 错误的params
    put 'update', {:blog => {:privilege => 3, :title => nil}, :id => @blog2.id}
    @blog2.reload
    assert_equal @blog2.privilege, 1 
  end

  test "更新别人的博客" do
    put 'update', {:blog => @params, :id => @blog1.id}, {:user_id => 4}
    assert_not_found
  end

  # 测试destroy
  test "删除自己的博客" do
    delete 'destroy', {:id => @blog1.id}, {:user_id => 2}
    @user2.reload
    assert_equal @user2.blogs_count, 3
  end

  test "删除别人的博客" do
    delete 'destroy', {:id => @blog1.id}, {:user_id => 4}
    assert_not_found
  end

  # 测试hot, recent和friends
  test "热门博客" do
    get 'hot', {:id => 1}, {:user_id => 1}

    # 返回的是hot页面
    assert_template 'user/blogs/hot'

    # 返回3篇日志，按照digs_count排列
    blogs = assigns(:blogs)
    assert_equal blogs.count, 3
    assert_equal blogs[0], @blog3
    assert_equal blogs[1], @blog2
    assert_equal blogs[2], @blog1
  end
    
  test "最新博客" do
    get 'recent', {:id => 1}, {:user_id => 1}
  
    # 返回的是recent页面
    assert_template 'user/blogs/recent'
    
    # 返回3篇日志，按照digs_count排列
    blogs = assigns(:blogs)
    assert_equal blogs.count, 3
    assert_equal blogs[0], @blog1
    assert_equal blogs[1], @blog2
    assert_equal blogs[2], @blog3
  end
    
  test "好友博客" do
    get 'friends', {}, {:user_id => 1}

    # 返回friends页面
    assert_template 'user/blogs/friends'

    # 共3篇日志，按照时间排列
    blogs = assigns(:blogs)
    assert_equal blogs.count, 3
    assert_equal blogs[0], @blog1
    assert_equal blogs[1], @blog2
    assert_equal blogs[2], @blog3
  end
  
protected

  def redirect_to_new_friend
    assert_redirected_to new_friend_url(:id => @user2.id)
  end

  def assert_not_found
    assert_template 'not_found'
  end

  def edit_link_exist_for blogs
    blogs.each do |blog|
      assert_tag :tag => 'a', :attributes => {:href => edit_blog_url(blog)}
    end
  end

  def edit_link_not_exist_for blogs
    blogs.each do |blog|
      assert_no_tag :tag => 'a', :attributes => {:href => edit_blog_url(blog)}
    end
  end

  def delete_link_exist_for blogs
    blogs.each do |blog|
      assert_tag :tag => 'a', :attributes => {:href => blog_url(blog), :rel => 'facebox', :facebox_method => 'delete', :facebox_type => 'confirm'}
    end
  end

  def delete_link_not_exist_for blogs
    blogs.each do |blog|
      assert_no_tag :tag => 'a', :attributes => {:href => blog_url(blog), :rel => 'facebox', :facebox_method => 'delete', :facebox_type => 'confirm'}
    end
  end

end
