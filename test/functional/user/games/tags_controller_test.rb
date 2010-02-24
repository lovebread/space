require 'test_helper'

class User::Games::TagsControllerTest < ActionController::TestCase

  fixtures :all

  def setup
    @game = Game.find(1)
  end
  
  # 测试 create
  test "任何人创建" do
    post 'create', {:game_id => @game.id, :name => '2b'}, {:user_id => 2}
    @game.reload
    tag = Tag.find_by_name('2b')
    assert_not_nil tag
    assert_equal @game.taggings.count, 1
    assert_equal tag.taggings_count, 1

    post 'create', {:game_id => @game.id, :name => 'sb'}
    @game.reload
    tag = Tag.find_by_name('sb')
    assert_nil tag
    assert_equal @game.taggings.count, 1
  end


end
