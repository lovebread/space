require 'test_helper'

class User::PhotosControllerTest < ActionController::TestCase

  def setup
    @user = User.find(2)
    @album1 = @user.albums.create(:game_id => 1, :title => 'title', :created_at => 1.days.ago, :privilege => 1)
    @album2 = @user.albums.create(:game_id => 1, :title => 'title', :created_at => 2.days.ago, :privilege => 2)
    @album3 = @user.albums.create(:game_id => 1, :title => 'title', :created_at => 3.days.ago, :privilege => 3)
    @album4 = @user.albums.create(:game_id => 1, :title => 'title', :created_at => 4.days.ago, :privilege => 4)
    @photo1 = save_photo :album_id => @album1.id, :digs_count => 1
    @photo2 = save_photo :album_id => @album2.id, :digs_count => 2
    @photo3 = save_photo :album_id => @album3.id, :digs_count => 3
    @photo4 = save_photo :album_id => @album4.id, :digs_count => 4
  end

  # 测试show
  test "本人看照片" do
    get 'show', {:id => @photo1.id}, {:user_id => 2}
    assert_template 'user/photos/show'
    assert_equal assigns(:photo), @photo1
    dig_link_exist_for @photo1
    share_link_exist_for @photo1
    edit_link_exist_for @photo1
    delete_link_exist_for @photo1
    tag_link_exist_for @photo1
    #in_place_editor_exist_for @photo1

    get 'show', {:id => @photo2.id}
    assert_template 'user/photos/show'
    assert_equal assigns(:photo), @photo2
    dig_link_exist_for @photo2
    share_link_exist_for @photo2
    edit_link_exist_for @photo2
    delete_link_exist_for @photo2
    tag_link_exist_for @photo2
    #in_place_editor_exist_for @photo2

    get 'show', {:id => @photo3.id}
    assert_template 'user/photos/show'
    assert_equal assigns(:photo), @photo3
    dig_link_exist_for @photo3
    share_link_exist_for @photo3
    edit_link_exist_for @photo3
    delete_link_exist_for @photo3
    tag_link_exist_for @photo3
    #in_place_editor_exist_for @photo3

    get 'show', {:id => @photo4.id}
    assert_template 'user/photos/show'
    assert_equal assigns(:photo), @photo4
    dig_link_exist_for @photo4
    share_link_exist_for @photo4
    edit_link_exist_for @photo4
    delete_link_exist_for @photo4
    tag_link_exist_for @photo4
    #in_place_editor_exist_for @photo4
  end

  test "好友看照片" do
    get 'show', {:id => @photo1.id}, {:user_id => 1}
    assert_template 'user/photos/show'
    assert_equal assigns(:photo), @photo1
    dig_link_exist_for @photo1
    share_link_exist_for @photo1
    edit_link_not_exist_for @photo1
    delete_link_not_exist_for @photo1
    tag_link_exist_for @photo1
    #in_place_editor_not_exist_for @photo1

    get 'show', {:id => @photo2.id}
    assert_template 'user/photos/show'
    assert_equal assigns(:photo), @photo2
    dig_link_exist_for @photo2
    share_link_exist_for @photo2
    edit_link_not_exist_for @photo2
    delete_link_not_exist_for @photo2
    tag_link_exist_for @photo2
    #in_place_editor_not_exist_for @photo2

    get 'show', {:id => @photo3.id}
    assert_template 'user/photos/show'
    assert_equal assigns(:photo), @photo3
    dig_link_exist_for @photo3
    share_link_exist_for @photo3
    edit_link_not_exist_for @photo3
    delete_link_not_exist_for @photo3
    tag_link_exist_for @photo3
    #in_place_editor_not_exist_for @photo3

    get 'show', {:id => @photo4.id}
    assert_not_found
  end

  test "不是好友，但玩相同游戏的人看照片" do
    get 'show', {:id => @photo1.id}, {:user_id => 3}
    assert_template 'user/photos/show'
    assert_equal assigns(:photo), @photo1
    dig_link_exist_for @photo1
    share_link_exist_for @photo1
    edit_link_not_exist_for @photo1
    delete_link_not_exist_for @photo1
    tag_link_not_exist_for @photo1
    #in_place_editor_not_exist_for @photo1

    get 'show', {:id => @photo2.id}
    assert_template 'user/photos/show'
    assert_equal assigns(:photo), @photo2
    dig_link_exist_for @photo2
    share_link_exist_for @photo2
    edit_link_not_exist_for @photo2
    delete_link_not_exist_for @photo2
    tag_link_not_exist_for @photo2
    #in_place_editor_not_exist_for @photo2

    get 'show', {:id => @photo3.id}
    redirect_to_new_friend

    get 'show', {:id => @photo4.id}
    assert_not_found 
  end

  test "陌生人看照片" do
    get 'show', {:id => @photo1.id}, {:user_id => 4}
    assert_template 'user/photos/show'
    assert_equal assigns(:photo), @photo1
    dig_link_exist_for @photo1
    share_link_exist_for @photo1
    edit_link_not_exist_for @photo1
    delete_link_not_exist_for @photo1
    tag_link_not_exist_for @photo1
    #in_place_editor_not_exist_for @photo1

    get 'show', {:id => @photo2.id}
    redirect_to_new_friend
    
    get 'show', {:id => @photo3.id}
    redirect_to_new_friend
    
    get 'show', {:id => @photo4.id}
    assert_not_found
  end

  # 测试new
  test "试图上传照片到自己的相册" do
    get 'new', {:album_id => @album1.id}, {:user_id => 2}
    assert_template 'user/photos/new'
  end

  test "试图上传照片到别人的相册" do
    get 'new', {:album_id => @album1.id}, {:user_id => 1}
    assert_not_found
  end

  # 测试create
  test "创建照片到自己的相册" do
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    post 'create', {:album_id => @album1.id, :Filedata => ActionController::TestUploadedFile.new(path, mimetype)}, {:user_id => 2}
    @user.reload
    @album1.reload
    assert_equal @user.photos_count, 5
    assert_equal @album1.photos_count, 2
  end

  test "创建照片到别人的相册" do
    post 'create', {:album_id => @album2.id, :photo => nil}, {:user_id => 1}
    assert_not_found
  end

  # 测试edit
  test "编辑自己的照片" do
    post 'edit', {:id => @photo1.id}, {:user_id => 2}
    assert_template 'user/photos/edit'
    assert_equal assigns(:photo), @photo1
  end

  test "编辑别人的照片" do
    post 'edit', {:id => @photo1.id}, {:user_id => 3}
    assert_not_found
  end
  
  # 测试update
  test "修改描述" do
    put 'update', {:id => @photo1.id, :photo => {:notation => 'desc'}}, {:user_id => 2}
    assert_equal assigns(:photo).notation, 'desc'
  end

  test "设置封面" do
    put 'update', {:id => @photo1.id, :cover => 1}, {:user_id => 2}
    @album1.reload
    assert_equal @album1.cover, @photo1
  end

  test "改变所属专辑" do
    put 'update', {:id => @photo1.id, :photo => {:album_id => @album2.id}}, {:user_id => 2}
    @photo1.reload
    @album2.reload
    @album1.reload
    assert_equal @album1.photos_count, 0
    assert_equal @album2.photos_count, 2
    assert_equal @photo1.album_id, @album2.id
  end

  test "更新别人的照片" do
    put 'update', {:id => @photo1.id}, {:user_id => 4}
    assert_not_found
  end

  # 测试edit_multiple
  test "编辑自己的许多图片" do
    get 'edit_multiple', {:album_id => @album1.id, :ids => [@photo1.id]}, {:user_id => 2}
    assert_template 'user/photos/edit_multiple'
  end

  test "编辑自己的许多照片，其中有些不存在" do
    get 'edit_multiple', {:album_id => @album1.id, :ids => [@photo1.id, @photo2.id]}, {:user_id => 2}
    assert_not_found
  end

  test "编辑别人的许多照片" do
    get 'edit_multiple', {:album_id => @album1.id, :ids => [@photo1.id]}, {:user_id => 4}
    assert_not_found
  end

  # 测试update_multiple
  test "更新自己的许多图片" do
    put 'update_multiple', {:album_id => @album1.id, :photos => {"#{@photo1.id}" => {:notation => 'photo1'}}}, {:user_id => 2}
    @photo1.reload
    assert_equal @photo1.notation, 'photo1'
    assert_redirected_to personal_album_url(@album1)
  end

  test "更新自己的许多图片，其中有些根本不存在" do
    put 'update_multiple', {:album_id => @album1.id, :photos => {"#{@photo2.id}" => {:notation => 'photo1'}}}, {:user_id => 2}
    assert_not_found
  end
  
  test "更新别人的许多图片" do
    put 'update_multiple', {:album_id => @album1.id, :photos => {"#{@photo1.id}" => {:notation => 'photo1'}}}, {:user_id => 4}
    assert_not_found
  end

  # 测试destroy
  test "删除自己的图片" do
    delete 'destroy', {:id => @photo1.id}, {:user_id => 2}
    @user.reload
    assert_equal @user.photos_count, 3
  end

  test "删除的图片是封面" do
    put 'update', {:id => @photo1.id, :cover => 1}, {:user_id => 2}
    delete 'destroy', {:id => @photo1.id}, {:user_id => 2}
    @album1.reload
    assert_nil @album1.cover
  end

  test "删除别人的图片" do
    delete 'destroy', {:id => @photo1.id}, {:user_id => 4}
    assert_not_found
  end

  # 测试 record_upload
  test "保存上传照片的记录" do
    post 'record_upload', {:album_id => @album1.id, :ids => [@photo2.id]}, {:user_id => 2}
    assert_not_found
    post 'record_upload', {:album_id => @album1.id, :ids => [@photo1.id]}
    assert_equal User.find(1).personal_album_feed_items.count, 1
    assert_equal User.find(1).personal_album_feed_items.first.data[:ids], [@photo1.id]
  end

  test "试图保存别人相册的上传记录" do
    post "record_upload", {:album_id => @album2.id}, {:user_id => 4}
    assert_not_found
  end

  # 测试 hot
  test "热门照片" do
    get 'hot', {:id => 2}, {:user_id => 2}
    
    photos = assigns(:photos)
    assert_equal photos.count, 3
    assert_equal photos[0], @photo3
    assert_equal photos[1], @photo2
    assert_equal photos[2], @photo1
  end

