require 'test_helper'

class User::PhotoTagsControllerTest < ActionController::TestCase

  def setup
    @user1 = User.find(1)
    @user2 = User.find(2)
    @user3 = User.find(3)
    @user4 = User.find(4)
  end 

  # 测试 个人照片
  test "本人创建个人照片的标签" do
    setup_personal_album

    post 'create', {:tag => {:photo_id => @p1.id, :tagged_user_id => 2}, :photo_id => @p1.id}, {:user_id => 2}
    @p1.reload
    assert_equal @p1.tags_count, 1
    assert_nil assigns(:tag).errors.on_base

    post 'create', {:tag => {:photo_id => @p2.id, :tagged_user_id => 2}, :photo_id => @p2.id}
    @p2.reload
    assert_equal @p2.tags_count, 1
    assert_nil assigns(:tag).errors.on_base

    post 'create', {:tag => {:photo_id => @p3.id, :tagged_user_id => 2}, :photo_id => @p3.id}
    @p3.reload
    assert_equal @p3.tags_count, 1
    assert_nil assigns(:tag).errors.on_base

    post 'create', {:tag => {:photo_id => @p4.id, :tagged_user_id => 2}, :photo_id => @p4.id}
    @p4.reload
    assert_equal @p4.tags_count, 1
    assert_nil assigns(:tag).errors.on_base
  end

  test "朋友创建个人照片的标签" do
    setup_personal_album

    post 'create', {:tag => {:photo_id => @p1.id, :tagged_user_id => 2}, :photo_id => @p1.id}, {:user_id => 1}
    @p1.reload
    assert_equal @p1.tags_count, 1
    assert_nil assigns(:tag).errors.on_base

    post 'create', {:tag => {:photo_id => @p2.id, :tagged_user_id => 2}, :photo_id => @p2.id}
    @p2.reload
    assert_equal @p2.tags_count, 1
    assert_nil assigns(:tag).errors.on_base

    post 'create', {:tag => {:photo_id => @p3.id, :tagged_user_id => 2}, :photo_id => @p3.id}
    @p3.reload
    assert_equal @p3.tags_count, 1
    assert_nil assigns(:tag).errors.on_base

    post 'create', {:tag => {:photo_id => @p4.id, :tagged_user_id => 2}, :photo_id => @p4.id}
    @p4.reload
    assert_equal @p4.tags_count, 0
    assert_not_nil assigns(:tag).errors.on_base
  end

  test "相同游戏创建个人照片的标签" do
    setup_personal_album

    post 'create', {:tag => {:photo_id => @p1.id, :tagged_user_id => 2}, :photo_id => @p1.id}, {:user_id => 3}
    @p1.reload
    assert_equal @p1.tags_count, 0
    assert_not_nil assigns(:tag).errors.on_base

    post 'create', {:tag => {:photo_id => @p2.id, :tagged_user_id => 2}, :photo_id => @p2.id}
    @p2.reload
    assert_equal @p2.tags_count, 0
    assert_not_nil assigns(:tag).errors.on_base

    post 'create', {:tag => {:photo_id => @p3.id, :tagged_user_id => 2}, :photo_id => @p3.id}
    @p3.reload
    assert_equal @p3.tags_count, 0
    assert_not_nil assigns(:tag).errors.on_base

    post 'create', {:tag => {:photo_id => @p4.id, :tagged_user_id => 2}, :photo_id => @p4.id}
    @p4.reload
    assert_equal @p4.tags_count, 0
    assert_not_nil assigns(:tag).errors.on_base 
  end

  test "陌生人创建个人照片的标签" do
    setup_personal_album
  
    post 'create', {:tag => {:photo_id => @p1.id, :tagged_user_id => 2}, :photo_id => @p1.id}, {:user_id => 4}
    @p1.reload
    assert_equal @p1.tags_count, 0
    assert_not_nil assigns(:tag).errors.on_base

    post 'create', {:tag => {:photo_id => @p2.id, :tagged_user_id => 2}, :photo_id => @p2.id}
    @p2.reload
    assert_equal @p2.tags_count, 0
    assert_not_nil assigns(:tag).errors.on_base

    post 'create', {:tag => {:photo_id => @p3.id, :tagged_user_id => 2}, :photo_id => @p3.id}
    @p3.reload
    assert_equal @p3.tags_count, 0
    assert_not_nil assigns(:tag).errors.on_base

    post 'create', {:tag => {:photo_id => @p4.id, :tagged_user_id => 2}, :photo_id => @p4.id}
    @p4.reload
    assert_equal @p4.tags_count, 0
    assert_not_nil assigns(:tag).errors.on_base
  end

  test "本人创建个人照片的标签, 但是参说错误" do
    setup_personal_album
  
    post 'create', {:tag => {:photo_id => @p1.id, :tagged_user_id => 4}, :photo_id => @p1.id}, {:user_id => 2}
    @p1.reload
    assert_equal @p1.tags_count, 0
    assert_not_nil assigns(:tag).errors.on_base

    post 'create', {:tag => {:photo_id => @p2.id, :tagged_user_id => 4}, :photo_id => @p2.id}
    @p2.reload
    assert_equal @p2.tags_count, 0
    assert_not_nil assigns(:tag).errors.on_base

    post 'create', {:tag => {:photo_id => @p3.id, :tagged_user_id => 4}, :photo_id => @p3.id}
    @p3.reload
    assert_equal @p3.tags_count, 0
    assert_not_nil assigns(:tag).errors.on_base

    post 'create', {:tag => {:photo_id => @p4.id, :tagged_user_id => 4}, :photo_id => @p4.id}
    @p4.reload
    assert_equal @p4.tags_count, 0
    assert_not_nil assigns(:tag).errors.on_base
  end

  test "本人删除个人照片的标签" do
    setup_personal_album
    
    t = PhotoTag.create(:photo_id => @p1.id, :poster_id => 2, :tagged_user_id => 2)
    delete 'destroy', {:id => t.id}, {:user_id => 2}
    @p1.reload
    assert_equal @p1.tags_count, 0

    t = PhotoTag.create(:photo_id => @p2.id, :poster_id => 2, :tagged_user_id => 2)
    delete 'destroy', {:id => t.id}
    @p2.reload
    assert_equal @p2.tags_count, 0
  
    t = PhotoTag.create(:photo_id => @p3.id, :poster_id => 2, :tagged_user_id => 2)
    delete 'destroy', {:id => t.id}
    @p3.reload
    assert_equal @p3.tags_count, 0

    t = PhotoTag.create(:photo_id => @p4.id, :poster_id => 2, :tagged_user_id => 2)
    delete 'destroy', {:id => t.id}
    @p4.reload
    assert_equal @p4.tags_count, 0
  end

  test "朋友删除个人照片的标签" do
    setup_personal_album

    t = PhotoTag.create(:photo_id => @p1.id, :poster_id => 1, :tagged_user_id => 2)
    delete 'destroy', {:id => t.id}, {:user_id => 1}
    @p1.reload
    assert_equal @p1.tags_count, 1
    assert_template 'not_found'    

    t = PhotoTag.create(:photo_id => @p2.id, :poster_id => 2, :tagged_user_id => 2)
    delete 'destroy', {:id => t.id}
    @p2.reload
    assert_equal @p2.tags_count, 1
    assert_template 'not_found'    

    t = PhotoTag.create(:photo_id => @p3.id, :poster_id => 2, :tagged_user_id => 2)
    delete 'destroy', {:id => t.id}
    @p3.reload
    assert_equal @p3.tags_count, 1
    assert_template 'not_found'    

    t = PhotoTag.create(:photo_id => @p4.id, :poster_id => 2, :tagged_user_id => 2)
    delete 'destroy', {:id => t.id}
    @p4.reload
    assert_equal @p4.tags_count, 1
    assert_template 'not_found'
  end

  test "相同游戏删除个人照片的标签" do
    setup_personal_album

    t = PhotoTag.create(:photo_id => @p1.id, :poster_id => 1, :tagged_user_id => 2)
    delete 'destroy', {:id => t.id}, {:user_id => 3}
    @p1.reload
    assert_equal @p1.tags_count, 1
    assert_template 'not_found'

    t = PhotoTag.create(:photo_id => @p2.id, :poster_id => 2, :tagged_user_id => 2)
    delete 'destroy', {:id => t.id}
    @p2.reload
    assert_equal @p2.tags_count, 1
    assert_template 'not_found'

    t = PhotoTag.create(:photo_id => @p3.id, :poster_id => 2, :tagged_user_id => 2)
    delete 'destroy', {:id => t.id}
    @p3.reload
    assert_equal @p3.tags_count, 1
    assert_template 'not_found'

    t = PhotoTag.create(:photo_id => @p4.id, :poster_id => 2, :tagged_user_id => 2)
    delete 'destroy', {:id => t.id}
    @p4.reload
    assert_equal @p4.tags_count, 1
    assert_template 'not_found'
  end

  test "陌生人删除个人照片的标签" do
    setup_personal_album

    t = PhotoTag.create(:photo_id => @p1.id, :poster_id => 1, :tagged_user_id => 2)
    delete 'destroy', {:id => t.id}, {:user_id => 4}
    @p1.reload
    assert_equal @p1.tags_count, 1
    assert_template 'not_found'

    t = PhotoTag.create(:photo_id => @p2.id, :poster_id => 2, :tagged_user_id => 2)
    delete 'destroy', {:id => t.id}
    @p2.reload
    assert_equal @p2.tags_count, 1
    assert_template 'not_found'

    t = PhotoTag.create(:photo_id => @p3.id, :poster_id => 2, :tagged_user_id => 2)
    delete 'destroy', {:id => t.id}
    @p3.reload
    assert_equal @p3.tags_count, 1
    assert_template 'not_found'

    t = PhotoTag.create(:photo_id => @p4.id, :poster_id => 2, :tagged_user_id => 2)
    delete 'destroy', {:id => t.id}
    @p4.reload
    assert_equal @p4.tags_count, 1
    assert_template 'not_found'
  end

