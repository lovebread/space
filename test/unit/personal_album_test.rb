require 'test_helper'
require 'action_controller'
require 'action_controller/test_process.rb'

class PersonalAlbumTest < ActiveSupport::TestCase
  
  fixtures :all

  def setup
    @user = User.find(1)
    @album = @user.albums.build(:game_id => 1, :title => 'album title', :description => 'description', :privilege => 1)  
  end

  # 测试计数器
  test "用户的相册计数器" do
    @album.save
    @user.reload
    assert_equal @user.albums_count, 2
    @album.destroy
    @user.reload
    assert_equal @user.albums_count, 1
  end

  # 测试继承的属性
  test "自动生成的属性" do
    @album.save
    assert_equal @album.poster_id, @album.owner_id
  end

  # 测试validate
  test "没有拥有者" do
    @album.owner_id = nil
    @album.save
    assert_equal @album.errors.on_base, '没有拥有者'
  end

  test "没有游戏" do
    @album.game_id = nil
    @album.save
    assert_equal @album.errors.on_base, '请选择游戏类别'
  end

  test "游戏不存在" do
    @album.game_id = 4
    @album.save
    assert_equal @album.errors.on_base, '游戏不存在'
  end

  test "没有标题" do
    @album.title = nil
    @album.save
    assert_equal @album.errors.on_base, '标题不能为空'
  end

  test "没有权限" do
    @album.privilege = nil
    @album.save
    assert_equal @album.errors.on_base, '没有权限'
  end

  # 测试 recent
  test "recent page" do
    user = User.find(2)
    a1 = user.albums.create(:game_id => 1, :title => 'title', :description => 'desc', :privilege => 1, :created_at => 1.days.ago)
    a2 = user.albums.create(:game_id => 1, :title => 'title', :description => 'desc', :privilege => 2, :created_at => 2.days.ago)
    a3 = user.albums.create(:game_id => 1, :title => 'title', :description => 'desc', :privilege => 3, :created_at => 3.days.ago)
    a4 = user.albums.create(:game_id => 1, :title => 'title', :description => 'desc', :privilege => 4, :created_at => 4.days.ago)
    albums = PersonalAlbum.recent
    assert_equal albums.count, 3
    assert_equal albums[0], a1
    assert_equal albums[1], a2
    assert_equal albums[2], a3
  end

end
