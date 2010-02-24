require 'test_helper'

class User::Avatars::AlbumsControllerTest < ActionController::TestCase

  def setup
    @user = User.find(2)
    @album = @user.avatar_album
    @p1 = save_photo
    @user.update_attribute(:avatar_id, @p1.id)
    @album.update_attribute(:cover_id, @p1.id)
    @p2 = save_photo
    @user.reload
    @album.reload
  end

  # 测试show页面
  test "好友观看" do
    get 'show', {:id => @album.id}, {:user_id => 1}
    
    assert_template 'user/avatars/albums/show'
    assert_equal assigns(:album), @album 
    
    change_avatar_link_not_exist_for @album
    photo_edit_link_not_exist_for @p1
    photo_edit_link_not_exist_for @p2
    photo_delete_link_not_exist_for @p1
    photo_delete_link_not_exist_for @p2
    set_avatar_link_not_exist_for @p1
    set_avatar_link_not_exist_for @p2
  end

  test "本人观看" do
    get 'show', {:id => @album.id}, {:user_id => 2}
    
    assert_template 'user/avatars/albums/show'
    assert_equal assigns(:album), @album

    change_avatar_link_exist_for @album
    photo_edit_link_exist_for @p1
    photo_edit_link_exist_for @p2
    photo_delete_link_not_exist_for @p1
    photo_delete_link_exist_for @p2
    set_avatar_link_not_exist_for @p1
    set_avatar_link_exist_for @p2
  end

  test "非好友玩相同游戏者观看" do
    get 'show', {:id => @album.id}, {:user_id => 3}
    assert_redirected_to new_friend_url(:id => 2)
  end

  test "陌生人观看" do
    get 'show', {:id => @album.id}, {:user_id => 4}
    assert_redirected_to new_friend_url(:id => 2)
  end

protected

  def save_photo opts={}
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    Avatar.create({:album_id => @album.id, :uploaded_data => ActionController::TestUploadedFile.new(path, mimetype)}.merge(opts))
  end

  def change_avatar_link_exist_for album
    assert_tag :tag => 'a', :attributes => {:href => CGI.escapeHTML(new_avatar_url(:album_id => album.id, :album => 1))}
  end

  def change_avatar_link_not_exist_for album
    assert_no_tag :tag => 'a', :attributes => {:href => CGI.escapeHTML(new_avatar_url(:album_id => album.id, :album => 1))}
  end

  def photo_edit_link_exist_for photo
    assert_tag :tag => 'a', :attributes => {:href => edit_avatar_url(photo)}
  end

  def photo_edit_link_not_exist_for photo
    assert_no_tag :tag => 'a', :attributes => {:href => edit_avatar_url(photo)}
  end

  def photo_delete_link_exist_for photo
    assert_tag :tag => 'a', :attributes => {:href => avatar_url(photo), :facebox_type => 'confirm', :rel => 'facebox'}
  end

  def photo_delete_link_not_exist_for photo
    assert_no_tag :tag => 'a', :attributes => {:href => avatar_url(photo), :facebox_type => 'confirm', :rel => 'facebox'}
  end

  def set_avatar_link_exist_for photo
    assert_tag :tag => 'a', :attributes => {:onclick => /#{set_avatar_url(photo)}/}, :content => "设置为头像"
  end

  def set_avatar_link_not_exist_for photo
    assert_no_tag :tag => 'a', :attributes => {:onclick => /#{set_avatar_url(photo)}/}, :content => "设置为头像"
  end

end
