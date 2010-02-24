require 'test_helper'

class User::AlbumsControllerTest < ActionController::TestCase

  fixtures :all
  
  def setup
    @user = User.find(2)
    @album = @user.avatar_album
    @album1 = @user.albums.create(:game_id => 1, :title => 'title', :created_at => 1.days.ago, :privilege => 1)
    @album2 = @user.albums.create(:game_id => 1, :title => 'title', :created_at => 2.days.ago, :privilege => 2)
    @album3 = @user.albums.create(:game_id => 1, :title => 'title', :created_at => 3.days.ago, :privilege => 3)
    @album4 = @user.albums.create(:game_id => 1, :title => 'title', :created_at => 4.days.ago, :privilege => 4) 
  end

  # 测试index 页面
  test "自己查看" do
    get 'index', {:id => 2}, {:user_id => 2}

    assert_template 'user/albums/index'

    # 按照时间排列，最后一个是头像相册
    albums = assigns(:albums)
    assert_equal albums.count, 5
    assert_equal albums[0], @album1
    assert_equal albums[1], @album2
    assert_equal albums[2], @album3
    assert_equal albums[3], @album4
    assert_equal albums[4], @album
  
    # 可以编辑和删除
    edit_link_exist_for [@album1, @album2, @album3, @album4]
    delete_link_exist_for [@album1, @album2, @album3, @album4]
  end

  test "好友查看" do
    get 'index', {:id => 2}, {:user_id => 1}

    assert_template 'user/albums/index'

    # 按照时间排列，最后一个是头像相册
    albums = assigns(:albums)
    assert_equal albums.count, 4
    assert_equal albums[0], @album1
    assert_equal albums[1], @album2
    assert_equal albums[2], @album3
    assert_equal albums[3], @album
  
    # 不可以编辑和删除
    edit_link_not_exist_for [@album1, @album2, @album3, @album]
    delete_link_not_exist_for [@album1, @album2, @album3, @album] 
  end

  test "不是好友，但玩相同游戏的人查看" do
    get 'index', {:id => 2}, {:user_id => 3}
    redirect_to_new_friend
  end

  test "陌生人查看" do
    get 'index', {:id => 2}, {:user_id => 4}
    redirect_to_new_friend 
  end

  # 测试show页面
  test "好友查看相册" do
    photo = save_photo
    get 'show', {:id => @album1.id}, {:user_id => 1}
    assert_template 'user/albums/show'
    assert_equal assigns(:album), @album1
    edit_link_not_exist_for_photos [photo]
    delete_link_not_exist_for_photos [photo]

    photo = save_photo :album_id => @album2.id
    get 'show', {:id => @album2.id}
    assert_template 'user/albums/show'
    assert_equal assigns(:album), @album2
    edit_link_not_exist_for_photos [photo]
    delete_link_not_exist_for_photos [photo]

    photo = save_photo :album_id => @album3.id
    get 'show', {:id => @album3.id}
    assert_template 'user/albums/show'
    assert_equal assigns(:album), @album3
    edit_link_not_exist_for_photos [photo]
    delete_link_not_exist_for_photos [photo]

    get 'show', {:id => @album4.id}
    assert_not_found
  end

  test "本人查看相册" do
    photo = save_photo
    get 'show', {:id => @album1.id}, {:user_id => 2}
    assert_template 'user/albums/show'
    assert_equal assigns(:album), @album1
    edit_link_exist_for_photos [photo]
    delete_link_exist_for_photos [photo]

    photo = save_photo :album_id => @album2.id
    get 'show', {:id => @album2.id}
    assert_template 'user/albums/show'
    assert_equal assigns(:album), @album2
    edit_link_exist_for_photos [photo]
    delete_link_exist_for_photos [photo]

    photo = save_photo :album_id => @album3.id
    get 'show', {:id => @album3.id}
    assert_template 'user/albums/show'
    assert_equal assigns(:album), @album3
    edit_link_exist_for_photos [photo]
    delete_link_exist_for_photos [photo]

    photo = save_photo :album_id => @album4.id
    get 'show', {:id => @album4.id}
    assert_template 'user/albums/show'
    assert_equal assigns(:album), @album4
    edit_link_exist_for_photos [photo]
    delete_link_exist_for_photos [photo]
  end

  test "不是好友，但玩相同游戏的人查看相册" do
    photo = save_photo
    get 'show', {:id => @album1.id}, {:user_id => 3}
    assert_template 'user/albums/show'
    assert_equal assigns(:album), @album1
    edit_link_not_exist_for_photos [photo]
    delete_link_not_exist_for_photos [photo]

    photo = save_photo :album_id => @album2.id
    get 'show', {:id => @album2.id}
    assert_template 'user/albums/show'
    assert_equal assigns(:album), @album2
    edit_link_not_exist_for_photos [photo]
    delete_link_not_exist_for_photos [photo]

    get 'show', {:id => @album3.id}
    redirect_to_new_friend
    
    get 'show', {:id => @album4.id}
    assert_not_found
  end

  test "陌生人查看相册" do
    photo = save_photo
    get 'show', {:id => @album1.id}, {:user_id => 4}
    assert_template 'user/albums/show'
    assert_equal assigns(:album), @album1
    edit_link_not_exist_for_photos [photo]
    delete_link_not_exist_for_photos [photo]    

    get 'show', {:id => @album2.id}
    redirect_to_new_friend
    
    get 'show', {:id => @album3.id}
    redirect_to_new_friend
    
    get 'show', {:id => @album4.id}
    assert_not_found
  end
  
  # 测试select页面
  test "应该返回所有自己可以select的相册，不包括头像相册" do
    get 'select', {}, {:user_id => 2}
  
    albums = assigns(:albums)
    assert_equal albums.count, 4
    assert_equal albums[0], @album1
    assert_equal albums[1], @album2
    assert_equal albums[2], @album3
    assert_equal albums[3], @album4
  end

  # 测试new
  test "这个真没啥好测试的" do
  end

  # 测试create
  test "创建相册，在相册index页面" do
    # 不写owner_id
    post 'create', {:album => {:game_id => 1, :title => 'title', :created_at => 1.days.ago, :privilege => 1}, :select => 0}, {:user_id => 1}
    assert_equal User.find(1).albums_count, 2

    # 写owner_id
    post 'create', {:album => {:game_id => 1, :title => 't', :owner_id => 2, :created_at => 1.days.ago, :privilege => 1}, :select => 0}
    assert_equal User.find(1).albums_count, 3

    # 错误的参数
    post 'create', {:album => {:title => nil}, :select => 0}
    assert_not_nil assigns(:album).errors.on_base
  end

  test "创建相册，在select页面" do
    post 'create', {:album => {:game_id => 1, :title => 'title', :created_at => 1.days.ago, :privilege => 1}, :select => 1}, {:user_id => 1}
    assert_equal User.find(1).albums_count, 2
  end

  # 测试edit
  test "编辑自己的相册" do
    get 'edit', {:id => @album1.id}, {:user_id => 2}
    assert_template 'user/albums/edit'
    assert_equal assigns(:album), @album1
  end

  test "编辑别人的相册" do
    get 'edit', {:id => @album1.id}, {:user_id => 1}
    assert_not_found
  end

  # 测试update
  test "升级自己的相册，分别用正确和不正确的参数" do
    put 'update', {:id => @album1.id, :album => {:privilege => 3}}, {:user_id => 2}
    assert_equal assigns(:album).privilege, 3
    
    put 'update', {:id => @album1.id, :album => {:game_id => nil, :privilege => 4}}
    assert_equal assigns(:album).errors.on_base, "请选择游戏类别"
  end

  test "升级别人的相册" do
    get 'edit', {:id => @album1.id, :album => {:privilege => 3}}, {:user_id => 1}
    assert_not_found
  end

  # 测试destroy
  test "确认删除自己的相册" do
    get 'confirm_destroy', {:id => @album1.id}, {:user_id => 2}
    assert_template 'user/albums/confirm_destroy'
  end

  test "确认删除别人的相册" do
    get 'confirm_destroy', {:id => @album1.id}, {:user_id => 4}
    assert_not_found
  end  

  test "删除自己的相册" do
    # 连同所有照片一起删除
    p1 = save_photo
    p2 = save_photo
    delete 'destroy', {:id => @album1.id}, {:user_id => 2}
    assert_equal User.find(2).albums_count, 4
    assert_nil PersonalPhoto.find(:first, :conditions => {:id => p1.id})
    assert_nil PersonalPhoto.find(:first, :conditions => {:id => p2.id})

    # 删除前转移照片
    p1 = save_photo :album_id => @album2.id
    p2 = save_photo :album_id => @album2.id
    delete 'destroy', {:id => @album2.id, :migration => 1, :album => {:id => @album3.id}}
    p1.reload
    p2.reload
    @album3.reload
    assert_equal p1.album_id, @album3.id
    assert_equal p2.album_id, @album3.id
    assert_equal @album3.photos_count, 2
  end

  test "删除别人的相册" do
    delete 'destroy', {:id => @album1.id}, {:user_id => 3}
    assert_not_found
  end

  # 测试 friends
  test "测试 friends" do
    @album1.record_upload @user, []
    @album2.record_upload @user, []
    @album4.record_upload @user, [] 

    get 'friends', {}, {:user_id => 1}
    assert_equal assigns(:albums).count, 2 
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

  def edit_link_exist_for albums
    albums.each do |album|
      assert_tag :tag => 'a', :attributes => {:href => edit_personal_album_url(album)}
    end
  end

  def edit_link_not_exist_for albums
    albums.each do |album|
      assert_no_tag :tag => 'a', :attributes => {:href => edit_personal_album_url(album)}
    end
  end

  def delete_link_exist_for albums
    albums.each do |album|
      assert_tag :tag => 'a', :attributes => {:href => confirm_destroy_personal_album_url(album)}
    end
  end

  def delete_link_not_exist_for albums
    albums.each do |album|
      assert_no_tag :tag => 'a', :attributes => {:href => confirm_destroy_personal_album_url(album)}
    end
  end

  def edit_link_exist_for_photos photos
    photos.each do |photo|
      assert_tag :tag => 'a', :attributes => {:href => edit_personal_photo_url(photo)}  
    end
  end

  def edit_link_not_exist_for_photos photos
    photos.each do |photo|
      assert_no_tag :tag => 'a', :attributes => {:href => edit_personal_photo_url(photo)}
    end
  end

  def delete_link_exist_for_photos photos
    photos.each do |photo|
      assert_tag :tag => 'a', :attributes => {:href => personal_photo_url(photo), :facebox_type => 'confirm', :facebox_method => 'delete', :rel => 'facebox'}
    end
  end

  def delete_link_not_exist_for_photos photos
    photos.each do |photo|
      assert_no_tag :tag => 'a', :attributes => {:href => personal_photo_url(photo), :facebox_type => 'confirm', :facebox_method => 'delete', :rel => 'facebox'}
    end
  end

end