protected

  def setup_personal_album
    @a1 = PersonalAlbum.create(:owner_id => 2, :game_id => 1, :title => 'album title', :description => 'description', :privilege => 1)
    @a2 = PersonalAlbum.create(:owner_id => 2, :game_id => 1, :title => 'album title', :description => 'description', :privilege => 2)
    @a3 = PersonalAlbum.create(:owner_id => 2, :game_id => 1, :title => 'album title', :description => 'description', :privilege => 3)
    @a4 = PersonalAlbum.create(:owner_id => 2, :game_id => 1, :title => 'album title', :description => 'description', :privilege => 4)
    @p1 = save_photo 'PersonalPhoto', :album_id => @a1.id
    @p2 = save_photo 'PersonalPhoto', :album_id => @a2.id
    @p3 = save_photo 'PersonalPhoto', :album_id => @a3.id
    @p4 = save_photo 'PersonalPhoto', :album_id => @a4.id
  end

  def setup_avatar_album
    @a = @user2.avatar_album
    @p = save_photo 'Avatar', :album_id => @a.id
  end

  def setup_event
    @e = Event.create({:game_id => 1, :game_area_id => 1, :game_server_id => 1, :poster_id => 2, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'event description'})
    @a = @e.album
    @p = save_photo 'EventPhoto', :album_id => @a.id, :poster_id => 2
  end

  def setup_guild
    @g = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => 2})
    @a = @g.album
    @p = save_photo 'GuildPhoto', :album_id => @a.id, :poster_id => 2
  end

  def save_photo photo_type, opts={}
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    photo_type.constantize.create({:uploaded_data => ActionController::TestUploadedFile.new(path, mimetype)}.merge(opts))
  end

end
