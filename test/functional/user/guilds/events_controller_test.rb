require 'test_helper'

class User::Guilds::EventsControllerTest < ActionController::TestCase
  
  # 测试 index
  test "the truth" do
    @user = User.find(2)
    @guild = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => @user.id})
    @album = @guild.album
    get 'index', {:guild_id => @guild.id}, {:user_id => @user.id}
    assert_template 'user/guilds/events/index'
  end

end
