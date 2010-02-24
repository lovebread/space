require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  fixtures :all

  def setup
    @user1 = User.find(1)
    @user2 = User.find(2)
    @user3 = User.find(3)
    @user4 = User.find(4)
  end

  test "没有发表者" do
    c = Comment.create(:poster_id => nil)
    assert_equal c.errors.on_base, '没有发布者'
  end

  test "没有被评论的东西" do
    c = Comment.create(:poster_id => 1, :commentable_id => 1, :commentable_type => nil)
    assert_equal c.errors.on_base, '没有被评论的东西'

    c = Comment.create(:poster_id => 1, :commentable_id => nil, :commentable_type => 'Blog')
    assert_equal c.errors.on_base, '没有被评论的东西'
  end

  test "被评论的东西不存在" do
    c = Comment.create(:poster_id => 1, :commentable_id => 1, :commentable_type => 'Blog')
    assert_equal c.errors.on_base, '被评论的东西不存在'
  end

  # 评论 博客
  test "对于权限是1的博客" do
    setup_blog   
 
    c = @b1.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @b1.reload
    assert_equal @b1.comments_count, 1
   
    c = @b1.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @b1.reload
    assert_equal @b1.comments_count, 2

    c = @b1.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @b1.reload
    assert_equal @b1.comments_count, 3

    c = @b1.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @b1.reload
    assert_equal @b1.comments_count, 4
  end

  test "对于权限是2的博客" do
    setup_blog
  
    c = @b2.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @b2.reload
    assert_equal @b2.comments_count, 1

    c = @b2.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @b2.reload
    assert_equal @b2.comments_count, 2

    c = @b2.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @b2.reload
    assert_equal @b2.comments_count, 3

    c = @b2.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @b2.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @b2.comments_count, 3
  end

  test "对于权限是3的博客" do
    setup_blog

    c = @b3.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @b3.reload
    assert_equal @b3.comments_count, 1

    c = @b3.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @b3.reload
    assert_equal @b3.comments_count, 2

    c = @b3.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @b3.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @b3.comments_count, 2

    c = @b3.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @b3.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @b3.comments_count, 2
  end
 
  test "对于权限是4的博客" do
    setup_blog

    c = @b4.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @b4.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @b4.comments_count, 0

    c = @b4.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @b4.reload
    assert_equal @b4.comments_count, 1

    c = @b4.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @b4.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @b4.comments_count, 1

    c = @b4.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @b4.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @b4.comments_count, 1
  end

  test "删除博客的评论" do
    setup_blog

    c = @b1.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert c.is_deleteable_by?(@user4)

    c = @b2.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @b3.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    assert c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @b4.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)
  end

  # 评论 视频
  test "对于权限是1的视频" do
    setup_video

    c = @v1.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @v1.reload
    assert_equal @v1.comments_count, 1

    c = @v1.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @v1.reload
    assert_equal @v1.comments_count, 2

    c = @v1.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @v1.reload
    assert_equal @v1.comments_count, 3

    c = @v1.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @v1.reload
    assert_equal @v1.comments_count, 4
  end

  test "对于权限是2的视频" do
    setup_video

    c = @v2.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @v2.reload
    assert_equal @v2.comments_count, 1

    c = @v2.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @v2.reload
    assert_equal @v2.comments_count, 2

    c = @v2.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @v2.reload
    assert_equal @v2.comments_count, 3

    c = @v2.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @v2.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @v2.comments_count, 3
  end

  test "对于权限是3的视频" do
    setup_video

    c = @v3.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @v3.reload
    assert_equal @v3.comments_count, 1

    c = @v3.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @v3.reload
    assert_equal @v3.comments_count, 2

    c = @v3.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @v3.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @v3.comments_count, 2

    c = @v3.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @v3.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @v3.comments_count, 2
  end

  test "对于权限是4的视频" do
    setup_video

    c = @v4.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @v4.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @v4.comments_count, 0

    c = @v4.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @v4.reload
    assert_equal @v4.comments_count, 1

    c = @v4.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @v4.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @v4.comments_count, 1
    
    c = @v4.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @v4.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @v4.comments_count, 1
  end

  test "删除视频的评论" do
    setup_video

    c = @v1.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert c.is_deleteable_by?(@user4)

    c = @v2.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)
    
    c = @v3.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    assert c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @v4.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)
  end

  # 评论 状态
  test "状态" do
    setup_status

    c = @s.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @s.reload
    assert_equal @s.comments_count, 1

    c = @s.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @s.reload
    assert_equal @s.comments_count, 2

    c = @s.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @s.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @s.comments_count, 2

    c = @s.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @s.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @s.comments_count, 2
  end

  test "删除状态的评论" do
    setup_status

    c = @s.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    assert c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @s.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @s.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @s.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert c.is_deleteable_by?(@user4)
  end

  # 测试 个人相册
  test "权限是1的个人相册" do
    setup_personal_album

    c = @a1.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @a1.reload
    assert_equal @a1.comments_count, 1

    c = @a1.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @a1.reload
    assert_equal @a1.comments_count, 2

    c = @a1.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @a1.reload
    assert_equal @a1.comments_count, 3

    c = @a1.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @a1.reload
    assert_equal @a1.comments_count, 4 
  end

  test "权限是2的个人相册" do
    setup_personal_album

    c = @a2.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @a2.reload
    assert_equal @a2.comments_count, 1

    c = @a2.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @a2.reload
    assert_equal @a2.comments_count, 2

    c = @a2.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @a2.reload
    assert_equal @a2.comments_count, 3

    c = @a2.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @a2.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @a2.comments_count, 3
  end

  test "权限是3的个人相册" do
    setup_personal_album

    c = @a3.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @a3.reload
    assert_equal @a3.comments_count, 1

    c = @a3.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @a3.reload
    assert_equal @a3.comments_count, 2

    c = @a3.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @a3.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @a3.comments_count, 2

    c = @a3.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @a3.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @a3.comments_count, 2
  end

  test "权限是4的个人相册" do
    setup_personal_album
  
    c = @a4.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @a4.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @a4.comments_count, 0
    
    c = @a4.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @a4.reload
    assert_equal @a4.comments_count, 1
    
    c = @a4.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @a4.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @a4.comments_count, 1
    
    c = @a4.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @a4.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @a4.comments_count, 1
  end

  test "删除个人相册的评论" do
    setup_personal_album

    c = @a1.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert c.is_deleteable_by?(@user4)

    c = @a2.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @a3.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    assert c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @a4.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)
  end

  # 测试 个人相册的照片
  test "权限是1的个人相片" do
    setup_personal_album

    c = @p1.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @p1.reload
    assert_equal @p1.comments_count, 1

    c = @p1.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @p1.reload
    assert_equal @p1.comments_count, 2

    c = @p1.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @p1.reload
    assert_equal @p1.comments_count, 3

    c = @p1.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @p1.reload
    assert_equal @p1.comments_count, 4
  end

  test "权限是2的个人相片" do
    setup_personal_album

    c = @p2.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @p2.reload
    assert_equal @p2.comments_count, 1

    c = @p2.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @p2.reload
    assert_equal @p2.comments_count, 2

    c = @p2.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @p2.reload
    assert_equal @p2.comments_count, 3

    c = @p2.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @p2.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @p2.comments_count, 3
  end

  test "权限是3的个人相片" do
    setup_personal_album

    c = @p3.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @p3.reload
    assert_equal @p3.comments_count, 1

    c = @p3.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @p3.reload
    assert_equal @p3.comments_count, 2

    c = @p3.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @p3.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @p3.comments_count, 2

    c = @p3.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @p3.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @p3.comments_count, 2
  end

  test "权限是4的个人相片" do
    setup_personal_album

    c = @p4.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @p4.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @p4.comments_count, 0

    c = @p4.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @p4.reload
    assert_equal @p4.comments_count, 1

    c = @p4.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @p4.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @p4.comments_count, 1

    c = @p4.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @p4.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @p4.comments_count, 1
  end

  test "删除个人照片的评论" do
    setup_personal_album

    c = @p1.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert c.is_deleteable_by?(@user4)

    c = @p2.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @p3.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    assert c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @p4.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)
  end

  # 测试 头像相册
  test "头像相册" do
    setup_avatar_album

    c = @a.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @a.reload
    assert_equal @a.comments_count, 1

    c = @a.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @a.reload
    assert_equal @a.comments_count, 2

    c = @a.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @a.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @a.comments_count, 2

    c = @a.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @a.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @a.comments_count, 2 
  end

  test "删除头像相册的评论" do
    setup_avatar_album

    c = @a.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert c.is_deleteable_by?(@user4)

    c = @a.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @a.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    assert c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @a.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)
  end

  # 测试 头像
  test "头像" do
    setup_avatar_album

    c = @p.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 1

    c = @p.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 2

    c = @p.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @p.comments_count, 2

    c = @p.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @p.comments_count, 2
  end

  test "删除头像的评论" do
    setup_avatar_album

    c = @p.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert c.is_deleteable_by?(@user4)

    c = @p.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @p.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    assert c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @p.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)
  end

  # 测试 活动相册
  test "活动" do
    setup_event   
 
    Participation.create(:status => 3, :participant_id => 1, :event_id => @e.id)
    Participation.create(:status => 3, :participant_id => 3, :event_id => @e.id) 
  
    c = @e.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @e.reload
    assert_equal @e.comments_count, 1

    c = @e.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @e.reload
    assert_equal @e.comments_count, 2

    c = @e.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @e.reload
    assert_equal @e.comments_count, 3

    c = @e.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @e.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @e.comments_count, 3
  end

  test "删除活动的评论" do
    setup_event

    Participation.create(:status => 3, :participant_id => 1, :event_id => @e.id)
    Participation.create(:status => 3, :participant_id => 3, :event_id => @e.id)
    Participation.create(:status => 3, :participant_id => 4, :event_id => @e.id)

    c = @e.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @e.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @e.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @e.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)
  end

  test "活动相册" do
    setup_event

    c = @a.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @a.reload
    assert_equal @a.comments_count, 1

    c = @a.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @a.reload
    assert_equal @a.comments_count, 2

    c = @a.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @a.reload
    assert_equal @a.comments_count, 3

    c = @a.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @a.reload
    assert_equal @a.comments_count, 4
  end

  test "删除活动相册的评论" do
    setup_event 

    c = @a.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert c.is_deleteable_by?(@user4)

    c = @a.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @a.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    assert c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @a.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)
  end

  # 测试 活动照片
  test "活动照片" do
    setup_event

    c = @p.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 1

    c = @p.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 2

    c = @p.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 3

    c = @p.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 4
  end

  test "删除活动照片的评论" do
    setup_event

    c = @p.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert c.is_deleteable_by?(@user4)

    c = @p.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @p.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    assert c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @p.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)
  end

  # 测试 工会
  test "工会" do
    setup_guild
  
    Membership.create(:status => 4, :user_id => 1, :guild_id => @g.id)
    Membership.create(:status => 4, :user_id => 3, :guild_id => @g.id)
  
    c = @g.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @g.reload
    assert_equal @g.comments_count, 1

    c = @g.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @g.reload
    assert_equal @g.comments_count, 2

    c = @g.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @g.reload
    assert_equal @g.comments_count, 3

    c = @g.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @g.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @g.comments_count, 3
  end

  test "删除工会的评论" do
    setup_guild

    c = @g.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @g.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @g.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @g.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)
  end

  # 测试 工会相册
  test "工会相册" do
    setup_guild
  
    c = @a.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @a.reload
    assert_equal @a.comments_count, 1

    c = @a.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @a.reload
    assert_equal @a.comments_count, 2

    c = @a.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @a.reload
    assert_equal @a.comments_count, 3

    c = @a.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @a.reload
    assert_equal @a.comments_count, 4
  end

  test "删除工会相册的评论" do
    setup_guild

    c = @a.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert c.is_deleteable_by?(@user4)

    c = @a.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @a.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    assert c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @a.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)
  end
 
  # 测试 工会照片
  test "工会照片" do
    setup_guild

    c = @p.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 1

    c = @p.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 2

    c = @p.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 3

    c = @p.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 4
  end

  test "删除工会照片的评论" do
    setup_guild

    c = @p.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert c.is_deleteable_by?(@user4)

    c = @p.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @p.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    assert c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @p.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)
  end

  # 测试 profile
  test "档案, leave wall message设置为2" do
    setup_profile

    c = @p.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 1

    c = @p.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 2

    c = @p.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @p.comments_count, 2

    c = @p.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal c.errors.on_base, "没有评论的权限"
    assert_equal @p.comments_count, 2
  end

  test "档案, leave wall message设置为1" do
    setup_profile

    @user2.privacy_setting.update_attributes(:leave_wall_message => 1)

    c = @p.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 1

    c = @p.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 2

    c = @p.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 3

    c = @p.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 4
  end

  test "删除档案的评论(即留言)" do
    setup_profile

    c = @p.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @p.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @p.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @p.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)
  end

  # 测试 游戏
  test "游戏" do
    @p = Game.find(1)

    c = @p.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 1 
    
    c = @p.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 2

    c = @p.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 3

    c = @p.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @p.reload
    assert_equal @p.comments_count, 4
  end

  test "删除游戏的评论" do
    @p = Game.find(1)

    c = @p.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert !c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @p.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert !c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @p.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert !c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @p.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert !c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)
  end

  # 测试 投票
  test "权限为1的投票" do
    setup_poll

    c = @p1.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @p1.reload
    assert_equal @p1.comments_count, 1

    c = @p1.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @p1.reload
    assert_equal @p1.comments_count, 2

    c = @p1.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @p1.reload
    assert_equal @p1.comments_count, 3

    c = @p1.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @p1.reload
    assert_equal @p1.comments_count, 4
  end

  test "权限为2的投票" do
    setup_poll

    c = @p2.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    @p2.reload
    assert_equal @p2.comments_count, 1

    c = @p2.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    @p2.reload
    assert_equal @p2.comments_count, 2
    
    c = @p2.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    @p2.reload
    assert_equal @p2.comments_count, 3

    c = @p2.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    @p2.reload
    assert_equal @p2.comments_count, 4
  end

  test "删除投票的评论" do
    setup_poll

    c = @p1.comments.create(:poster_id => 4, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert c.is_deleteable_by?(@user4)

    c = @p1.comments.create(:poster_id => 3, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @p1.comments.create(:poster_id => 1, :recipient_id => 2, :content => '123123')
    assert c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)

    c = @p1.comments.create(:poster_id => 2, :recipient_id => 2, :content => '123123')
    assert !c.is_deleteable_by?(@user1)
    assert c.is_deleteable_by?(@user2)
    assert !c.is_deleteable_by?(@user3)
    assert !c.is_deleteable_by?(@user4)
  end

protected

  def setup_blog
    @b1 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 1})
    @b2 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 2})
    @b3 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 3})
    @b4 = Blog.create({:game_id => 1, :poster_id => 2, :draft => false, :title => 'blog title', :content => 'blog content', :privilege => 4})
  end

  def setup_video
    @v1 = Video.create({:game_id => 1, :poster_id => 2, :title => 't', :privilege => 1, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.htmli"})
    @v2 = Video.create({:game_id => 1, :poster_id => 2, :title => 't', :privilege => 2, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.htmli"}) 
    @v3 = Video.create({:game_id => 1, :poster_id => 2, :title => 't', :privilege => 3, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.htmli"}) 
    @v4 = Video.create({:game_id => 1, :poster_id => 2, :title => 't', :privilege => 4, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.htmli"}) 
  end

  def setup_status
    @s = Status.create({:poster_id => 2, :content => 'hello world'})
  end

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

  def setup_poll
    @p1 = Poll.create({:name => 'poll name', :game_id => 1, :poster_id => 2, :no_deadline => false, :deadline => 1.days.from_now.to_s(:db), :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}], :privilege => 1})
    @p2 = Poll.create({:name => 'poll name', :game_id => 1, :poster_id => 2, :no_deadline => false, :deadline => 1.days.from_now.to_s(:db), :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}], :privilege => 2})
  end

  def setup_profile
    @p = @user2.profile
  end

  def save_photo photo_type, opts={}
    path = 'public/images/default_guild.jpg' 
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    photo_type.constantize.create({:uploaded_data => ActionController::TestUploadedFile.new(path, mimetype)}.merge(opts))
  end

end
