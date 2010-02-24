require 'test_helper'

class TagTest < ActiveSupport::TestCase

  test "没有名字" do
    t = Tag.create(:name => nil)
    assert_equal t.errors.on_base, "没有名字"
  end

  test "没有类型" do
    t = Tag.create(:name => '123', :taggable_type => nil)
    assert_equal t.errors.on_base, "没有类型"
  end

  test "名字已经有了" do
    t = Tag.create(:name => '123', :taggable_type => 'Game')
    t = Tag.create(:name => '123', :taggable_type => 'Game')
    assert_equal t.errors.on_base, "名字已经有了"
  end

end
