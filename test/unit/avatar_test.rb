require 'test_helper'
require 'action_controller'
require 'action_controller/test_process.rb'

class AvatarTest < ActiveSupport::TestCase
  
  fixtures :all

  def setup
    @user = User.find(1)
    @album = @user.avatar_album
  end

  # 照片计数器
  test "相册的照片计数器，用户的照片计数器" do
    @photo1 = save_photo 'public/images/default_guild.jpg'
    @album.reload
    @user.reload
    assert_equal @album.photos_count, 1
    assert_equal @user.photos_count, 1
    @photo2 = save_photo 'public/images/castle.jpg'
    @album.reload
    @user.reload
    assert_equal @album.photos_count, 2
    assert_equal @user.photos_count, 2
    @photo1.destroy
    @album.reload
    @user.reload
    assert_equal @album.photos_count, 1
    assert_equal @user.photos_count, 1
    @photo2.destroy
    @album.reload
    @user.reload
    assert_equal @album.photos_count, 0
    assert_equal @user.photos_count, 0
  end

  # 测试属性继承
  test "头像会继承一些属性" do
    @photo = save_photo 'public/images/castle.jpg'
    assert_nil @photo.game_id
    assert_equal @photo.poster_id, @album.poster_id
    assert_equal @photo.privilege, @album.privilege
  end

  # 头像
  test "删除当前头像" do
    @photo = save_photo 'public/images/castle.jpg'
    @album.set_cover @photo
    @photo.destroy
    @album.reload
    @photo.reload
    assert_not_nil @photo     # 无法删除 
  end

  test "设置另一个头像为当前头像" do
    @photo = save_photo 'public/images/castle.jpg' 
    @album.set_cover @photo

    @album.reload
    @user.reload
    assert_equal @album.cover_id, @photo.id
    assert_equal @user.avatar_id, @photo.id
  end

  # 测试validate
  test "没有相册" do
    path = 'public/images/castle.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    @photo = Avatar.create(:uploaded_data => ActionController::TestUploadedFile.new(path, mimetype))
    assert_equal @photo.errors.on_base, '没有相册'
  end 

protected

  def save_photo path
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    Avatar.create(:album_id => @album.id, :uploaded_data => ActionController::TestUploadedFile.new(path, mimetype))
  end
  
end
