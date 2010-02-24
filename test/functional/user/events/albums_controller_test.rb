require 'test_helper'

class User::Events::AlbumsControllerTest < ActionController::TestCase

  def setup
    @user = User.find(2)
    @event = Event.create({:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => 2, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'description', :created_at => 1.days.ago})
    @album = @event.album
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    @photo = EventPhoto.create({:album_id => @album.id, :poster_id => 2, :uploaded_data => ActionController::TestUploadedFile.new(path, mimetype)})
    @album.reload
    @event.reload
    @user.reload
  end

  # 测试 show 
  test "组织者查看" do
    get 'show', {:id => @album.id}, {:user_id => 2}

    assert_equal assigns(:album), @album
    assert_template 'user/events/albums/show'

    new_photo_link_exist_for @album
    photo_edit_link_exist_for @photo
    photo_delete_link_exist_for @photo
  end

  test "邀请的人查看" do
    Participation.create(:status => 0, :participant_id => 1, :event_id => @event.id)

    get 'show', {:id => @album.id}, {:user_id => 1}

    assert_equal assigns(:album), @album
    assert_template 'user/events/albums/show'
  
    new_photo_link_not_exist_for @album
    photo_edit_link_not_exist_for @photo
    photo_delete_link_not_exist_for @photo
  end

  test "请求加入的人查看" do
    Participation.create(:status => 1, :participant_id => 1, :event_id => @event.id)

    get 'show', {:id => @album.id}, {:user_id => 1}

    assert_equal assigns(:album), @album
    assert_template 'user/events/albums/show'

    new_photo_link_not_exist_for @album
    photo_edit_link_not_exist_for @photo
    photo_delete_link_not_exist_for @photo
  end

  test "参加活动的人查看" do
    Participation.create(:status => 3, :participant_id => 1, :event_id => @event.id)
  
    get 'show', {:id => @album.id}, {:user_id => 1}
  
    assert_equal assigns(:album), @album
    assert_template 'user/events/albums/show'
  
    new_photo_link_exist_for @album
    photo_edit_link_not_exist_for @photo
    photo_delete_link_not_exist_for @photo
  end

  test "没参加的人查看" do
    get 'show', {:id => @album.id}, {:user_id => 1}
  
    assert_equal assigns(:album), @album
    assert_template 'user/events/albums/show'
  
    new_photo_link_not_exist_for @album
    photo_edit_link_not_exist_for @photo
    photo_delete_link_not_exist_for @photo
  end

  # 测试 update
  test "活动组织者更新" do
    put 'update', {:id => @album.id, :album => {:description => '123'}}, {:user_id => 2}
    @album.reload
    assert_equal @album.description, '123'
  end

  test "别人更新" do
    put 'update', {:id => @album.id, :album => {:description => '123'}}, {:user_id => 4}
    assert_template 'not_found'
  end

protected

  def new_photo_link_exist_for album
    assert_tag :tag => 'a', :attributes => {:href => new_event_photo_url(:album_id => album.id)}
  end

  def new_photo_link_not_exist_for album
    assert_no_tag :tag => 'a', :attributes => {:href => new_event_photo_url(:album_id => album.id)}
  end

  def photo_edit_link_exist_for photo
    assert_tag :tag => 'a', :attributes => {:href => edit_event_photo_url(photo)}
  end

  def photo_edit_link_not_exist_for photo
    assert_no_tag :tag => 'a', :attributes => {:href => edit_event_photo_url(photo)}
  end

  def photo_delete_link_exist_for photo
    assert_tag :tag => 'a', :attributes => {:href => event_photo_url(photo), :rel => 'facebox', :facebox_type => 'confirm', :facebox_method => 'delete'}
  end

  def photo_delete_link_not_exist_for photo
    assert_no_tag :tag => 'a', :attributes => {:href => event_photo_url(photo), :rel => 'facebox', :facebox_type => 'confirm', :facebox_method => 'delete'}
  end

end
