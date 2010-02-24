require 'test_helper'
require 'action_controller'
require 'action_controller/test_process.rb'

class GuildAlbumTest < ActiveSupport::TestCase
  
  fixtures :all

  def setup
    @user = User.find(1)
    @guild = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => @user.id})
    @album = @guild.album
  end

  test "创建工会，同时会创建相册" do
    assert_not_nil @album
    assert_equal @album.game_id, @guild.game_id
    assert_equal @album.privilege, 1
    assert_equal @album.poster_id, @guild.president_id
    assert_equal @album.title, "工会'#{@guild.name}'的相册"
  end

  test "没有工会" do
    @album.update_attributes(:owner_id => nil)
    assert_equal @album.errors.on_base, '没有工会' 
  end 

end
