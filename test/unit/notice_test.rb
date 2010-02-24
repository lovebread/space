require 'test_helper'

class NoticeTest < ActiveSupport::TestCase

  def setup
    @user1 = User.find(1)  
    @user2 = User.find(2)
    @user3 = User.find(3)
    @user4 = User.find(4)
  end

  test "没有接受者" do
    n = Notice.create(:user_id => nil)
    assert_equal n.errors.on_base, "没有接受者"
  end

  test "没有产生通知的资源" do
    n = Notice.create(:user_id => 2, :producer_id => nil, :producer_type => 'FriendTag')
    assert_equal n.errors.on_base, "没有产生通知的资源"
  
    n = Notice.create(:user_id => 2, :producer_id => 1, :producer_type => nil)
    assert_equal n.errors.on_base, "没有产生通知的资源"
  end

  test "产生通知的资源不存在" do
    n = Notice.create(:user_id => 2, :producer_id => 2, :producer_type => 'FriendTag')
    assert_equal n.errors.on_base, "产生通知的资源不存在"
  end

  test "对没有标记的博客发表评论" do
    setup_blog
    Notice.destroy_all

    # user2对自己发标评论
    c = @b1.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    assert_equal Notice.count, 0

    # user1对user2发表评论
    c = @b1.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 2)
    @user2.reload
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1
    
    # user1对自己的评论发表评论
    c = @b1.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 0
    assert_equal @user1.unread_notices_count, 0
    assert_equal @user2.notices_count, 2
    assert_equal @user2.unread_notices_count, 2

    # user2回复user1的评论 
    c = @b1.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    @user2.reload
    assert_equal @user2.notices_count, 2
    assert_equal @user2.unread_notices_count, 2
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user3回复user1的评论
    c = @b1.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 1)
    @user1.reload
    @user2.reload
    @user3.reload
    assert_equal @user2.notices_count, 3
    assert_equal @user2.unread_notices_count, 3
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user3.notices_count, 0
    assert_equal @user3.unread_notices_count, 0
  end

  test "对标记过的博客发表评论" do
    setup_blog
    Notice.destroy_all

    # user2对自己发标评论
    c = @b2.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user3对user2发表评论
    c = @b2.comments.create(:poster_id => 3, :content => 'user1', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1
    
    # user3对自己的评论发表评论
    c = @b2.comments.create(:poster_id => 3, :content => 'user1', :recipient_id => 3)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 2
    assert_equal @user2.unread_notices_count, 2

    # user2回复user3的评论 
    c = @b2.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 3)
    @user1.reload
    @user2.reload
    @user3.reload
    assert_equal @user1.notices_count, 4
    assert_equal @user1.unread_notices_count, 4
    assert_equal @user2.notices_count, 2
    assert_equal @user2.unread_notices_count, 2
    assert_equal @user3.notices_count, 1
    assert_equal @user3.unread_notices_count, 1

    # user1回复user3的评论
    c = @b2.comments.create(:poster_id => 1, :content => 'user3', :recipient_id => 3)
    @user1.reload
    @user2.reload
    @user3.reload
    assert_equal @user1.notices_count, 4
    assert_equal @user1.unread_notices_count, 4
    assert_equal @user2.notices_count, 3
    assert_equal @user2.unread_notices_count, 3
    assert_equal @user3.notices_count, 2
    assert_equal @user3.unread_notices_count, 2
  end

  test "对没有标记的视频发表评论" do
    setup_video
    Notice.destroy_all

    # user2对自己发标评论
    c = @v1.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    assert_equal Notice.count, 0

    # user1对user2发表评论
    c = @v1.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 2)
    @user2.reload
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1
    
    # user1对自己的评论发表评论
    c = @v1.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 0
    assert_equal @user1.unread_notices_count, 0
    assert_equal @user2.notices_count, 2
    assert_equal @user2.unread_notices_count, 2

    # user2回复user1的评论 
    c = @v1.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    @user2.reload
    assert_equal @user2.notices_count, 2
    assert_equal @user2.unread_notices_count, 2
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user3回复user1的评论
    c = @v1.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 1)
    @user1.reload
    @user2.reload
    @user3.reload
    assert_equal @user2.notices_count, 3
    assert_equal @user2.unread_notices_count, 3
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user3.notices_count, 0
    assert_equal @user3.unread_notices_count, 0
  end

  test "对标记过的视频发表评论" do
    setup_video
    Notice.destroy_all

    # user2对自己发标评论
    c = @v2.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user3对user2发表评论
    c = @v2.comments.create(:poster_id => 3, :content => 'user1', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1
    
    # user3对自己的评论发表评论
    c = @v2.comments.create(:poster_id => 3, :content => 'user1', :recipient_id => 3)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 2
    assert_equal @user2.unread_notices_count, 2

    # user2回复user3的评论 
    c = @v2.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 3)
    @user1.reload
    @user2.reload
    @user3.reload
    assert_equal @user1.notices_count, 4
    assert_equal @user1.unread_notices_count, 4
    assert_equal @user2.notices_count, 2
    assert_equal @user2.unread_notices_count, 2
    assert_equal @user3.notices_count, 1
    assert_equal @user3.unread_notices_count, 1

    # user1回复user3的评论
    c = @v2.comments.create(:poster_id => 1, :content => 'user3', :recipient_id => 3)
    @user1.reload
    @user2.reload
    @user3.reload
    assert_equal @user1.notices_count, 4
    assert_equal @user1.unread_notices_count, 4
    assert_equal @user2.notices_count, 3
    assert_equal @user2.unread_notices_count, 3
    assert_equal @user3.notices_count, 2
    assert_equal @user3.unread_notices_count, 2
  end

  test "对状态发表评论" do
    setup_status
    Notice.destroy_all

    # user1对自己发表评论
    c = @s.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    assert_equal Notice.count, 0

    # user2对user1发表评论
    c = @s.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user2对user2发表评论
    c = @s.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 0
    assert_equal @user2.unread_notices_count, 0

    # user3对user2发表评论
    c = @s.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1

  end

  test "对投票发表评论" do
    setup_poll
    Notice.destroy_all
  
    # user1对自己发表评论
    c = @p.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    assert_equal Notice.count, 0

    # user2对user1发表评论
    c = @p.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user2对user2发表评论
    c = @p.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 0
    assert_equal @user2.unread_notices_count, 0

    # user3对user2发表评论
    c = @p.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1          
  end

  test "对分享发表评论" do
  end
  
  test "对头像相册" do
    setup_avatar_album
    Notice.destroy_all

    # user1对自己发表评论
    c = @a.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    assert_equal Notice.count, 0

    # user2对user1发表评论
    c = @a.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user2对user2发表评论
    c = @a.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 0
    assert_equal @user2.unread_notices_count, 0

    # user3对user2发表评论
    c = @a.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1
  end

  test "对没有标记的头像发表评论" do
    setup_avatar_album
    Notice.destroy_all

    # user1对自己发表评论
    c = @p1.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    assert_equal Notice.count, 0

    # user2对user1发表评论
    c = @p1.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user2对user2发表评论
    c = @p1.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 0
    assert_equal @user2.unread_notices_count, 0

    # user3对user2发表评论
    c = @p1.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1
  end

  test "对有标记的头像发表评论" do
    setup_avatar_album
    Notice.destroy_all

    # user1对自己发表评论
    c = @p2.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    @user2.reload
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1

    # user2对user1发表评论
    c = @p2.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1

    # user2对user2发表评论
    c = @p2.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1

    # user3对user2发表评论
    c = @p2.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 2
    assert_equal @user2.unread_notices_count, 2

    # user1对user3发表评论
    c = @p2.comments.create(:poster_id => 1, :content => 'user3', :recipient_id => 3)
    @user1.reload
    @user2.reload
    @user3.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 3
    assert_equal @user2.unread_notices_count, 3
    assert_equal @user3.notices_count, 1
    assert_equal @user3.unread_notices_count, 1
  end
  
  test "对个人相册" do
    setup_personal_album
    Notice.destroy_all

    # user1对自己发表评论
    c = @a.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    assert_equal Notice.count, 0

    # user2对user1发表评论
    c = @a.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user2对user2发表评论
    c = @a.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 0
    assert_equal @user2.unread_notices_count, 0

    # user3对user2发表评论
    c = @a.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1
  end
  
  test "对没有标记的个人照片发表评论" do
    setup_personal_album
    Notice.destroy_all

    # user1对自己发表评论
    c = @p1.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    assert_equal Notice.count, 0

    # user2对user1发表评论
    c = @p1.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user2对user2发表评论
    c = @p1.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 0
    assert_equal @user2.unread_notices_count, 0

    # user3对user2发表评论
    c = @p1.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1
  end

  test "对有标记的个人照片发表评论" do
    setup_personal_album
    Notice.destroy_all

    # user1对自己发表评论
    c = @p2.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    @user2.reload
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1

    # user2对user1发表评论
    c = @p2.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1

    # user2对user2发表评论
    c = @p2.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1

    # user3对user2发表评论
    c = @p2.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 2
    assert_equal @user2.unread_notices_count, 2

    # user1对user3发表评论
    c = @p2.comments.create(:poster_id => 1, :content => 'user3', :recipient_id => 3)
    @user1.reload
    @user2.reload
    @user3.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 3
    assert_equal @user2.unread_notices_count, 3
    assert_equal @user3.notices_count, 1
    assert_equal @user3.unread_notices_count, 1  
  end

  test "对工会相册" do
    setup_guild
    Notice.destroy_all

    # user1对自己发表评论
    c = @a.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    assert_equal Notice.count, 0

    # user2对user1发表评论
    c = @a.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user2对user2发表评论
    c = @a.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 0
    assert_equal @user2.unread_notices_count, 0

    # user3对user2发表评论
    c = @a.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1
  end

  test "对没有标记的工会照片发表评论" do
    setup_guild
    Notice.destroy_all

    # user1对自己发表评论
    c = @p1.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    assert_equal Notice.count, 0

    # user2对user1发表评论
    c = @p1.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user2对user2发表评论
    c = @p1.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 0
    assert_equal @user2.unread_notices_count, 0

    # user3对user2发表评论
    c = @p1.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1
  end

  test "对有标记的工会照片发表评论" do
    setup_guild
    Notice.destroy_all 

    # user1对自己发表评论
    c = @p2.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    @user2.reload
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1

    # user2对user1发表评论
    c = @p2.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1

    # user2对user2发表评论
    c = @p2.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1

    # user3对user2发表评论
    c = @p2.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 2
    assert_equal @user2.unread_notices_count, 2

    # user1对user3发表评论
    c = @p2.comments.create(:poster_id => 1, :content => 'user3', :recipient_id => 3)
    @user1.reload
    @user2.reload
    @user3.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 3
    assert_equal @user2.unread_notices_count, 3
    assert_equal @user3.notices_count, 1
    assert_equal @user3.unread_notices_count, 1
  end

  test "对活动相册" do
    setup_event
    Notice.destroy_all

    # user1对自己发表评论
    c = @a.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    assert_equal Notice.count, 0

    # user2对user1发表评论
    c = @a.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user2对user2发表评论
    c = @a.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 0
    assert_equal @user2.unread_notices_count, 0

    # user3对user2发表评论
    c = @a.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1
  end

  test "对没有标记的活动照片发表评论" do
    setup_event
    Notice.destroy_all

    # user1对自己发表评论
    c = @p1.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    assert_equal Notice.count, 0

    # user2对user1发表评论
    c = @p1.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user2对user2发表评论
    c = @p1.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 0
    assert_equal @user2.unread_notices_count, 0

    # user3对user2发表评论
    c = @p1.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1
  end

  test "对有标记的活动照片发表评论" do
    setup_event
    Notice.destroy_all

    # user1对自己发表评论
    c = @p2.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    @user2.reload
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1

    # user2对user1发表评论
    c = @p2.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1

    # user2对user2发表评论
    c = @p2.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1

    # user3对user2发表评论
    c = @p2.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 2
    assert_equal @user2.unread_notices_count, 2

    # user1对user3发表评论
    c = @p2.comments.create(:poster_id => 1, :content => 'user3', :recipient_id => 3)
    @user1.reload
    @user2.reload
    @user3.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 3
    assert_equal @user2.unread_notices_count, 3
    assert_equal @user3.notices_count, 1
    assert_equal @user3.unread_notices_count, 1
  end

  test "个人留言版上留言" do
    setup_profile  
  
    # user1对自己发表评论
    c = @p.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    assert_equal Notice.count, 0

    # user2对user1发表评论
    c = @p.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user2对user2发表评论
    c = @p.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 0
    assert_equal @user2.unread_notices_count, 0

    # user3对user2发表评论
    c = @p.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1
  end

  test "活动留言版上留言" do
    setup_event
    Notice.destroy_all
    Participation.create(:participant_id => 2, :status => 4, :event_id => @e.id)
    Participation.create(:participant_id => 3, :status => 5, :event_id => @e.id)

    # user1对自己发表评论
    c = @e.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    assert_equal Notice.count, 0
  
    # user2对user1发表评论
    c = @e.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user2对user2发表评论
    c = @e.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 0
    assert_equal @user2.unread_notices_count, 0

    # user3对user2发表评论
    c = @e.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1
  end

  test "工会留言版上留言" do
    setup_guild 
    Notice.destroy_all
    Membership.create(:user_id => 2, :status => 4, :guild_id => @g.id)
    Membership.create(:user_id => 3, :status => 5, :guild_id => @g.id)

    # user1对自己发表评论
    c = @g.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    assert_equal Notice.count, 0
    
    # user2对user1发表评论
    c = @g.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user2对user2发表评论
    c = @g.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 2
    assert_equal @user1.unread_notices_count, 2
    assert_equal @user2.notices_count, 0
    assert_equal @user2.unread_notices_count, 0

    # user3对user2发表评论
    c = @g.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 3
    assert_equal @user1.unread_notices_count, 3
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1
  end

  test "游戏留言版上留言" do
    @g = Game.find(1)

    # user1对自己发表评论
    c = @g.comments.create(:poster_id => 1, :content => 'user1', :recipient_id => 1)
    assert_equal Notice.count, 0

    # user2对user1发表评论
    c = @g.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 1)
    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1

    # user2对user2发表评论
    c = @g.comments.create(:poster_id => 2, :content => 'user2', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1
    assert_equal @user2.notices_count, 0
    assert_equal @user2.unread_notices_count, 0

    # user3对user2发表评论
    c = @g.comments.create(:poster_id => 3, :content => 'user3', :recipient_id => 2)
    @user1.reload
    @user2.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1
  end

  test "测试read" do
    setup_blog
    setup_video
    Notice.destroy_all

    c = @b1.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123')
    n1 = c.notices.first
    c = @b1.comments.create(:poster_id => 3, :recipient_id => 2, :content => '234')
    n2 = c.notices.first
    c = @b2.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123')
    n3 = c.notices.first
    c = @b2.comments.create(:poster_id => 3, :recipient_id => 2, :content => '234')
    n4 = c.notices.first
    c = @v1.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123')
    n5 = c.notices.first
    c = @v1.comments.create(:poster_id => 3, :recipient_id => 2, :content => '234')
    n6 = c.notices.first
    c = @v2.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123')
    n7 = c.notices.first
    c = @v2.comments.create(:poster_id => 3, :recipient_id => 2, :content => '234')
    n8 = c.notices.first  

    @user2.reload
    assert_equal @user2.notices_count, 8
    assert_equal @user2.unread_notices_count, 8

    n8.read_by @user2
    @user2.reload
    n7.reload
    n8.reload
    assert_equal @user2.notices_count, 8
    assert_equal @user2.unread_notices_count, 6
    assert n8.read
    assert n7.read

    n5.read_by @user2
    @user2.reload
    n5.reload
    n6.reload
    assert_equal @user2.notices_count, 8
    assert_equal @user2.unread_notices_count, 4
    assert n5.read
    assert n6.read

    n3.read_by @user2
    @user2.reload
    n3.reload
    n4.reload
    assert_equal @user2.notices_count, 8
    assert_equal @user2.unread_notices_count, 2
    assert n3.read
    assert n4.read

    n1.read_by @user2
    @user2.reload
    n1.reload
    n2.reload
    assert_equal @user2.notices_count, 8
    assert_equal @user2.unread_notices_count, 0
    assert n1.read
    assert n2.read
  end

  test "测试删除的计数器" do
    setup_blog
    Notice.destroy_all

    c = @b1.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123')
    n1 = c.notices.first
    c = @b1.comments.create(:poster_id => 3, :recipient_id => 2, :content => '234')
    n2 = c.notices.first
    c = @b2.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123')
    n3 = c.notices.first
    c = @b2.comments.create(:poster_id => 3, :recipient_id => 2, :content => '234')
    n4 = c.notices.first

    n3.destroy
    @user2.reload
    assert_equal @user2.notices_count, 3
    assert_equal @user2.unread_notices_count, 3

    n1.read_by @user2
    @user2.reload
    assert_equal @user2.notices_count, 3
    assert_equal @user2.unread_notices_count, 1

    n2.reload and n2.destroy
    @user2.reload
    assert_equal @user2.notices_count, 2
    assert_equal @user2.unread_notices_count, 1

    n4.destroy
    @user2.reload
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 0
  end

  test "标记照片" do
    setup_personal_album

    @user2.reload
    assert_equal @user2.notices_count, 1
    assert_equal @user2.unread_notices_count, 1
  end

  test "标记博客" do
    setup_blog

    @user2.reload
    assert_equal @user2.notices_count, 0
    assert_equal @user2.unread_notices_count, 0

    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1
  end

  test "标记视频" do
    setup_video

    @user2.reload
    assert_equal @user2.notices_count, 0
    assert_equal @user2.unread_notices_count, 0

    @user1.reload
    assert_equal @user1.notices_count, 1
    assert_equal @user1.unread_notices_count, 1 
  end

protected

  def setup_profile
    @p = @user1.profile
  end

  def setup_blog
    @b1 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 't', :content => 'c', :privilege => 1})
    @b2 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 't', :content => 'c', :friend_tags => [1, 2], :privilege => 1}) 
  end

  def setup_video
    @v1 = Video.create({:game_id => 1, :poster_id => 2, :title => 't', :privilege => 1, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.htmli"})
    @v2 = Video.create({:game_id => 1, :poster_id => 2, :title => 't', :privilege => 1, :friend_tags => [1,2], :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.htmli"})
  end

  def setup_status
    @s = Status.create({:poster_id => 1, :content => 'hello world'})
  end  

  def setup_poll
    @p = Poll.create({:name => 'poll name', :game_id => 1, :poster_id => 1, :no_deadline => false, :deadline => 3.days.from_now.to_s(:db), :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}], :privilege => 1})
  end

  def setup_avatar_album
    @a = @user1.avatar_album
    @p1 = save_photo 'Avatar', :album_id => @a.id
    @p2 = save_photo 'Avatar', :album_id => @a.id
    @p2.tags.create(:tagged_user_id => 2, :poster_id => 1)
  end  

  def setup_personal_album
    @a = PersonalAlbum.create(:owner_id => 1, :game_id => 1, :title => 'album title', :description => 'description', :privilege => 1)
    @p1 = save_photo 'PersonalPhoto', :album_id => @a.id
    @p2 = save_photo 'PersonalPhoto', :album_id => @a.id
    @p2.tags.create(:tagged_user_id => 2, :poster_id => 1)
  end 

  def setup_event
    @e = Event.create({:game_id => 1, :game_area_id => 1, :game_server_id => 1, :poster_id => 1, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'event description'})
    @a = @e.album
    @p1 = save_photo 'EventPhoto', :album_id => @a.id, :poster_id => 1
    @p2 = save_photo 'EventPhoto', :album_id => @a.id, :poster_id => 1
    @p2.tags.create(:poster_id => 1, :tagged_user_id => 2)
  end

  def setup_guild
    @g = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => 1})
    @a = @g.album
    @p1 = save_photo 'GuildPhoto', :album_id => @a.id, :poster_id => 1
    @p2 = save_photo 'GuildPhoto', :album_id => @a.id, :poster_id => 1
    @p2.tags.create(:poster_id => 1, :tagged_user_id => 2)
  end

  def save_photo photo_type, opts={}
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    photo_type.constantize.create({:uploaded_data => ActionController::TestUploadedFile.new(path, mimetype)}.merge(opts))
  end

end
