require 'test_helper'

class User::Guilds::PhotosControllerTest < ActionController::TestCase
  
  def setup
    @user = User.find(2)
    @guild = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => 2})
    @album = @guild.album
    @m1 = Membership.create(:status => 0, :user_id => 1, :guild_id => @guild.id)
    @m2 = Membership.create(:status => 1, :user_id => 3, :guild_id => @guild.id)
    @m3 = Membership.create(:status => 4, :user_id => 4, :guild_id => @guild.id)
    @m4 = Membership.create(:status => 5, :user_id => 5, :guild_id => @guild.id)
    @photo = save_photo :poster_id => 2
  end

  # 测试show页面
  test "会长查看" do
    get 'show', {:id => @photo.id}, {:user_id => 2}
   
    assert_equal assigns(:photo), @photo
  
    dig_link_exist_for @photo
    tag_link_exist_for @photo
    share_link_exist_for @photo
    edit_link_exist_for @photo
    delete_link_exist_for @photo
    new_photo_link_exist_for @album
  end

  test "长老查看" do
    get 'show', {:id => @photo.id}, {:user_id => 4}

    assert_equal assigns(:photo), @photo

    dig_link_exist_for @photo
    tag_link_exist_for @photo
    share_link_exist_for @photo
    edit_link_not_exist_for @photo
    delete_link_not_exist_for @photo
    new_photo_link_exist_for @album
  end

  test "会员查看" do
    get 'show', {:id => @photo.id}, {:user_id => 5}
  
    assert_equal assigns(:photo), @photo
  
    dig_link_exist_for @photo
    tag_link_exist_for @photo
    share_link_exist_for @photo
    edit_link_not_exist_for @photo
    delete_link_not_exist_for @photo
    new_photo_link_not_exist_for @album
  end

  test "被邀请的人看" do
    get 'show', {:id => @photo.id}, {:user_id => 1}

    assert_equal assigns(:photo), @photo

    dig_link_exist_for @photo
    tag_link_not_exist_for @photo
    share_link_exist_for @photo
    edit_link_not_exist_for @photo
    delete_link_not_exist_for @photo
    new_photo_link_not_exist_for @album  
  end

  test "请求的人看" do
    get 'show', {:id => @photo.id}, {:user_id => 3}

    assert_equal assigns(:photo), @photo

    dig_link_exist_for @photo
    tag_link_not_exist_for @photo
    share_link_exist_for @photo
    edit_link_not_exist_for @photo
    delete_link_not_exist_for @photo
    new_photo_link_not_exist_for @album
  end

  test "非会员查看" do
    @m4.destroy

    get 'show', {:id => @photo.id}, {:user_id => 5}

    assert_equal assigns(:photo), @photo

    dig_link_exist_for @photo
    tag_link_not_exist_for @photo
    share_link_exist_for @photo
    edit_link_not_exist_for @photo
    delete_link_not_exist_for @photo
    new_photo_link_not_exist_for @album 
  end

  # 测试new
  test "会长试图上传" do
    get 'new', {:album_id => @album.id}, {:user_id => 2}
    assert_equal assigns(:album), @album
    assert_template 'user/guilds/photos/new'
  end

  test "长老试图上传" do
    get 'new', {:album_id => @album.id}, {:user_id => 4}
    assert_equal assigns(:album), @album
    assert_template 'user/guilds/photos/new'
  end

  test "会员试图上传" do
    get 'new', {:album_id => @album.id}, {:user_id => 5}
    assert_not_found
  end

  test "被邀请的人试图上传" do
    get 'new', {:album_id => @album.id}, {:user_id => 1}
    assert_not_found
  end

  test "请求的人试图上传" do
    get 'new', {:album_id => @album.id}, {:user_id => 3}
    assert_not_found
  end

  test "非会员试图上传" do
    @m3.destroy
    get 'new', {:album_id => @album.id}, {:user_id => 4}
    assert_not_found
  end

  # 测试 create
  test "会长上传" do
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    post 'create', {:album_id => @album.id, :Filedata => ActionController::TestUploadedFile.new(path, mimetype)}, {:user_id => 2}
    @album.reload
    assert_equal @album.photos_count, 2    
  end

  test "长老上传" do
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    post 'create', {:album_id => @album.id, :Filedata => ActionController::TestUploadedFile.new(path, mimetype)}, {:user_id => 4}
    @album.reload
    assert_equal @album.photos_count, 2
  end

  test "会员上传" do
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    post 'create', {:album_id => @album.id, :Filedata => ActionController::TestUploadedFile.new(path, mimetype)}, {:user_id => 5}
    assert_not_found
  end

  test "被邀请的人上传" do
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    post 'create', {:album_id => @album.id, :Filedata => ActionController::TestUploadedFile.new(path, mimetype)}, {:user_id => 1}
    assert_not_found
  end

  test "请求的人上传" do
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    post 'create', {:album_id => @album.id, :Filedata => ActionController::TestUploadedFile.new(path, mimetype)}, {:user_id => 3}
    assert_not_found
  end

  test "非会员上传" do
    @m3.destroy
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    post 'create', {:album_id => @album.id, :Filedata => ActionController::TestUploadedFile.new(path, mimetype)}, {:user_id => 4}
    assert_not_found
  end
  
  # 测试 record_upload
  test "会长上传记录" do
    post 'record_upload', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 2}
    # 工会成员收到
    assert_equal User.find(4).all_album_related_feed_items.count, 1
    assert_equal User.find(5).all_album_related_feed_items.count, 1
  end

  test "长老上传记录" do
    post 'record_upload', {:album_id => @album.id, :ids => []}, {:user_id => 4}
  end

  test "会员上传记录" do
    post 'record_upload', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 5}
    assert_not_found
  end

  test "被邀请的人上传记录" do
    post 'record_upload', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 1}
    assert_not_found
  end

  test "请求的人上传记录" do
    post 'record_upload', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 3}
    assert_not_found
  end

  test "非会员上传记录" do
    @m3.destroy
    post 'record_upload', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 4}
    assert_not_found
  end

  test "会长上传记录，其中有些照片不存在" do
    post 'record_upload', {:album_id => @album.id, :ids => [@photo.id, 999]}, {:user_id => 2}
    assert_not_found
  end

  # 测试 edit_multiple
  test "会长编辑许多" do
    get 'edit_multiple', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 2}
    assert_equal assigns(:photos), [@photo]
    assert_template 'user/guilds/photos/edit_multiple'
  end

  test "长老编辑许多" do
    get 'edit_multiple', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 4}
    assert_not_found
  end

  test "会员编辑许多" do
    get 'edit_multiple', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 5}
    assert_not_found
  end

  test "被邀请的人编辑许多" do
    get 'edit_multiple', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 1}
    assert_not_found
  end

  test "请求的人编辑许多" do
    get 'edit_multiple', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 3}
    assert_not_found
  end

  test "非会员编辑许多" do
    @m3.destroy
    get 'edit_multiple', {:album_id => @album.id, :ids => [@photo.id]}, {:user_id => 4}
    assert_not_found
  end

  test "会长编辑许多，而且其中有些不存在" do
    get 'edit_multiple', {:album_id => @album.id, :ids => [@photo.id, 888]}, {:user_id => 2}
    assert_not_found
  end

  # 测试 update_multiple
  test "会长更新许多" do
    put 'update_multiple', {:album_id => @album.id, :photos => {"#{@photo.id}" => {:notation => 'new notation'}}}, {:user_id => 2}
    @photo.reload
    assert_equal @photo.notation, 'new notation'
  end

  test "长老更新许多" do
    put 'update_multiple', {:album_id => @album.id, :photos => {"#{@photo.id}" => {:notation => 'new notation'}}}, {:user_id => 4}
    assert_not_found
  end

  test "会员更新许多" do
    put 'update_multiple', {:album_id => @album.id, :photos => {"#{@photo.id}" => {:notation => 'new notation'}}}, {:user_id => 5}
    assert_not_found
  end

  test "被邀请的人更新许多" do
    put 'update_multiple', {:album_id => @album.id, :photos => {"#{@photo.id}" => {:notation => 'new notation'}}}, {:user_id => 1}
    assert_not_found
  end

  test "请求的人更新许多" do
    put 'update_multiple', {:album_id => @album.id, :photos => {"#{@photo.id}" => {:notation => 'new notation'}}}, {:user_id => 3}
    assert_not_found
  end

  test "非会员更新许多" do
    @m3.destroy
    put 'update_multiple', {:album_id => @album.id, :photos => {"#{@photo.id}" => {:notation => 'new notation'}}}, {:user_id => 4}
    assert_not_found
  end

  test "会长更新许多，而且其中有些不存在" do
    put 'update_multiple', {:album_id => @album.id, :photos => {"#{@photo.id}" => {:notation => 'new notation'}, "123" => {}}}, {:user_id => 2}
    assert_not_found
  end

  # 测试 edit
  test "会长编辑" do
    get 'edit', {:id => @photo.id}, {:user_id => 2}
    assert_equal assigns(:photo), @photo
  end

  test "长老编辑" do
    get 'edit', {:id => @photo.id}, {:user_id => 4}
    assert_not_found
  end

  test "会员编辑" do
    get 'edit', {:id => @photo.id}, {:user_id => 5}
    assert_not_found
  end

  test "被邀请的人编辑" do
    get 'edit', {:id => @photo.id}, {:user_id => 1}
    assert_not_found
  end

  test "请求的人编辑" do
    get 'edit', {:id => @photo.id}, {:user_id => 3}
    assert_not_found
  end

  test "非会员编辑" do
    @m3.destroy
    get 'edit', {:id => @photo.id}, {:user_id => 4}
    assert_not_found
  end

  # 测试 update
  test "会长更新" do
    put 'update', {:id => @photo.id, :photo => {:notation => '123'}}, {:user_id => 2}
    @photo.reload
    assert_equal @photo.notation, '123'
  end

  test "长老更新" do
    put 'update', {:id => @photo.id, :photo => {:notation => '123'}}, {:user_id => 4}
    assert_not_found
  end

  test "会员更新" do
    put 'update', {:id => @photo.id, :photo => {:notation => '123'}}, {:user_id => 5}
    assert_not_found
  end

  test "被邀请的人更新" do
    put 'update', {:id => @photo.id, :photo => {:notation => '123'}}, {:user_id => 1}
    assert_not_found
  end

  test "请求的人更新" do
    put 'update', {:id => @photo.id, :photo => {:notation => '123'}}, {:user_id => 3}
    assert_not_found
  end

  test "非会员更新" do
    @m3.destroy
    put 'update', {:id => @photo.id, :photo => {:notation => '123'}}, {:user_id => 4}
    assert_not_found
  end

  test "设置为封面" do
    put 'update', {:id => @photo.id, :cover => 1}, {:user_id => 2}
    @album.reload
    assert_equal @album.cover, @photo
  end

  # 测试 destroy
  test "会长删除" do
    delete 'destroy', {:id => @photo.id}, {:user_id => 2}
    @album.reload
    assert_equal @album.photos_count, 0
  end

  test "长老删除" do
    delete 'destroy', {:id => @photo.id}, {:user_id => 3}
    assert_not_found
  end

  test "会员删除" do
    delete 'destroy', {:id => @photo.id}, {:user_id => 5}
    assert_not_found
  end

  test "被邀请的人删除" do
    delete 'destroy', {:id => @photo.id}, {:user_id => 1}
    assert_not_found
  end

  test "请求的人删除" do
    delete 'destroy', {:id => @photo.id}, {:user_id => 3}
    assert_not_found
  end

  test "非会员删除" do
    @m3.destroy
    delete 'destroy', {:id => @photo.id}, {:user_id => 4}
    assert_not_found
  end

  test "删除的正好是封面" do
    put 'update', {:id => @photo.id, :cover => 1}, {:user_id => 2}
    delete 'destroy', {:id => @photo.id}, {:user_id => 4}
    @album.reload
    assert_equal @album.photos_count, 0
    assert_nil @album.cover
  end