protected

  def save_photo opts={}
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    PersonalPhoto.create({:album_id => @album1.id, :uploaded_data => ActionController::TestUploadedFile.new(path, mimetype)}.merge(opts))
  end
    
  def assert_not_found
    assert_template 'not_found'
  end
  
  def redirect_to_new_friend 
    assert_redirected_to new_friend_url(:id => @user.id)
  end

  def dig_link_exist_for photo
    assert_tag :tag => 'a', :content => '挖'
    assert_tag :tag => 'span', :attributes => {:id => "dig_personal_photo_#{photo.id}"}
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
    assert_tag :tag => 'a', :attributes => {:href => edit_personal_photo_url(photo)}
  end

  def edit_link_not_exist_for photo
    assert_no_tag :tag => 'a', :attributes => {:href => edit_personal_photo_url(photo)}
  end

  def delete_link_exist_for photo
    assert_tag :tag => 'a', :attributes => {:href => personal_photo_url(photo), :rel => 'facebox', :facebox_type => 'confirm', :facebox_method => 'delete'}
  end

  def delete_link_not_exist_for photo
    assert_no_tag :tag => 'a', :attributes => {:href => personal_photo_url(photo), :rel => 'facebox', :facebox_type => 'confirm', :facebox_method => 'delete'}
  end

  def in_place_editor_exist_for photo
    assert_tag :tag => 'script', :attributes => {:type => 'text/javascript'}, :content => /[.]*new Ajax.InPlaceEditorWithEmptyText('personal_photo_notation_#{photo.id}'/
  end

  def in_place_editor_not_exist_for photo
    assert_no_tag :tag => 'script', :attributes => {:type => 'text/javascript'}, :content => /[.]*new Ajax.InPlaceEditorWithEmptyText('personal_photo_notation_#{photo.id}'/
  end

end
