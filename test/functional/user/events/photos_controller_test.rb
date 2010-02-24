require 'test_helper'

class User::Events::PhotosControllerTest < ActionController::TestCase

  def setup
    @user = User.find(2)
    @event = Event.create({:game_id => 1, :game_area_id => 1 , :game_server_id => 1, :poster_id => 2, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'description', :created_at => 1.days.ago})
    @album = @event.album
    @p1 = Participation.create(:status => 3, :participant_id => 1, :event_id => @event.id)
    @p2 = Participation.create(:status => 0, :participant_id => 3, :event_id => @event.id)
    @p3 = Participation.create(:status => 1, :participant_id => 4, :event_id => @event.id)
    @photo = save_photo :poster_id => 2
  end

  # 测试 show
  test "活动组织者查看" do
    get 'show', {:id => @photo.id}, {:user_id => 2}
    
    assert_template 'user/events/photos/show'

    photo = assigns(:photo)
    dig_link_exist_for @photo
    tag_link_exist_for @photo
    share_link_exist_for @photo
    edit_link_exist_for @photo
    delete_link_exist_for @photo
    new_photo_link_exist_for @album
  end

  test "活动参与者观看" do
    get 'show', {:id => @photo.id}, {:user_id => 1}

    assert_template 'user/events/photos/show'

    photo = assigns(:photo)
    dig_link_exist_for @photo
    tag_link_exist_for @photo
    share_link_exist_for @photo
    edit_link_not_exist_for @photo
    delete_link_not_exist_for @photo 
    new_photo_link_exist_for @album 
  end

  test "被邀请的人观看" do
    get 'show', {:id => @photo.id}, {:user_id => 3}
  
    assert_template 'user/events/photos/show'
  
    photo = assigns(:photo)
    dig_link_exist_for @photo
    tag_link_not_exist_for @photo
    share_link_exist_for @photo
    edit_link_not_exist_for @photo
    delete_link_not_exist_for @photo
    new_photo_link_not_exist_for @album
  end

  test "请求加入的人观看" do
    get 'show', {:id => @photo.id}, {:user_id => 4}
  
    assert_template 'user/events/photos/show'
  
    photo = assigns(:photo)
    dig_link_exist_for @photo
    tag_link_not_exist_for @photo
    share_link_exist_for @photo
    edit_link_not_exist_for @photo
    delete_link_not_exist_for @photo
    new_photo_link_not_exist_for @album
  end

  test "不参加活动的人观看" do
    # first decline the request
    @p3.destroy
 
    get 'show', {:id => @photo.id}, {:user_id => 4}
  
    assert_template 'user/events/photos/show'
  
    photo = assigns(:photo)
    dig_link_exist_for @photo
    tag_link_not_exist_for @photo
    share_link_exist_for @photo
    edit_link_not_exist_for @photo
    delete_link_not_exist_for @photo
    new_photo_link_not_exist_for @album
  end

  # 测试 new
  test "活动组织者试图上传" do
    get 'new', {:album_id => @album.id}, {:user_id => 2}
    assert_template 'user/events/photos/new'
    assert_equal assigns(:album), @album
  end

  test "活动参与者试图上传" do
    get 'new', {:album_id => @album.id}, {:user_id => 1}
    assert_template 'user/events/photos/new'
    assert_equal assigns(:album), @album
  end

  test "被邀请的人试图上传" do
    get 'new', {:album_id => @album.id}, {:user_id => 3}
    assert_not_found 
  end

  test "请求加入的人试图上传" do
    get 'new', {:album_id => @album.id}, {:user_id => 4}
    assert_not_found
  end

  test "没有参加活动的人试图上传" do
    @p3.destroy
    get 'new', {:album_id => @album.id}, {:user_id => 4}
    assert_not_found
  end

  # 测试 create
  test "活动组织者上传" do
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    post 'create', {:album_id => @album.id, :Filedata => ActionController::TestUploadedFile.new(path, mimetype)}, {:user_id => 2}
    @album.reload
    assert_equal @album.photos_count, 2  
  end

  test "活动参与者上传" do
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    post 'create', {:album_id => @album.id, :Filedata => ActionController::TestUploadedFile.new(path, mimetype)}, {:user_id => 1}
    @album.reload
    assert_equal @album.photos_count, 2
  end

  test "被邀请的人上传" do
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    post 'create', {:album_id => @album.id, :Filedata => ActionController::TestUploadedFile.new(path, mimetype)}, {:user_id => 3}
    assert_not_found
  end

  test "请求加入的人上传" do
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    post 'create', {:album_id => @album.id, :Filedata => ActionController::TestUploadedFile.new(path, mimetype)}, {:user_id => 4}
    assert_not_found
  end

  test "没有参加活动的人上传" do
    @p3.destroy
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    post 'create', {:album_id => @album.id, :Filedata => ActionController::TestUploadedFile.new(path, mimetype)}, {:user_id => 4}
    assert_not_found
  end

  # 测试 record_upload
  test "活动组织者上传记录" do
    post 'record_upload', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 2}
    assert_equal User.find(1).all_album_related_feed_items.count, 1
  end

  test "活动参与者上传记录" do
    post 'record_upload', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 1}
    assert_equal User.find(2).all_album_related_feed_items.count, 1
  end

  test "被邀请的人上传记录" do
    post 'record_upload', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 3}
    assert_not_found
  end

  test "请求加入的人上传记录" do
    post 'record_upload', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 4}
    assert_not_found
  end

  test "没有参加活动的人上传记录" do
    @p3.destroy
    post 'record_upload', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 4}
    assert_not_found
  end

  # 测试 edit_multiple
  test "活动组织者编辑许多" do
    get 'edit_multiple', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 2}
    assert_template 'user/events/photos/edit_multiple'
  end 

  test "参与者编辑许多" do
    get 'edit_multiple', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 1}
    assert_not_found
  end

  test "被邀请的人编辑许多" do
    get 'edit_multiple', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 3}
    assert_not_found
  end

  test "请求加入的人编辑许多" do
    get 'edit_multiple', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 4}
    assert_not_found
  end

  test "没有参加活动的人编辑许多" do
    @p3.destroy
    get 'edit_multiple', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 4}
    assert_not_found
  end

  test "组织者编辑许多，其中有些根本不存在" do
    get 'edit_multiple', {:album_id => @album.id, :ids => [123]}, {:user_id => 2}
    assert_not_found
  end

  # 测试 update_multiple
  test "活动组织者更新许多" do
    put 'update_multiple', {:album_id => @album.id, :photos => {"#{@photo.id}" => {:notation => 'new'}}}, {:user_id => 2}
    @photo.reload
    assert_equal @photo.notation, 'new'  
  end

  test "参与者更新许多" do
    put 'update_multiple', {:album_id => @album.id, :photos => {"#{@photo.id}" => {:notation => 'new'}}}, {:user_id => 1} 
    assert_not_found
  end

  test "被邀请的人更新许多" do
    put 'update_multiple', {:album_id => @album.id, :photos => {"#{@photo.id}" => {:notation => 'new'}}}, {:user_id => 3}
    assert_not_found
  end

  test "请求参加的人更新许多" do
    put 'update_multiple', {:album_id => @album.id, :photos => {"#{@photo.id}" => {:notation => 'new'}}}, {:user_id => 4}
    assert_not_found
  end

  test "没有参加的人更新许多" do
    @p3.destroy
    put 'update_multiple', {:album_id => @album.id, :photos => {"#{@photo.id}" => {:notation => 'new'}}}, {:user_id => 4}
    assert_not_found
  end

  # 编辑 edit
  test "组织者编辑" do
    get 'edit', {:id => @photo.id}, {:user_id => 2}
    assert_template 'user/events/photos/edit'
    assert_equal assigns(:photo), @photo
  end
 
  test "参与者编辑" do
    get 'edit', {:id => @photo.id}, {:user_id => 1}
    assert_not_found
  end

  test "受邀请的人编辑" do
    get 'edit', {:id => @photo.id}, {:user_id => 3}
    assert_not_found
  end

  test "请求加入的人编辑" do
    get 'edit', {:id => @photo.id}, {:user_id => 4}
    assert_not_found
  end
 
  test "没有参加的人编辑" do
    @p3.destroy
    get 'edit', {:id => @photo.id}, {:user_id => 4}
    assert_not_found
  end

  # 测试 update
  test "组织者更新" do
    put 'update', {:id => @photo.id, :photo => {:notation => 'good'}}, {:user_id => 2}
    @photo.reload
    assert_equal @photo.notation, 'good'  
  end

  test "参与者更新" do
    put 'update', {:id => @photo.id, :photo => {:notation => 'good'}}, {:user_id => 1}
    assert_not_found
  end

  test "受邀请的人更新" do
    put 'update', {:id => @photo.id, :photo => {:notation => 'good'}}, {:user_id => 3}
    assert_not_found
  end

  test "请求加入的人更新" do
    put 'update', {:id => @photo.id, :photo => {:notation => 'good'}}, {:user_id => 4}
    assert_not_found
  end

  test "没有参加的人更新" do
    @p3.destroy
    put 'update', {:id => @photo.id, :photo => {:notation => 'good'}}, {:user_id => 4}
    assert_not_found
  end

  test "设置为封面" do
    put 'update', {:id => @photo.id, :cover => 1}, {:user_id => 2}
    @album.reload
    assert_equal @album.cover, @photo 
  end
  
  # 测试 destroy
  test "组织者删除" do
    delete 'destroy', {:id => @photo.id}, {:user_id => 2}
    @album.reload
    assert_equal @album.photos_count, 0
  end

  test "参与者删除" do
    delete 'destroy', {:id => @photo.id}, {:user_id => 1}
    assert_not_found
  end

  test "受邀请的人删除" do
    delete 'destroy', {:id => @photo.id}, {:user_id => 3}
    assert_not_found
  end

  test "请求加入的人删除" do
    delete 'destroy', {:id => @photo.id}, {:user_id => 4}
    assert_not_found
  end

  test "没有参加的人删除" do
    @p3.destroy
    delete 'destroy', {:id => @photo.id}, {:user_id => 4}
    assert_not_found
  end

  test "删除的正好是封面" do
    put 'update', {:id => @photo.id, :cover => 1}, {:user_id => 2}
    delete 'destroy', {:id => @photo.id}
    @album.reload
    assert_nil @album.cover
  end 

