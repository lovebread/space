require 'test_helper'

class User::Avatars::PhotosControllerTest < ActionController::TestCase

  def setup 
    @user = User.find(2)
    @album = @user.avatar_album
    @photo1 = save_photo
    @photo2 = save_photo
    @album.set_cover @photo2
    @album.reload
    @user.reload
  end

  # 测试 show
  test "好友看" do
    get 'show', {:id => @photo1.id}, {:user_id => 1}
    assert_template 'user/avatars/photos/show'
    assert_equal assigns(:photo), @photo1
    dig_link_exist_for @photo1
    share_link_exist_for @photo1
    edit_link_not_exist_for @photo1
    delete_link_not_exist_for @photo1
    tag_link_exist_for @photo1
    set_link_not_exist_for @photo1

    get 'show', {:id => @photo2.id}, {:user_id => 1}
    assert_template 'user/avatars/photos/show'
    assert_equal assigns(:photo), @photo2
    dig_link_exist_for @photo2
    share_link_exist_for @photo2
    edit_link_not_exist_for @photo2
    delete_link_not_exist_for @photo2
    tag_link_exist_for @photo2
    set_link_not_exist_for @photo2
  end

  test "本人看" do
    get 'show', {:id => @photo1.id}, {:user_id => 2}
    assert_template 'user/avatars/photos/show'
    assert_equal assigns(:photo), @photo1
    dig_link_exist_for @photo1
    share_link_exist_for @photo1
    edit_link_exist_for @photo1
    delete_link_exist_for @photo1
    tag_link_exist_for @photo1
    set_link_exist_for @photo1

    get 'show', {:id => @photo2.id}, {:user_id => 2}
    assert_template 'user/avatars/photos/show'
    assert_equal assigns(:photo), @photo2
    dig_link_exist_for @photo2
    share_link_exist_for @photo2
    edit_link_exist_for @photo2
    delete_link_not_exist_for @photo2
    tag_link_exist_for @photo2
    set_link_not_exist_for @photo2
  end

  test "非好友但有相同游戏" do
    get 'show', {:id => @photo1.id}, {:user_id => 3}
    redirect_to_new_friend
 
    get 'show', {:id => @photo2.id}, {:user_id => 3}
    redirect_to_new_friend 
  end

  test "陌生人" do
    get 'show', {:id => @photo1.id}, {:user_id => 4}
    redirect_to_new_friend    

    get 'show', {:id => @photo2.id}, {:user_id => 1}
    redirect_to_new_friend
  end

  # 测试 new 
  test "试图创建自己的头像" do
    get 'new', {:album_id => @album.id}, {:user_id => 2}
    assert_template 'user/avatars/photos/new'
    assert_equal assigns(:album), @album
  end

  test "试图创建别人的头像" do
    get 'new', {:album_id => @album.id}, {:user_id => 4}
    assert_template 'user/avatars/photos/new'
    assert_not_equal assigns(:album), @album
  end

  # 创建头像 create/set
  test "创建自己的头像" do
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    post 'create', {:album_id => @album.id, :photo => {:uploaded_data => ActionController::TestUploadedFile.new(path, mimetype)}}, {:user_id => 2}
    @album.reload
    @user.reload
    avatar = assigns(:photo)
    assert_equal @album.photos_count, 3
    assert_equal @user.photos_count, 3
  end

  test "用户无法创建别人的头像" do
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    post 'create', {:album_id => @album.id, :photo => {:uploaded_data => ActionController::TestUploadedFile.new(path, mimetype)}}, {:user_id => 4}
    avatar = assigns(:photo)
    @user.reload
    assert_equal @user.avatar_id, @photo2.id
    assert_nil User.find(4).avatar_id
  end

  test "设置别的图片为头像" do
    p = save_photo
    put 'set', {:id => p.id}, {:user_id => 2}
    @user.reload
    @album.reload
    assert_equal @user.avatar, p
    assert_equal @album.cover, p
  end

  # 测试edit
  test "编辑头像" do
    get 'edit', {:id => @photo1.id}, {:user_id => 2}
    assert_template 'user/avatars/photos/edit'
  end

  test "试图编辑其他人的头像" do
    get 'edit', {:id => @photo1.id}, {:user_id => 4}
    assert_not_found
  end

  # 测试update
  test "更新自己的头像图片信息" do
    put 'update', {:id => @photo1.id, :photo => {:notation => 'photo1'}}, {:user_id => 2}
    @photo1.reload
    assert_equal @photo1.notation, 'photo1'
  end

  test "试图更新其他人的头像图片信息" do
    put 'update', {:id => @photo1.id, :photo => {:notation => 'photo1'}}, {:user_id => 4}
    assert_not_found
  end

  # 删除头像
  test "删除自己的头像" do
    puts '删除自己的头像'
    p = save_photo
    put 'set', {:id => p.id}, {:user_id => 2}
    delete 'destroy', {:id => @photo1.id}, {:user_id => 2}
    @album.reload
    @user.reload
    assert_equal @album.photos_count, 2
    assert_equal @album.cover, p
    assert_equal @user.avatar_id, p.id 
  end

  test "试图删除别人的头像" do
    puts '试图删除别人的头像'
    delete 'destroy', {:id => @photo1.id}, {:user_id => 4}
    assert_not_found
  end

  test "删除的头像是当前的头像" do
    delete 'destroy', {:id => @photo2.id}, {:user_id => 2}
    @user.reload
    @album.reload

    assert_equal @user.avatar, @photo2 
    assert_equal @album.cover, @photo2
  end

protected
  
  def save_photo opts={}
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    Avatar.create({:album_id => @album.id, :uploaded_data => ActionController::TestUploadedFile.new(path, mimetype)}.merge(opts))
  end
    
  def assert_not_found
    assert_template 'not_found'
  end
    
  def redirect_to_new_friend
    assert_redirected_to new_friend_url(:id => @user.id)
  end
  
  def dig_link_exist_for photo
    assert_tag :tag => 'a', :content => '挖'
    assert_tag :tag => 'span', :attributes => {:id => "dig_avatar_#{photo.id}"}
  end

  def tag_link_exist_for photo
    assert_tag :tag => 'a', :attributes => {:href => '#', :onclick => /[.]*tagger.start()[.]*/}
  end

  def tag_link_not_exist_for photo
    assert_no_tag :tag => 'a', :attributes => {:href => '#', :onclick => /[.]*tagger.start();[.]*/}
  end

  def share_link_exist_for photo
    assert_tag :tag => 'a', :attributes => {:href => CGI.escapeHTML(new_sharing_url(:shareable_type => 'Photo', :shareable_id => photo.id))}
  end

  def edit_link_exist_for photo
    assert_tag :tag => 'a', :attributes => {:href => edit_avatar_url(photo)}
  end

  def edit_link_not_exist_for photo
    assert_no_tag :tag => 'a', :attributes => {:href => edit_avatar_url(photo)}
  end

  def delete_link_exist_for photo
    assert_tag :tag => 'a', :attributes => {:href => avatar_url(photo), :rel => 'facebox', :facebox_type => 'confirm', :facebox_method => 'delete'}
  end

  def delete_link_not_exist_for photo
    assert_no_tag :tag => 'a', :attributes => {:href => avatar_url(photo), :rel => 'facebox', :facebox_type => 'confirm', :facebox_method => 'delete'}
  end

  def set_link_exist_for photo
    assert_tag :tag => 'a', :attributes => {:onclick => /#{set_avatar_url(photo)}/}
  end

  def set_link_not_exist_for photo
    assert_no_tag :tag => 'a', :attributes => {:onclick => /#{set_avatar_url(photo)}/ }
  end

end
