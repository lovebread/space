require 'test_helper'

class User::FriendTagsControllerTest < ActionController::TestCase

  test "本人删除博客的标记" do
    setup_blog

    delete 'destroy', {:id => @t.id}, {:user_id => 2}
    @b.reload
    assert_equal @b.tags_count, 0
  end

  test "好友删除博客的标记" do
    setup_blog

    delete 'destroy', {:id => @t.id}, {:user_id => 1}
    assert_template 'not_found'    
  end

  test "相同游戏删除博客的标记" do
    setup_blog

    delete 'destroy', {:id => @t.id}, {:user_id => 3}
    assert_template 'not_found'
  end

  test "陌生人删除博客的标记" do
    setup_blog

    delete 'destroy', {:id => @t.id}, {:user_id => 4}
    assert_template 'not_found'
  end

protected

  def setup_blog
    @b = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 1})
    @t = FriendTag.create(:poster_id => 2, :taggable_id => @b.id, :taggable_type => 'Blog', :tagged_user_id => 1)
  end

end