protected

  def save_photo opts
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    EventPhoto.create({:album_id => @album.id, :uploaded_data => ActionController::TestUploadedFile.new(path, mimetype)}.merge(opts))
  end
    
  def assert_not_found
    assert_template 'not_found'
  end
    
  def redirect_to_new_friend
    assert_redirected_to new_friend_url(:id => @user.id)
  end

  def dig_link_exist_for photo
    assert_tag :tag => 'a', :content => '挖'
    assert_tag :tag => 'span', :attributes => {:id => "dig_event_photo_#{photo.id}"}
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
    assert_tag :tag => 'a', :attributes => {:href => edit_event_photo_url(photo)}
  end

  def edit_link_not_exist_for photo
    assert_no_tag :tag => 'a', :attributes => {:href => edit_event_photo_url(photo)}
  end

  def delete_link_exist_for photo
    assert_tag :tag => 'a', :attributes => {:href => event_photo_url(photo), :rel => 'facebox', :facebox_type => 'confirm', :facebox_method => 'delete'}
  end

  def delete_link_not_exist_for photo
    assert_no_tag :tag => 'a', :attributes => {:href => event_photo_url(photo), :rel => 'facebox', :facebox_type => 'confirm', :facebox_method => 'delete'}
  end

  def new_photo_link_exist_for album
    assert_tag :tag => 'a', :attributes => {:href => new_event_photo_url(:album_id => album.id)}
  end

  def new_photo_link_not_exist_for album
    assert_no_tag :tag => 'a', :attributes => {:href => new_event_photo_url(:album_id => album.id)}
  end

end
