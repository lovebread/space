require 'test_helper'

class PhotoTagTest < ActiveSupport::TestCase

  def setup
    @user1 = User.find(1)
    @user2 = User.find(2)
    @user3 = User.find(3)
    @user4 = User.find(4)
  end

  test "没有发布者" do
    t = PhotoTag.create(:poster_id => nil)
    assert_equal t.errors.on_base, "没有发布者"
  end

  test "没有被标记的人" do
    t = PhotoTag.create(:tagged_user_id => nil, :poster_id => 2)
    assert_equal t.errors.on_base, "没有被标记的人"
  end

  test "被标记的人不是好友或本人" do
    t = PhotoTag.create(:tagged_user_id => 4, :poster_id => 2)
    assert_equal t.errors.on_base, "被标记的不是好友或本人"
  end

  test "没有照片" do
    t = PhotoTag.create(:photo_id => nil, :tagged_user_id => 1, :poster_id => 2)
    assert_equal t.errors.on_base, "没有照片"
  end

  test "照片不存在" do
    t = PhotoTag.create(:photo_id => 2323, :tagged_user_id => 1, :poster_id => 2)
    assert_equal t.errors.on_base, "照片不存在"
  end

  test "没有权限标记" do
    setup_personal_album
    
    t = PhotoTag.create(:photo_id => @p1.id, :tagged_user_id => 1, :poster_id => 3)
    assert_equal t.errors.on_base, "没有权限标记"
  end

  # 对个人照片进行标记
  test "本人标记照片" do
    setup_personal_album

    t = PhotoTag.create(:photo_id => @p1.id, :poster_id => 2, :tagged_user_id => 2)
    @p1.reload
    assert_equal @p1.tags_count, 1
    assert_nil t.errors.on_base    

    t = PhotoTag.create(:photo_id => @p2.id, :poster_id => 2, :tagged_user_id => 2)
    @p2.reload
    assert_equal @p2.tags_count, 1
    assert_nil t.errors.on_base

    t = PhotoTag.create(:photo_id => @p3.id, :poster_id => 2, :tagged_user_id => 2)
    @p3.reload
    assert_equal @p3.tags_count, 1
    assert_nil t.errors.on_base

    t = PhotoTag.create(:photo_id => @p4.id, :poster_id => 2, :tagged_user_id => 2)
    @p4.reload
    assert_equal @p4.tags_count, 1
    assert_nil t.errors.on_base
  end

  test "好友标记照片" do
    setup_personal_album

    t = PhotoTag.create(:photo_id => @p1.id, :poster_id => 1, :tagged_user_id => 1)
    @p1.reload
    assert_equal @p1.tags_count, 1
    assert_nil t.errors.on_base

    t = PhotoTag.create(:photo_id => @p2.id, :poster_id => 1, :tagged_user_id => 1)
    @p2.reload
    assert_equal @p2.tags_count, 1
    assert_nil t.errors.on_base
    
    t = PhotoTag.create(:photo_id => @p3.id, :poster_id => 1, :tagged_user_id => 1)
    @p3.reload
    assert_equal @p3.tags_count, 1
    assert_nil t.errors.on_base

    t = PhotoTag.create(:photo_id => @p4.id, :poster_id => 1, :tagged_user_id => 1)
    @p4.reload
    assert_equal @p4.tags_count, 0
    assert_not_nil t.errors.on_base
  end

  test "相同游戏的人标记照片" do
    setup_personal_album

    t = PhotoTag.create(:photo_id => @p1.id, :poster_id => 3, :tagged_user_id => 3)
    @p1.reload
    assert_equal @p1.tags_count, 0
    assert_not_nil t.errors.on_base

    t = PhotoTag.create(:photo_id => @p2.id, :poster_id => 3, :tagged_user_id => 3)
    @p2.reload
    assert_equal @p2.tags_count, 0
    assert_not_nil t.errors.on_base
    
    t = PhotoTag.create(:photo_id => @p3.id, :poster_id => 3, :tagged_user_id => 3)
    @p3.reload
    assert_equal @p3.tags_count, 0
    assert_not_nil t.errors.on_base

    t = PhotoTag.create(:photo_id => @p4.id, :poster_id => 3, :tagged_user_id => 3)
    @p4.reload
    assert_equal @p4.tags_count, 0
    assert_not_nil t.errors.on_base
  end

  test "陌生人标记个人照片" do
    setup_personal_album

    t = PhotoTag.create(:photo_id => @p1.id, :poster_id => 4, :tagged_user_id => 4)
    @p1.reload
    assert_equal @p1.tags_count, 0
    assert_not_nil t.errors.on_base

    t = PhotoTag.create(:photo_id => @p2.id, :poster_id => 4, :tagged_user_id => 4)
    @p2.reload
    assert_equal @p2.tags_count, 0
    assert_not_nil t.errors.on_base
    
    t = PhotoTag.create(:photo_id => @p3.id, :poster_id => 4, :tagged_user_id => 4)
    @p3.reload
    assert_equal @p3.tags_count, 0
    assert_not_nil t.errors.on_base

    t = PhotoTag.create(:photo_id => @p4.id, :poster_id => 4, :tagged_user_id => 4)
    @p4.reload
    assert_equal @p4.tags_count, 0
    assert_not_nil t.errors.on_base
  end 

  test "删除个人照片的标记" do
    setup_personal_album

    t = PhotoTag.create(:photo_id => @p1.id, :poster_id => 2, :tagged_user_id => 2)
    assert !t.is_deleteable_by?(@user1)
    assert t.is_deleteable_by?(@user2)
    assert !t.is_deleteable_by?(@user3)
    assert !t.is_deleteable_by?(@user4)

    t = PhotoTag.create(:photo_id => @p1.id, :poster_id => 1, :tagged_user_id => 2)
    assert !t.is_deleteable_by?(@user1)
    assert t.is_deleteable_by?(@user2)
    assert !t.is_deleteable_by?(@user3)
    assert !t.is_deleteable_by?(@user4)
  end

  # 对个人照片进行标记
  test "本人标记头像" do
    setup_avatar_album

    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 2, :tagged_user_id => 2)
    @p.reload
    assert_equal @p.tags_count, 1
    assert_nil t.errors.on_base
  end

  test "好友标记头像" do
    setup_avatar_album

    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 1, :tagged_user_id => 2)
    @p.reload
    assert_equal @p.tags_count, 1
    assert_nil t.errors.on_base
  end

  test "相同游戏者标记头像" do
    setup_avatar_album

    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 3, :tagged_user_id => 2)
    @p.reload
    assert_equal @p.tags_count, 0
    assert_not_nil t.errors.on_base
  end

  test "陌生人标记头像" do
    setup_avatar_album

    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 4, :tagged_user_id => 4)
    @p.reload
    assert_equal @p.tags_count, 0
    assert_not_nil t.errors.on_base
  end

  test "删除头像的标记" do
    setup_avatar_album
  
    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 2, :tagged_user_id => 2)
    assert !t.is_deleteable_by?(@user1)
    assert t.is_deleteable_by?(@user2)
    assert !t.is_deleteable_by?(@user3)
    assert !t.is_deleteable_by?(@user4)

    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 1, :tagged_user_id => 1)
    assert !t.is_deleteable_by?(@user1)
    assert t.is_deleteable_by?(@user2)
    assert !t.is_deleteable_by?(@user3)
    assert !t.is_deleteable_by?(@user4)
  end

  # 对活动照片进行标记
  test "活动组织者标记照片" do
    setup_event
    
    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 2, :tagged_user_id => 2)
    @p.reload
    assert_equal @p.tags_count, 1
    assert_nil t.errors.on_base
  end

  test "活动参与者标记照片" do
    setup_event
    Participation.create(:participant_id => 1, :event_id => @e.id, :status => 3)
    
    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 1, :tagged_user_id => 2)
    @p.reload
    assert_equal @p.tags_count, 1
    assert_nil t.errors.on_base
  end

  test "活动请求加入者标记照片" do
    setup_event
    Participation.create(:participant_id => 1, :event_id => @e.id, :status => 1)

    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 1, :tagged_user_id => 2)
    @p.reload
    assert_equal @p.tags_count, 0
    assert_not_nil t.errors.on_base
  end

  test "活动被邀请者标记照片" do
    setup_event
    Participation.create(:participant_id => 1, :event_id => @e.id, :status => 0)

    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 1, :tagged_user_id => 2)
    @p.reload
    assert_equal @p.tags_count, 0
    assert_not_nil t.errors.on_base
  end

  test "不参加活动的人标记照片" do
    setup_event

    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 1, :tagged_user_id => 2)
    @p.reload
    assert_equal @p.tags_count, 0
    assert_not_nil t.errors.on_base
  end

  test "删除活动照片的标记" do
    setup_event

    Participation.create(:participant_id => 1, :status => 4, :event_id => @e.id)
    Participation.create(:participant_id => 3, :status => 5, :event_id => @e.id)

    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 3, :tagged_user_id => 3)
    assert !t.is_deleteable_by?(@user1)
    assert t.is_deleteable_by?(@user2)
    assert !t.is_deleteable_by?(@user3)
    assert !t.is_deleteable_by?(@user4)

    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 1, :tagged_user_id => 1)
    assert !t.is_deleteable_by?(@user1)
    assert t.is_deleteable_by?(@user2)
    assert !t.is_deleteable_by?(@user3)
    assert !t.is_deleteable_by?(@user4)
  end

  # 测试 标记工会照片
  test "会长标记照片" do
    setup_guild

    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 2, :tagged_user_id => 2)
    @p.reload
    assert_equal @p.tags_count, 1
    assert_nil t.errors.on_base
  end

  test "长老标记照片" do
    setup_guild
    Membership.create(:user_id => 1, :guild_id => @g.id, :status => 4) 

    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 1, :tagged_user_id => 2)
    @p.reload
    assert_equal @p.tags_count, 1
    assert_nil t.errors.on_base
  end

  test "会员标记照片" do
    setup_guild
    Membership.create(:user_id => 1, :guild_id => @g.id, :status => 5)

    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 1, :tagged_user_id => 2)
    @p.reload
    assert_equal @p.tags_count, 1
    assert_nil t.errors.on_base
  end

  test "被邀请加入工会的人标记照片" do
    setup_guild
    Membership.create(:user_id => 1, :guild_id => @g.id, :status => 0)

    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 1, :tagged_user_id => 2)
    @p.reload
    assert_equal @p.tags_count, 0
    assert_not_nil t.errors.on_base
  end

  test "请求加入工会的人标记照片" do
    setup_guild
    Membership.create(:user_id => 1, :guild_id => @g.id, :status => 1)

    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 1, :tagged_user_id => 2)
    @p.reload
    assert_equal @p.tags_count, 0
    assert_not_nil t.errors.on_base
  end

  test "非工会的人标记照片" do
    setup_guild

    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 1, :tagged_user_id => 2)
    @p.reload
    assert_equal @p.tags_count, 0
    assert_not_nil t.errors.on_base
  end

  test "删除工会照片的标记" do
    setup_guild

    Membership.create(:user_id => 1, :status => 4, :guild_id => @g.id)
    Membership.create(:user_id => 1, :status => 5, :guild_id => @g.id)
  
    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 3, :tagged_user_id => 3)
    assert !t.is_deleteable_by?(@user1)
    assert t.is_deleteable_by?(@user2)
    assert !t.is_deleteable_by?(@user3)
    assert !t.is_deleteable_by?(@user4)

    t = PhotoTag.create(:photo_id => @p.id, :poster_id => 1, :tagged_user_id => 1)
    assert !t.is_deleteable_by?(@user1)
    assert t.is_deleteable_by?(@user2)
    assert !t.is_deleteable_by?(@user3)
    assert !t.is_deleteable_by?(@user4) 
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
