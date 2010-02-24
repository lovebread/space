require 'test_helper'
require 'action_controller'
require 'action_controller/test_process.rb'

class EventAlbumTest < ActiveSupport::TestCase
  
  fixtures :all

  def setup
    @user = User.find(1)
    @event = Event.create({:game_id => 1, :game_area_id => 1, :game_server_id => 1, :poster_id => @user.id, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'event description'}) 
    @album = @event.album
  end

  test "创建活动，同时会创建相册" do
    assert_not_nil @album
    assert_equal @album.game_id, @event.game_id
    assert_equal @album.privilege, 1
    assert_equal @album.poster_id, @event.poster_id
    assert_equal @album.title, "活动'#{@event.title}'的相册"
  end

  test "没有活动" do
    @album.update_attributes(:owner_id => nil)
    assert_equal @album.errors.on_base, '没有活动' 
  end 

end
