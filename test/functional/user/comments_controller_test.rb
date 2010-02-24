# 这里我偷懒了
# 只写了关于博客评论的，其实最好都写下
require 'test_helper'

class User::CommentsControllerTest < ActionController::TestCase

  # 博客评论 
  test "本人创建博客评论" do
    setup_blog

    post 'create', {:comment => {:commentable_id => @b1.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}, {:user_id => 2}
    @b1.reload
    assert_nil assigns(:comment).errors.on_base
    assert_equal @b1.comments_count, 1

    post 'create', {:comment => {:commentable_id => @b2.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}
    @b2.reload
    assert_nil assigns(:comment).errors.on_base
    assert_equal @b2.comments_count, 1

    post 'create', {:comment => {:commentable_id => @b3.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}
    @b3.reload
    assert_nil assigns(:comment).errors.on_base
    assert_equal @b3.comments_count, 1

    post 'create', {:comment => {:commentable_id => @b4.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}
    @b4.reload
    assert_nil assigns(:comment).errors.on_base
    assert_equal @b4.comments_count, 1
  end

  test "好友创建博客评论" do
    setup_blog

    post 'create', {:comment => {:commentable_id => @b1.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}, {:user_id => 1}
    @b1.reload
    assert_nil assigns(:comment).errors.on_base
    assert_equal @b1.comments_count, 1

    post 'create', {:comment => {:commentable_id => @b2.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}
    @b2.reload
    assert_nil assigns(:comment).errors.on_base
    assert_equal @b2.comments_count, 1

    post 'create', {:comment => {:commentable_id => @b3.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}
    @b3.reload
    assert_nil assigns(:comment).errors.on_base
    assert_equal @b3.comments_count, 1

    post 'create', {:comment => {:commentable_id => @b4.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}
    @b4.reload
    assert_not_nil assigns(:comment).errors.on_base
    assert_equal @b4.comments_count, 0
  end

  test "非好友相同游戏者创建博客评论" do
    setup_blog

    post 'create', {:comment => {:commentable_id => @b1.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}, {:user_id => 3}
    @b1.reload
    assert_nil assigns(:comment).errors.on_base
    assert_equal @b1.comments_count, 1
  
    post 'create', {:comment => {:commentable_id => @b2.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}
    @b2.reload
    assert_nil assigns(:comment).errors.on_base
    assert_equal @b2.comments_count, 1
  
    post 'create', {:comment => {:commentable_id => @b3.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}
    @b3.reload
    assert_not_nil assigns(:comment).errors.on_base
    assert_equal @b3.comments_count, 0

    post 'create', {:comment => {:commentable_id => @b4.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}
    @b4.reload
    assert_not_nil assigns(:comment).errors.on_base
    assert_equal @b4.comments_count, 0
  end

  test "陌生人创建博客评论" do
    setup_blog
  
    post 'create', {:comment => {:commentable_id => @b1.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}, {:user_id => 4}
    @b1.reload
    assert_nil assigns(:comment).errors.on_base
    assert_equal @b1.comments_count, 1

    post 'create', {:comment => {:commentable_id => @b2.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}
    @b2.reload
    assert_not_nil assigns(:comment).errors.on_base
    assert_equal @b2.comments_count, 0

    post 'create', {:comment => {:commentable_id => @b3.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}
    @b3.reload
    assert_not_nil assigns(:comment).errors.on_base
    assert_equal @b3.comments_count, 0

    post 'create', {:comment => {:commentable_id => @b4.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}
    @b4.reload
    assert_not_nil assigns(:comment).errors.on_base
    assert_equal @b4.comments_count, 0
  end

  test "创建博客评论，参数错误" do
    setup_blog

    post 'create', {:comment => {:commentable_id => @b3.id, :commentable_type => 'Blog', :content => '123', :recipient_id => nil}}, {:user_id => 2}
    @b3.reload
    assert_not_nil assigns(:comment).errors.on_base
    assert_equal @b3.comments_count, 0
  end

  test "创建博客评论，没有权限" do
    setup_blog

    post 'create', {:comment => {:commentable_id => @b3.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}, {:user_id => 3}
    @b3.reload
    assert_not_nil assigns(:comment).errors.on_base
    assert_equal @b3.comments_count, 0

    post 'create', {:comment => {:commentable_id => @b4.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2}}
    @b4.reload
    assert_not_nil assigns(:comment).errors.on_base
    assert_equal @b4.comments_count, 0
  end

  test "本人删除博客评论" do
    setup_blog_with_comments
  
    delete 'destroy', {:id => @c1.id}, {:user_id => 2}
    @b1.reload
    assert_equal @b1.comments_count, 0

    delete 'destroy', {:id => @c2.id}
    @b2.reload
    assert_equal @b2.comments_count, 0

    delete 'destroy', {:id => @c3.id}
    @b3.reload
    assert_equal @b3.comments_count, 0
  
    delete 'destroy', {:id => @c4.id}
    @b4.reload
    assert_equal @b4.comments_count, 0
  end

  test "好友删除波肯评论" do
    setup_blog_with_comments

    delete 'destroy', {:id => @c1.id}, {:user_id => 1}
    assert_template 'not_found'

    delete 'destroy', {:id => @c2.id}
    assert_template 'not_found'

    delete 'destroy', {:id => @c3.id}
    assert_template 'not_found' 
 
    delete 'destroy', {:id => @c4.id}
    assert_template 'not_found'
  end

  test "非好友但玩相同游戏的人删除波肯评论" do
    setup_blog_with_comments
  
    delete 'destroy', {:id => @c1.id}, {:user_id => 3}
    assert_template 'not_found'

    delete 'destroy', {:id => @c2.id}
    assert_template 'not_found'

    delete 'destroy', {:id => @c3.id}
    assert_template 'not_found'

    delete 'destroy', {:id => @c4.id}
    assert_template 'not_found'
  end

  test "陌生人删除波肯评论" do
    setup_blog_with_comments

    delete 'destroy', {:id => @c1.id}, {:user_id => 4}
    assert_template 'not_found'

    delete 'destroy', {:id => @c2.id}
    assert_template 'not_found'

    delete 'destroy', {:id => @c3.id}
    assert_template 'not_found'

    delete 'destroy', {:id => @c4.id}
    assert_template 'not_found'
  end

  test "删除博客评论，没有权限" do
    setup_blog

    c = Comment.create(:commentable_id => @b1.id, :commentable_type => 'Blog', :content => '123', :recipient_id => 2, :poster_id => 2)
    delete 'destroy', {:id => c.id}, {:user_id => 4}
    @b1.reload
    assert_template 'not_found'
    assert_equal @b1.comments_count, 1 
  end

  # 测试 index
  test "本人看所有博客评论" do
    setup_blog_with_comments

    get 'index', {:commentable_id => @b1.id, :commentable_type => 'Blog'}, {:user_id => 2}
    assert_equal assigns(:comments).first, @c1

    get 'index', {:commentable_id => @b2.id, :commentable_type => 'Blog'}
    assert_equal assigns(:comments).first, @c2
  
    get 'index', {:commentable_id => @b3.id, :commentable_type => 'Blog'}
    assert_equal assigns(:comments).first, @c3
  
    get 'index', {:commentable_id => @b4.id, :commentable_type => 'Blog'}
    assert_equal assigns(:comments).first, @c4
  end

  test "朋友看所有博客评论" do
    setup_blog_with_comments

    get 'index', {:commentable_id => @b1.id, :commentable_type => 'Blog'}, {:user_id => 1}
    assert_equal assigns(:comments).first, @c1

    get 'index', {:commentable_id => @b2.id, :commentable_type => 'Blog'}
    assert_equal assigns(:comments).first, @c2

    get 'index', {:commentable_id => @b3.id, :commentable_type => 'Blog'}
    assert_equal assigns(:comments).first, @c3

    get 'index', {:commentable_id => @b4.id, :commentable_type => 'Blog'}
    assert_template 'not_found'
  end

  test "非朋友玩相同游戏的人看所有博客评论" do
    setup_blog_with_comments

    get 'index', {:commentable_id => @b1.id, :commentable_type => 'Blog'}, {:user_id => 3}
    assert_equal assigns(:comments).first, @c1

    get 'index', {:commentable_id => @b2.id, :commentable_type => 'Blog'}
    assert_equal assigns(:comments).first, @c2

    get 'index', {:commentable_id => @b3.id, :commentable_type => 'Blog'}
    assert_template 'not_found'

    get 'index', {:commentable_id => @b4.id, :commentable_type => 'Blog'}
    assert_template 'not_found' 
  end

  test "陌生人看所有博客评论" do
    setup_blog_with_comments

    get 'index', {:commentable_id => @b1.id, :commentable_type => 'Blog'}, {:user_id => 4}
    assert_equal assigns(:comments).first, @c1

    get 'index', {:commentable_id => @b2.id, :commentable_type => 'Blog'}
    assert_template 'not_found'

    get 'index', {:commentable_id => @b3.id, :commentable_type => 'Blog'}
    assert_template 'not_found'

    get 'index', {:commentable_id => @b4.id, :commentable_type => 'Blog'}
    assert_template 'not_found' 
  end

protected

  def setup_blog
    @b1 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 1})
    @b2 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 2})
    @b3 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 3})
    @b4 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 4})
  end

  def setup_blog_with_comments
    @b1 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 1})
    @b2 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 2})
    @b3 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 3})
    @b4 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 4})
    @c1 = @b1.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123')
    @c2 = @b2.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123')
    @c3 = @b3.comments.create(:poster_id => 2, :recipient_id => 2, :content => '132')
    @c4 = @b4.comments.create(:poster_id => 2, :recipient_id => 2, :content => '23')
  end

end
