require 'test_helper'

class User::VideosControllerTest < ActionController::TestCase

  def setup
    @user1 = User.find(1)
    @user2 = User.find(2)
    @user3 = User.find(3)
    @user4 = User.find(4)
    @video1 = Video.create({:game_id => 1, :poster_id => @user2.id, :title => 'video title', :privilege => 1, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.html", :digs_count => 1, :created_at => 1.days.ago})
    @video2 = Video.create({:game_id => 1, :poster_id => @user2.id, :title => 'video title', :privilege => 2, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.html", :digs_count => 2, :created_at => 2.days.ago})
    @video3 = Video.create({:game_id => 1, :poster_id => @user2.id, :title => 'video title', :privilege => 3, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.html", :digs_count => 3, :created_at => 3.days.ago})
    @video4 = Video.create({:game_id => 1, :poster_id => @user2.id, :title => 'video title', :privilege => 4, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.html", :digs_count => 4, :created_at => 4.days.ago})
    @params = {:game_id => 1, :title => 'video title', :privilege => 4, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.html"}
  end
  
  # 测试index
  test "自己观看" do
    get 'index', {:id => 2}, {:user_id => 2}

    # 返回 index 页面
    assert_template 'user/videos/index'

    # 共4个视频，时间顺序
    videos = assigns(:videos)
    assert_equal videos.count, 4
    assert_equal videos[0], @video1
    assert_equal videos[1], @video2
    assert_equal videos[2], @video3
    assert_equal videos[3], @video4
  
    # 可以编辑和删除
    edit_link_exist_for [@video1, @video2, @video3, @video4]
    delete_link_exist_for [@video1, @video2, @video3, @video4]
  end

  test "好友观看" do
    get 'index', {:id => 2}, {:user_id => 1}
    
    # 返回 index 页面
    assert_template 'user/videos/index'

    # 共3个视频，时间顺序
    videos = assigns(:videos)
    assert_equal videos.count, 3
    assert_equal videos[0], @video1
    assert_equal videos[1], @video2
    assert_equal videos[2], @video3
  
    # 不可以编辑和删除
    edit_link_not_exist_for [@video1, @video2, @video3, @video4]
    delete_link_not_exist_for [@video1, @video2, @video3, @video4]
  end

  test "非好友，但是有相同游戏的人观看" do
    get 'index', {:id => 2}, {:user_id => 3}
    redirect_to_new_friend
  end

  test "完全陌生人观看" do
    get 'index', {:id => 2}, {:user_id => 4}
    redirect_to_new_friend
  end

  # 测试show页面
  test "user1观看user2的视频" do
    get 'show', {:id => @video1.id}, {:user_id => 1}
    assert_template 'user/videos/show'
    assert_equal assigns(:video), @video1
    edit_link_not_exist_for [@video1]
    delete_link_not_exist_for [@video1]

    get 'show', {:id => @video2.id}
    assert_template 'user/videos/show'
    assert_equal assigns(:video), @video2
    edit_link_not_exist_for [@video2]
    delete_link_not_exist_for [@video2]

    get 'show', {:id => @video3.id}
    assert_template 'user/videos/show'
    assert_equal assigns(:video), @video3
    edit_link_not_exist_for [@video3]
    delete_link_not_exist_for [@video3]

    get 'show', {:id => @video4.id}
    assert_not_found
  end

  test "user2观看user2的视频" do
    get 'show', {:id => @video1.id}, {:user_id => 2}
    assert_template 'user/videos/show'
    assert_equal assigns(:video), @video1
    edit_link_exist_for [@video1]
    delete_link_exist_for [@video1]

    get 'show', {:id => @video2.id}
    assert_template 'user/videos/show'
    assert_equal assigns(:video), @video2
    edit_link_exist_for [@video2]
    delete_link_exist_for [@video2]

    get 'show', {:id => @video3.id}
    assert_template 'user/videos/show'
    assert_equal assigns(:video), @video3
    edit_link_exist_for [@video3]
    delete_link_exist_for [@video3]

    get 'show', {:id => @video4.id}
    assert_template 'user/videos/show'
    assert_equal assigns(:video), @video4
    edit_link_exist_for [@video4]
    delete_link_exist_for [@video4]
  end

  test "user3观看user2的视频" do
    get 'show', {:id => @video1.id}, {:user_id => 3}
    assert_template 'user/videos/show'
    assert_equal assigns(:video), @video1
    edit_link_not_exist_for [@video1]
    delete_link_not_exist_for [@video1]

    get 'show', {:id => @video2.id}
    assert_template 'user/videos/show'
    assert_equal assigns(:video), @video2
    edit_link_not_exist_for [@video2]
    delete_link_not_exist_for [@video2]

    get 'show', {:id => @video3.id}
    redirect_to_new_friend

    get 'show', {:id => @video4.id}
    assert_not_found
  end

  test "user4观看user2的视频" do
    get 'show', {:id => @video1.id}, {:user_id => 4}
    assert_template 'user/videos/show'
    assert_equal assigns(:video), @video1
    edit_link_not_exist_for [@video1]
    delete_link_not_exist_for [@video1]

    get 'show', {:id => @video2.id}
    redirect_to_new_friend

    get 'show', {:id => @video3.id}
    redirect_to_new_friend

    get 'show', {:id => @video4.id}
    assert_not_found
  end 

  # 测试create
  test "创建视频" do
    post 'create', {:video => @params}, {:user_id => 3}
    @user3.reload
    assert_equal @user3.videos_count, 1

    post 'create', {:video => @params.merge({:friend_tags => [1]})}
    @user3.reload
    video = assigns(:video)
    video.reload
    assert_equal @user3.videos_count, 2
    assert_equal video.tags_count, 1

    post 'create', {:video => @params.merge({:video_url => '123123'})}
    @user3.reload
    assert_equal @user3.videos_count, 2 
  end

  # 测试edit
  test "编辑自己的视频" do
    get 'edit', {:id => @video1.id}, {:user_id => 2}
    assert_template 'user/videos/edit'
  end

  test "编辑别人的视频" do
    get 'edit', {:id => @video1.id}, {:user_id => 3}
    assert_not_found
  end

  # 测试update
  test "更新自己的视频" do
    put 'update', {:id => @video1.id, :video => @params.merge({:title => 'changed'})}, {:user_id => 2}
    @video1.reload
    assert_redirected_to video_url(@video1)
    assert_equal @video1.title, 'changed'
    put 'update', {:id => @video1.id, :video => @params.merge({:title => nil})}
    @video1.reload
    assert_template 'user/videos/edit'
    assert_equal @video1.title, 'changed'
  end

  test "更新别人的视频" do
    put 'update', {:id => @video1.id, :video => @params.merge({:title => 'changed'})}, {:user_id => 3}
    assert_not_found
  end

  # 删除destroy
  test "删除自己的视频" do
    delete 'destroy', {:id => @video1.id}, {:user_id => 2}
    @user2.reload
    assert_equal @user2.videos_count, 3
  end

  test "删除别人的视频" do
    delete 'destroy', {:id => @video1.id}, {:user_id => 3}
    @user2.reload
    assert_equal @user2.videos_count, 4
  end
  
  # 测试hot, recent, friends 
  test "热门视频" do
    get 'hot', {:id => 1}, {:user_id => 1}
    
    assert_template 'user/videos/hot'
    
    videos = assigns(:videos)
    assert_equal videos.count, 3
    assert_equal videos[0], @video3
    assert_equal videos[1], @video2
    assert_equal videos[2], @video1
  end

  test "最新视频" do
    get 'recent', {:id => 1}, {:user_id => 1}
    
    assert_template 'user/videos/recent'
    
    videos = assigns(:videos)
    assert_equal videos.count, 3
    assert_equal videos[0], @video1
    assert_equal videos[1], @video2
    assert_equal videos[2], @video3
  end

  test "好友视频" do
    get 'friends', {}, {:user_id => 1}
    assert_template 'user/videos/friends'
    assert_equal assigns(:videos).count, 3
  end

  test "好友没有视频的时候，查看好友视频" do
    get 'friends', {}, {:user_id => 2}
    assert_template 'user/videos/friends'
    assert_equal assigns(:videos).count, 0
  end

protected

  def redirect_to_new_friend
    assert_redirected_to new_friend_url(:id => @user2.id)
  end

  def assert_not_found
    assert_template 'not_found'
  end

  def edit_link_exist_for videos
    videos.each do |video|
      assert_tag :tag => 'a', :attributes => {:href => edit_video_url(video)}
    end
  end

  def edit_link_not_exist_for videos
    videos.each do |video|
      assert_no_tag :tag => 'a', :attributes => {:href => edit_video_url(video)}
    end
  end

  def delete_link_exist_for videos
    videos.each do |video|
      assert_tag :tag => 'a', :attributes => {:href => video_url(video), :rel => 'facebox', :facebox_type => 'confirm', :facebox_method => 'delete'}
    end
  end

  def delete_link_not_exist_for videos
    videos.each do |video|
      assert_no_tag :tag => 'a', :attributes => {:href => video_url(video), :rel => 'facebox', :facebox_type => 'confirm', :facebox_method => 'delete'}
    end
  end

end
