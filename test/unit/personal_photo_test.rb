require 'test_helper'
require 'action_controller'
require 'action_controller/test_process.rb'

class PersonalPhotoTest < ActiveSupport::TestCase

  fixtures :all

  def setup
    @user = User.find(2)
    @album1 = PersonalAlbum.create(:owner_id => 2, :game_id => 1, :title => 'title', :description => 'description', :privilege => 1)
    @album2 = PersonalAlbum.create(:owner_id => 2, :game_id => 1, :title => 'title', :description => 'description', :privilege => 2)
    @album3 = PersonalAlbum.create(:owner_id => 2, :game_id => 1, :title => 'title', :description => 'description', :privilege => 3)
    @album4 = PersonalAlbum.create(:owner_id => 2, :game_id => 1, :title => 'title', :description => 'description', :privilege => 4)
  end

  # 测试计数器 
  test "相册的照片计数器" do
    @photo1 = save_photo
    @album1.reload
    @user.reload
    assert_equal @album1.photos_count, 1
    assert_equal @user.photos_count, 1
    @photo2 = save_photo
    @album1.reload
    @user.reload
    assert_equal @album1.photos_count, 2
    assert_equal @user.photos_count, 2
    @photo1.destroy
    @album1.reload
    @user.reload
    assert_equal @album1.photos_count, 1
    assert_equal @user.photos_count, 1
    @photo2.destroy
    @album1.reload
    @user.reload
    assert_equal @album1.photos_count, 0
    assert_equal @user.photos_count, 0
  end

  # 测试自动赋值
  test "相片会继承相册的一些属性" do
    @photo = save_photo
    assert_equal @photo.privilege, @album1.privilege
    assert_equal @photo.poster_id, @album1.poster_id
    assert_equal @photo.game_id, @album1.game_id
  end

  # 封面
  test "设置新封面" do
    @cover = save_photo
    @album1.update_attributes(:cover_id => @cover.id)
    assert_equal @album1.cover, @cover
  end

  test "删除当前的封面" do
    @cover = save_photo
    @album1.update_attributes(:cover_id => @cover.id)
    @cover.reload and @cover.destroy # @cover.reload clear association cache: photo.album
    @album1.reload
    assert_nil @album1.cover_id
  end

  # 测试validate 
  test "没有相册" do
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    @photo = PersonalPhoto.create(:uploaded_data => ActionController::TestUploadedFile.new(path, mimetype))
    assert_equal @photo.errors.on_base, '没有相册'
  end

  # 测试 hot和 friend feeds
  test "hot page" do
    p1 = save_photo :album_id => @album1.id, :digs_count => 1
    p2 = save_photo :album_id => @album2.id, :digs_count => 2
    p3 = save_photo :album_id => @album3.id, :digs_count => 3
    p4 = save_photo :album_id => @album4.id, :digs_count => 4
    photos = Photo.hot
    assert_equal photos.count, 3
    assert_equal photos[0], p3
    assert_equal photos[1], p2
    assert_equal photos[2], p1
  end

  test "friend feeds" do
    @album1.record_upload @user, []
    @album2.record_upload @user, []
    @album3.record_upload @user, []
    @album4.record_upload @user, []
    albums = User.find(1).personal_album_feed_items.map(&:originator).uniq
    assert_equal albums.count, 3
    albums = User.find(4).personal_album_feed_items.map(&:originator).uniq
    assert_equal albums.count, 0
  end

protected

  # 默认是保存在album1里面    
  def save_photo opts={}
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    PersonalPhoto.create({:album_id => @album1.id, :uploaded_data => ActionController::TestUploadedFile.new(path, mimetype)}.merge(opts))
  end

end
