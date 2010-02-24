require 'test_helper'

class AvatarAlbumTest < ActiveSupport::TestCase
  
  fixtures :all

  test "创建新用户，会同时创建头像相册" do
    user = User.new
    user.login = '高下红'
    user.password = '111111'
    user.password_confirmation = '111111'
    user.email = 'gaoxh05@gmail.com'
    user.gender = 'male'
    user.save(false)
    user.activate
    user.reload
    assert_not_nil user.avatar_album
    assert_equal user.avatar_album.poster_id, user.id
    assert_equal user.avatar_album.game_id, nil
    assert_equal user.avatar_album.privilege, 2
    assert_equal user.albums_count, 1
    assert_equal user.photos_count, 0
  end

end