protected
  
  def save_photo opts={}
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    GuildPhoto.create({:album_id => @album.id, :uploaded_data => ActionController::TestUploadedFile.new(path, mimetype)}.merge(opts))
  end
    
  def assert_not_found
    assert_template 'not_found'
  end
    
  def redirect_to_new_friend
    assert_redirected_to new_friend_url(:id => @user.id)
  end

  def dig_link_exist_for photo
    assert_tag :tag => 'a', :content => '挖'
    assert_tag :tag => 'span', :attributes => {:id => "dig_guild_photo_#{photo.id}"}
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
    assert_tag :tag => 'a', :attributes => {:href => edit_guild_photo_url(photo)}
  end

  def edit_link_not_exist_for photo
    assert_no_tag :tag => 'a', :attributes => {:href => edit_guild_photo_url(photo)}
  end

  def delete_link_exist_for photo
    assert_tag :tag => 'a', :attributes => {:href => guild_photo_url(photo), :rel => 'facebox', :facebox_type => 'confirm', :facebox_method => 'delete'}
  end

  def delete_link_not_exist_for photo
    assert_no_tag :tag => 'a', :attributes => {:href => guild_photo_url(photo), :rel => 'facebox', :facebox_type => 'confirm', :facebox_method => 'delete'}
  end

  def new_photo_link_exist_for album
    assert_tag :tag => 'a', :attributes => {:href => new_guild_photo_url(:album_id => album.id)}
  end

  def new_photo_link_not_exist_for album
    assert_no_tag :tag => 'a', :attributes => {:href => new_guild_photo_url(:album_id => album.id)}
  end

end
