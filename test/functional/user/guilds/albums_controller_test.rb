require 'test_helper'

class User::Guilds::AlbumsControllerTest < ActionController::TestCase

  def setup
    @user = User.find(1)
    @guild = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => @user.id})
    @album = @guild.album
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    @photo = GuildPhoto.create({:album_id => @album.id, :poster_id => 1, :uploaded_data => ActionController::TestUploadedFile.new(path, mimetype)})
    @m1 = Membership.create(:user_id => 2, :status => 0, :guild_id => @guild.id)
    @m2 = Membership.create(:user_id => 3, :status => 1, :guild_id => @guild.id)
    @m3 = Membership.create(:user_id => 4, :status => 4, :guild_id => @guild.id)
    @m4 = Membership.create(:user_id => 5, :status => 5, :guild_id => @guild.id)
    @album.reload
    @guild.reload
    @user.reload
  end

  # 测试show
  test "会长看" do
    get 'show', {:id => @album.id}, {:user_id => 1}

    assert_equal assigns(:album), @album
    assert_template 'user/guilds/albums/show'

    new_photo_link_exist_for @album
    photo_edit_link_exist_for @photo
    photo_delete_link_exist_for @photo    
  end

  test "长老看" do
    get 'show', {:id => @album.id}, {:user_id => 4}

    assert_equal assigns(:album), @album
    assert_template 'user/guilds/albums/show'

    new_photo_link_exist_for @album
    photo_edit_link_not_exist_for @photo
    photo_delete_link_not_exist_for @photo
  end

  test "会员看" do
    get 'show', {:id => @album.id}, {:user_id => 5}

    assert_equal assigns(:album), @album
    assert_template 'user/guilds/albums/show'

    new_photo_link_not_exist_for @album
    photo_edit_link_not_exist_for @photo
    photo_delete_link_not_exist_for @photo
  end

  test "邀请的人看" do
    get 'show', {:id => @album.id}, {:user_id => 2}

    assert_equal assigns(:album), @album
    assert_template 'user/guilds/albums/show'

    new_photo_link_not_exist_for @album
    photo_edit_link_not_exist_for @photo
    photo_delete_link_not_exist_for @photo
  end

  test "请求的人看" do
    get 'show', {:id => @album.id}, {:user_id => 3}

    assert_equal assigns(:album), @album
    assert_template 'user/guilds/albums/show'

    new_photo_link_not_exist_for @album
    photo_edit_link_not_exist_for @photo
    photo_delete_link_not_exist_for @photo
  end

  test "没加入的人看" do
    @m1.destroy

    get 'show', {:id => @album.id}, {:user_id => 2}

    assert_equal assigns(:album), @album
    assert_template 'user/guilds/albums/show'

    new_photo_link_not_exist_for @album
    photo_edit_link_not_exist_for @photo
    photo_delete_link_not_exist_for @photo
  end

  # 测试update
  test "会长更新" do
    put 'update', {:id => @album.id, :album => {:description => '123'}}, {:user_id => 1}
    @album.reload
    assert_equal @album.description, '123'
  end

  test "别人更新" do
    put 'update', {:id => @album.id, :album => {:description => '123'}}, {:user_id => 4}
    assert_template 'not_found'
  end

protected

  def new_photo_link_exist_for album
    assert_tag :tag => 'a', :attributes => {:href => new_guild_photo_url(:album_id => album.id)}
  end

  def new_photo_link_not_exist_for album
    assert_no_tag :tag => 'a', :attributes => {:href => new_guild_photo_url(:album_id => album.id)}
  end

  def photo_edit_link_exist_for photo
    assert_tag :tag => 'a', :attributes => {:href => edit_guild_photo_url(photo)}
  end 
  
  def photo_edit_link_not_exist_for photo
    assert_no_tag :tag => 'a', :attributes => {:href => edit_guild_photo_url(photo)}
  end

  def photo_delete_link_exist_for photo
    assert_tag :tag => 'a', :attributes => {:href => guild_photo_url(photo), :rel => 'facebox', :facebox_type => 'confirm', :facebox_method => 'delete'}
  end

  def photo_delete_link_not_exist_for photo
    assert_no_tag :tag => 'a', :attributes => {:href => guild_photo_url(photo), :rel => 'facebox', :facebox_type => 'confirm', :facebox_method => 'delete'}
  end

end
