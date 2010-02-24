require 'test_helper'

class User::DigsControllerTest < ActionController::TestCase

  # 挖 博客
  test "本人挖博客" do
    setup_blog

    post 'create', {:dig => {:diggable_type => 'Blog', :diggable_id => @b1.id}}, {:user_id => 2}
    @b1.reload
    assert_nil assigns(:dig).errors.on_base    
    assert_equal @b1.digs_count, 1

    post 'create', {:dig => {:diggable_type => 'Blog', :diggable_id => @b2.id}}
    @b2.reload
    assert_nil assigns(:dig).errors.on_base
    assert_equal @b2.digs_count, 1

    post 'create', {:dig => {:diggable_type => 'Blog', :diggable_id => @b3.id}}
    @b3.reload
    assert_nil assigns(:dig).errors.on_base
    assert_equal @b3.digs_count, 1

    post 'create', {:dig => {:diggable_type => 'Blog', :diggable_id => @b4.id}}
    @b4.reload
    assert_nil assigns(:dig).errors.on_base
    assert_equal @b4.digs_count, 1
  end

  test "好友挖博客" do
    setup_blog

    post 'create', {:dig => {:diggable_type => 'Blog', :diggable_id => @b1.id}}, {:user_id => 1}
    @b1.reload
    assert_nil assigns(:dig).errors.on_base
    assert_equal @b1.digs_count, 1

    post 'create', {:dig => {:diggable_type => 'Blog', :diggable_id => @b2.id}}
    @b2.reload
    assert_nil assigns(:dig).errors.on_base
    assert_equal @b2.digs_count, 1

    post 'create', {:dig => {:diggable_type => 'Blog', :diggable_id => @b3.id}}
    @b3.reload
    assert_nil assigns(:dig).errors.on_base
    assert_equal @b3.digs_count, 1

    post 'create', {:dig => {:diggable_type => 'Blog', :diggable_id => @b4.id}}
    @b4.reload
    assert_not_nil assigns(:dig).errors.on_base
    assert_equal @b4.digs_count, 0
  end

  test "陌生人挖博客" do
    setup_blog

    post 'create', {:dig => {:diggable_type => 'Blog', :diggable_id => @b1.id}}, {:user_id => 4}
    @b1.reload
    assert_nil assigns(:dig).errors.on_base
    assert_equal @b1.digs_count, 1

    post 'create', {:dig => {:diggable_type => 'Blog', :diggable_id => @b2.id}}
    @b2.reload
    assert_nil assigns(:dig).errors.on_base
    assert_equal @b2.digs_count, 1

    post 'create', {:dig => {:diggable_type => 'Blog', :diggable_id => @b3.id}}
    @b3.reload
    assert_nil assigns(:dig).errors.on_base
    assert_equal @b3.digs_count, 1

    post 'create', {:dig => {:diggable_type => 'Blog', :diggable_id => @b4.id}}
    @b4.reload
    assert_not_nil assigns(:dig).errors.on_base
    assert_equal @b4.digs_count, 0
  end

  test "相同游戏挖博客" do
    setup_blog

    post 'create', {:dig => {:diggable_type => 'Blog', :diggable_id => @b1.id}}, {:user_id => 3}
    @b1.reload
    assert_nil assigns(:dig).errors.on_base
    assert_equal @b1.digs_count, 1

    post 'create', {:dig => {:diggable_type => 'Blog', :diggable_id => @b2.id}}
    @b2.reload
    assert_nil assigns(:dig).errors.on_base
    assert_equal @b2.digs_count, 1

    post 'create', {:dig => {:diggable_type => 'Blog', :diggable_id => @b3.id}}
    @b3.reload
    assert_nil assigns(:dig).errors.on_base
    assert_equal @b3.digs_count, 1

    post 'create', {:dig => {:diggable_type => 'Blog', :diggable_id => @b4.id}}
    @b4.reload
    assert_not_nil assigns(:dig).errors.on_base
    assert_equal @b4.digs_count, 0
  end

protected

  def setup_blog
    @b1 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 1})
    @b2 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 2})
    @b3 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 3})
    @b4 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 4})
  end
  
end
