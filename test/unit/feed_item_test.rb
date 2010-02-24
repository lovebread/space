require 'test_helper'

class FeedItemTest < ActiveSupport::TestCase

  test "没有产生者" do
    f = FeedItem.create(:originator_id => nil, :originator_type => 'Blog')
    assert_equal f.errors.on_base, "没有产生者"
  
    f = FeedItem.create(:originator_id => 1, :originator_type => nil)
    assert_equal f.errors.on_base, "没有产生者"
  end

end
