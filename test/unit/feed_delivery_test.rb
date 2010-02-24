require 'test_helper'

class FeedDeliveryTest < ActiveSupport::TestCase

  def setup
    @user1 = User.find(1)
    @user2 = User.find(2)
    @user3 = User.find(3)
    @user4 = User.find(4)
    @g = Guild.create({:game_id => 1, :name => 'name', :description => 'description', :president_id => 1})
    @p = @user1.profile
    FeedItem.destroy_all
  end

  test "没有接收者" do
    f = FeedDelivery.create(:recipient_id => nil, :recipient_type => 'User')
    assert_equal f.errors.on_base, "没有接收者"

    f = FeedDelivery.create(:recipient_id => 1, :recipient_type => nil)
    assert_equal f.errors.on_base, "没有接收者"
  end

  test "接收者不存在" do
    f = FeedDelivery.create(:recipient_id => 1324, :recipient_type => 'User')
    assert_equal f.errors.on_base, "接收者不存在"
  end

  test "没有新鲜事类型" do
    f = FeedDelivery.create(:recipient_id => 1, :recipient_type => 'User', :item_type => nil)
    assert_equal f.errors.on_base, "没有新鲜事类型"
  end

  test "没有feed_item id" do
    f = FeedDelivery.create(:recipient_id => 1, :recipient_type => 'User', :item_type => 'Blog', :feed_item_id => nil)
    assert_equal f.errors.on_base, "没有feed_item id"
  end

  test "创建博客" do
    b1 = Blog.create({:game_id => 1, :poster_id => 1, :draft => false, :title => 't', :content => 'c', :privilege => 1})
    reload  
    assert_equal @g.blog_feed_deliveries.count, 1 
    assert_equal @user1.blog_feed_deliveries.count, 0
    assert_equal @user2.blog_feed_deliveries.count, 1
    assert_equal @user3.blog_feed_deliveries.count, 1
    assert_equal @user4.blog_feed_deliveries.count, 0

    b2 = Blog.create({:game_id => 1, :poster_id => 1, :draft => false, :title => 't', :content => 'c', :privilege => 4})
    reload  
    assert_equal @g.blog_feed_deliveries.count, 1 
    assert_equal @user1.blog_feed_deliveries.count, 0
    assert_equal @user2.blog_feed_deliveries.count, 1
    assert_equal @user3.blog_feed_deliveries.count, 1
    assert_equal @user4.blog_feed_deliveries.count, 0
  
    b2.update_attributes(:privilege => 2)
    reload
    assert_equal @g.blog_feed_deliveries.count, 2
    assert_equal @user1.blog_feed_deliveries.count, 0
    assert_equal @user2.blog_feed_deliveries.count, 2
    assert_equal @user3.blog_feed_deliveries.count, 2
    assert_equal @user4.blog_feed_deliveries.count, 0

    b2.update_attributes(:privilege => 4)
    reload
    assert_equal @g.blog_feed_deliveries.count, 1
    assert_equal @user1.blog_feed_deliveries.count, 0
    assert_equal @user2.blog_feed_deliveries.count, 1
    assert_equal @user3.blog_feed_deliveries.count, 1
    assert_equal @user4.blog_feed_deliveries.count, 0
  
    b1.destroy
    reload
    assert_equal @g.blog_feed_deliveries.count, 0
    assert_equal @user1.blog_feed_deliveries.count, 0
    assert_equal @user2.blog_feed_deliveries.count, 0
    assert_equal @user3.blog_feed_deliveries.count, 0
    assert_equal @user4.blog_feed_deliveries.count, 0
  
    b3 = Blog.create({:game_id => 1, :poster_id => 1, :draft => true, :title => 't', :content => 'c', :privilege => 4})
    reload
    assert_equal @g.blog_feed_deliveries.count, 0
    assert_equal @user1.blog_feed_deliveries.count, 0
    assert_equal @user2.blog_feed_deliveries.count, 0
    assert_equal @user3.blog_feed_deliveries.count, 0
    assert_equal @user4.blog_feed_deliveries.count, 0

    b3.update_attributes(:draft => false)
    reload
    assert_equal @g.blog_feed_deliveries.count, 0
    assert_equal @user1.blog_feed_deliveries.count, 0
    assert_equal @user2.blog_feed_deliveries.count, 0
    assert_equal @user3.blog_feed_deliveries.count, 0
    assert_equal @user4.blog_feed_deliveries.count, 0

    b4 = Blog.create({:game_id => 1, :poster_id => 1, :draft => true, :title => 't', :content => 'c', :privilege => 1})
    reload
    assert_equal @g.blog_feed_deliveries.count, 0
    assert_equal @user1.blog_feed_deliveries.count, 0
    assert_equal @user2.blog_feed_deliveries.count, 0
    assert_equal @user3.blog_feed_deliveries.count, 0
    assert_equal @user4.blog_feed_deliveries.count, 0

    b4.update_attributes(:draft => false)
    reload
    assert_equal @g.blog_feed_deliveries.count, 1
    assert_equal @user1.blog_feed_deliveries.count, 0
    assert_equal @user2.blog_feed_deliveries.count, 1
    assert_equal @user3.blog_feed_deliveries.count, 1
    assert_equal @user4.blog_feed_deliveries.count, 0
  end

  test "创建视频" do
    v1 = Video.create({:game_id => 1, :poster_id => 1, :title => 't', :privilege => 1, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.htmli"})
    reload   
    assert_equal @p.video_feed_deliveries.count, 1
    assert_equal @g.video_feed_deliveries.count, 1
    assert_equal @user1.video_feed_deliveries.count, 0
    assert_equal @user2.video_feed_deliveries.count, 1
    assert_equal @user3.video_feed_deliveries.count, 1
    assert_equal @user4.video_feed_deliveries.count, 0 
  
    v2 = Video.create({:game_id => 1, :poster_id => 1, :title => 't', :privilege => 4, :video_url => "http://v.youku.com/v_show/id_XMTE2OTE5ODA0.htmli"})
    reload   
    assert_equal @p.video_feed_deliveries.count, 1
    assert_equal @g.video_feed_deliveries.count, 1
    assert_equal @user1.video_feed_deliveries.count, 0
    assert_equal @user2.video_feed_deliveries.count, 1
    assert_equal @user3.video_feed_deliveries.count, 1
    assert_equal @user4.video_feed_deliveries.count, 0

    v2.update_attributes(:privilege => 2)
    reload
    assert_equal @p.video_feed_deliveries.count, 2
    assert_equal @g.video_feed_deliveries.count, 2
    assert_equal @user1.video_feed_deliveries.count, 0
    assert_equal @user2.video_feed_deliveries.count, 2
    assert_equal @user3.video_feed_deliveries.count, 2
    assert_equal @user4.video_feed_deliveries.count, 0

    v2.update_attributes(:privilege => 4)
    reload
    assert_equal @p.video_feed_deliveries.count, 1
    assert_equal @g.video_feed_deliveries.count, 1
    assert_equal @user1.video_feed_deliveries.count, 0
    assert_equal @user2.video_feed_deliveries.count, 1
    assert_equal @user3.video_feed_deliveries.count, 1
    assert_equal @user4.video_feed_deliveries.count, 0
  
    v1.destroy
    reload
    assert_equal @p.video_feed_deliveries.count, 0
    assert_equal @g.video_feed_deliveries.count, 0
    assert_equal @user1.video_feed_deliveries.count, 0
    assert_equal @user2.video_feed_deliveries.count, 0
    assert_equal @user3.video_feed_deliveries.count, 0
    assert_equal @user4.video_feed_deliveries.count, 0 
  end

  test "创建状态" do
    s = Status.create({:poster_id => 1, :content => 'hello world'})  
    reload
    assert_equal @user1.status_feed_deliveries.count, 0
    assert_equal @user2.status_feed_deliveries.count, 1
    assert_equal @user3.status_feed_deliveries.count, 1
    assert_equal @user4.status_feed_deliveries.count, 0
 
    s.destroy
    reload
    assert_equal @user1.status_feed_deliveries.count, 0
    assert_equal @user2.status_feed_deliveries.count, 0
    assert_equal @user3.status_feed_deliveries.count, 0
    assert_equal @user4.status_feed_deliveries.count, 0
  end

  test "上传照片到个人相册" do
    a1 = PersonalAlbum.create(:owner_id => 1, :game_id => 1, :title => 'album title', :description => 'description', :privilege => 1)
    p1 = save_photo 'PersonalPhoto', :album_id => a1.id
    p2 = save_photo 'PersonalPhoto', :album_id => a1.id
    a1.record_upload @user1, [p1, p2]
    reload
    assert_equal @g.personal_album_feed_deliveries.count, 1
    assert_equal @user1.personal_album_feed_deliveries.count, 0
    assert_equal @user2.personal_album_feed_deliveries.count, 1
    assert_equal @user3.personal_album_feed_deliveries.count, 1
    assert_equal @user4.personal_album_feed_deliveries.count, 0

    p1 = save_photo 'PersonalPhoto', :album_id => a1.id
    p2 = save_photo 'PersonalPhoto', :album_id => a1.id
    a1.record_upload @user1, [p1, p2]
    reload
    assert_equal @g.personal_album_feed_deliveries.count, 2
    assert_equal @user1.personal_album_feed_deliveries.count, 0
    assert_equal @user2.personal_album_feed_deliveries.count, 2
    assert_equal @user3.personal_album_feed_deliveries.count, 2
    assert_equal @user4.personal_album_feed_deliveries.count, 0

    a2 = PersonalAlbum.create(:owner_id => 1, :game_id => 1, :title => 'album title', :description => 'description', :privilege => 4)
    p1 = save_photo 'PersonalPhoto', :album_id => a2.id
    p2 = save_photo 'PersonalPhoto', :album_id => a2.id
    a2.record_upload @user1, [p1, p2]
    reload
    assert_equal @g.personal_album_feed_deliveries.count, 2
    assert_equal @user1.personal_album_feed_deliveries.count, 0
    assert_equal @user2.personal_album_feed_deliveries.count, 2
    assert_equal @user3.personal_album_feed_deliveries.count, 2
    assert_equal @user4.personal_album_feed_deliveries.count, 0

    a1.feed_items.first.destroy
    reload
    assert_equal @g.personal_album_feed_deliveries.count, 1
    assert_equal @user1.personal_album_feed_deliveries.count, 0
    assert_equal @user2.personal_album_feed_deliveries.count, 1
    assert_equal @user3.personal_album_feed_deliveries.count, 1
    assert_equal @user4.personal_album_feed_deliveries.count, 0
  end
 
  test "更改头像" do
    a = @user1.avatar_album
    p1 = save_photo 'Avatar', :album_id => a.id
    reload
    assert_equal @user1.avatar_feed_deliveries.count, 0
    assert_equal @user2.avatar_feed_deliveries.count, 1
    assert_equal @user3.avatar_feed_deliveries.count, 1
    assert_equal @user4.avatar_feed_deliveries.count, 0
  
    p1.feed_items.first.destroy
    reload
    assert_equal @user1.avatar_feed_deliveries.count, 0
    assert_equal @user2.avatar_feed_deliveries.count, 0
    assert_equal @user3.avatar_feed_deliveries.count, 0
    assert_equal @user4.avatar_feed_deliveries.count, 0
  end
 
  test "创建投票" do
    p = Poll.create({:name => 'poll name', :game_id => 1, :poster_id => 1, :no_deadline => false, :deadline => 3.days.from_now.to_s(:db), :answers => [{:description => 'answer1'}, {:description => 'answer2'}, {:description => 'answer3'}], :privilege => 1})
    reload   
    assert_equal @p.poll_feed_deliveries.count, 1
    assert_equal @g.poll_feed_deliveries.count, 1
    assert_equal @user1.poll_feed_deliveries.count, 0
    assert_equal @user2.poll_feed_deliveries.count, 1
    assert_equal @user3.poll_feed_deliveries.count, 1
    assert_equal @user4.poll_feed_deliveries.count, 0
  
    v1 = p.votes.create(:voter_id => 1, :answer_ids => [p.answers.first.id])
    reload
    assert_equal @p.vote_feed_deliveries.count, 1
    assert_equal @g.vote_feed_deliveries.count, 1
    assert_equal @user1.vote_feed_deliveries.count, 0
    assert_equal @user2.vote_feed_deliveries.count, 1
    assert_equal @user3.vote_feed_deliveries.count, 1
    assert_equal @user4.vote_feed_deliveries.count, 0

    v2 = p.votes.create(:voter_id => 2, :answer_ids => [p.answers.first.id])
    reload
    assert_equal Profile.find(2).vote_feed_deliveries.count, 1
    assert_equal @user1.vote_feed_deliveries.count, 1
    assert_equal @user2.vote_feed_deliveries.count, 1
    assert_equal @user3.vote_feed_deliveries.count, 1
    assert_equal @user4.vote_feed_deliveries.count, 0
  
    v2.destroy
    reload
    assert_equal Profile.find(2).vote_feed_deliveries.count, 0
    assert_equal @user1.vote_feed_deliveries.count, 0
    assert_equal @user2.vote_feed_deliveries.count, 1
    assert_equal @user3.vote_feed_deliveries.count, 1
    assert_equal @user4.vote_feed_deliveries.count, 0

    p.destroy
    reload
    assert_equal @p.poll_feed_deliveries.count, 0
    assert_equal @p.vote_feed_deliveries.count, 0
    assert_equal @g.vote_feed_deliveries.count, 0
    assert_equal @g.poll_feed_deliveries.count, 0
    assert_equal @user1.vote_feed_deliveries.count, 0
    assert_equal @user2.vote_feed_deliveries.count, 0
    assert_equal @user3.vote_feed_deliveries.count, 0
    assert_equal @user4.vote_feed_deliveries.count, 0
    assert_equal @user1.poll_feed_deliveries.count, 0
    assert_equal @user2.poll_feed_deliveries.count, 0
    assert_equal @user3.poll_feed_deliveries.count, 0
    assert_equal @user4.poll_feed_deliveries.count, 0
  end
 
  test "创建活动, 然后请求加入" do
    e = Event.create({:game_id => 1, :game_area_id => 1, :game_server_id => 1, :poster_id => 2, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'event description'})
    reload
    assert_equal Profile.find(2).event_feed_deliveries.count, 1
    assert_equal @user1.event_feed_deliveries.count, 1
    assert_equal @user2.event_feed_deliveries.count, 0
    assert_equal @user3.event_feed_deliveries.count, 0
    assert_equal @user4.event_feed_deliveries.count, 0
 
    e.participations.create(:participant_id => 1, :status => 1).destroy
    reload
    assert_equal @p.participation_feed_deliveries.count, 0
    assert_equal @g.participation_feed_deliveries.count, 0
    assert_equal @user1.participation_feed_deliveries.count, 0
    assert_equal @user2.participation_feed_deliveries.count, 0
    assert_equal @user3.participation_feed_deliveries.count, 0
    assert_equal @user4.participation_feed_deliveries.count, 0

    p1 = e.participations.create(:participant_id => 1, :status => 1).accept
    reload
    assert_equal @p.participation_feed_deliveries.count, 1
    assert_equal @g.participation_feed_deliveries.count, 1
    assert_equal @user1.participation_feed_deliveries.count, 0
    assert_equal @user2.participation_feed_deliveries.count, 1
    assert_equal @user3.participation_feed_deliveries.count, 1
    assert_equal @user4.participation_feed_deliveries.count, 0 

    e.destroy
    assert_equal @p.participation_feed_deliveries.count, 0
    assert_equal @g.participation_feed_deliveries.count, 0
    assert_equal @user1.participation_feed_deliveries.count, 0
    assert_equal @user2.participation_feed_deliveries.count, 0
    assert_equal @user3.participation_feed_deliveries.count, 0
    assert_equal @user4.participation_feed_deliveries.count, 0
    assert_equal Profile.find(2).event_feed_deliveries.count, 0
    assert_equal @user1.event_feed_deliveries.count, 0
    assert_equal @user2.event_feed_deliveries.count, 0
    assert_equal @user3.event_feed_deliveries.count, 0
    assert_equal @user4.event_feed_deliveries.count, 0 
  end

  test "创建活动, 然后邀请好友加入" do
    e = Event.create({:game_id => 1, :game_area_id => 1, :game_server_id => 1, :poster_id => 2, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'event description'})
    reload
    assert_equal Profile.find(2).event_feed_deliveries.count, 1
    assert_equal @user1.event_feed_deliveries.count, 1
    assert_equal @user2.event_feed_deliveries.count, 0
    assert_equal @user3.event_feed_deliveries.count, 0
    assert_equal @user4.event_feed_deliveries.count, 0

    e.participations.create(:participant_id => 1, :status => 0).update_attributes(:status => 4)
    reload
    assert_equal @p.participation_feed_deliveries.count, 1
    assert_equal @g.participation_feed_deliveries.count, 1
    assert_equal @user1.participation_feed_deliveries.count, 0
    assert_equal @user2.participation_feed_deliveries.count, 1
    assert_equal @user3.participation_feed_deliveries.count, 1
    assert_equal @user4.participation_feed_deliveries.count, 0
  
    e.destroy
    assert_equal @p.participation_feed_deliveries.count, 0
    assert_equal @g.participation_feed_deliveries.count, 0
    assert_equal @user1.participation_feed_deliveries.count, 0
    assert_equal @user2.participation_feed_deliveries.count, 0
    assert_equal @user3.participation_feed_deliveries.count, 0
    assert_equal @user4.participation_feed_deliveries.count, 0
    assert_equal Profile.find(2).event_feed_deliveries.count, 0
    assert_equal @user1.event_feed_deliveries.count, 0
    assert_equal @user2.event_feed_deliveries.count, 0
    assert_equal @user3.event_feed_deliveries.count, 0
    assert_equal @user4.event_feed_deliveries.count, 0
  end

  test "上传照片到活动相册" do
    e = Event.create({:game_id => 1, :game_area_id => 1, :game_server_id => 1, :poster_id => 2, :title => 'event title', :start_time => 2.days.from_now.to_s(:db), :end_time => 3.days.from_now.to_s(:db), :privilege => 1, :description => 'event description'})
    e.participations.create(:participant_id => 1, :status => 0).update_attributes(:status => 3)
    e.participations.create(:participant_id => 3, :status => 1).accept
    a = e.album
    p1 = save_photo 'EventPhoto', :poster_id => 1, :album_id => a.id
    p2 = save_photo 'EventPhoto', :poster_id => 1, :album_id => a.id
    a.record_upload @user1, [p1, p2]
    reload
    assert_equal @user1.event_album_feed_deliveries.count, 0
    assert_equal @user2.event_album_feed_deliveries.count, 1
    assert_equal @user3.event_album_feed_deliveries.count, 1
    assert_equal @user4.event_album_feed_deliveries.count, 0
  
    e.destroy
    assert_equal @user1.event_album_feed_deliveries.count, 0
    assert_equal @user2.event_album_feed_deliveries.count, 0
    assert_equal @user3.event_album_feed_deliveries.count, 0
    assert_equal @user4.event_album_feed_deliveries.count, 0
  end

  test "创建工会，然后请求加入" do
    g = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => 1})
    reload
    assert_equal @p.guild_feed_deliveries.count, 1
    assert_equal @user1.guild_feed_deliveries.count, 0
    assert_equal @user2.guild_feed_deliveries.count, 1
    assert_equal @user3.guild_feed_deliveries.count, 1     
    assert_equal @user4.guild_feed_deliveries.count, 0
  
    g.memberships.create(:user_id => 2, :status => 1).destroy
    reload
    assert_equal @p.membership_feed_deliveries.count, 0
    assert_equal Profile.find(2).membership_feed_deliveries.count, 0
    assert_equal @user1.membership_feed_deliveries.count, 0
    assert_equal @user2.membership_feed_deliveries.count, 0
    assert_equal @user3.membership_feed_deliveries.count, 0
    assert_equal @user4.membership_feed_deliveries.count, 0

    m = g.memberships.create(:user_id => 2, :status => 1)
    m.accept_request
    reload
    assert_equal @p.membership_feed_deliveries.count, 0
    assert_equal Profile.find(2).membership_feed_deliveries.count, 1
    assert_equal @user1.membership_feed_deliveries.count, 1
    assert_equal @user2.membership_feed_deliveries.count, 0
    assert_equal @user3.membership_feed_deliveries.count, 0
    assert_equal @user4.membership_feed_deliveries.count, 0

    m.destroy
    reload
    assert_equal @p.membership_feed_deliveries.count, 0
    assert_equal Profile.find(2).membership_feed_deliveries.count, 0
    assert_equal @user1.membership_feed_deliveries.count, 0
    assert_equal @user2.membership_feed_deliveries.count, 0
    assert_equal @user3.membership_feed_deliveries.count, 0
    assert_equal @user4.membership_feed_deliveries.count, 0
  end
 
  test "创建工会，然后邀请好友加入" do
    g = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => 1})
    reload                   
    assert_equal @p.guild_feed_deliveries.count, 1
    assert_equal @user1.guild_feed_deliveries.count, 0
    assert_equal @user2.guild_feed_deliveries.count, 1
    assert_equal @user3.guild_feed_deliveries.count, 1
    assert_equal @user4.guild_feed_deliveries.count, 0
  
    g.memberships.create(:user_id => 2, :status => 0).destroy 
    reload
    assert_equal @p.membership_feed_deliveries.count, 0
    assert_equal Profile.find(2).membership_feed_deliveries.count, 0
    assert_equal @user1.membership_feed_deliveries.count, 0
    assert_equal @user2.membership_feed_deliveries.count, 0
    assert_equal @user3.membership_feed_deliveries.count, 0
    assert_equal @user4.membership_feed_deliveries.count, 0
    
    m = g.memberships.create(:user_id => 2, :status => 0)
    m.accept_invitation
    reload
    assert_equal @p.membership_feed_deliveries.count, 0
    assert_equal Profile.find(2).membership_feed_deliveries.count, 1
    assert_equal @user1.membership_feed_deliveries.count, 1
    assert_equal @user2.membership_feed_deliveries.count, 0
    assert_equal @user3.membership_feed_deliveries.count, 0
    assert_equal @user4.membership_feed_deliveries.count, 0
    
    m.destroy
    reload
    assert_equal @p.membership_feed_deliveries.count, 0
    assert_equal Profile.find(2).membership_feed_deliveries.count, 0
    assert_equal @user1.membership_feed_deliveries.count, 0
    assert_equal @user2.membership_feed_deliveries.count, 0
    assert_equal @user3.membership_feed_deliveries.count, 0
    assert_equal @user4.membership_feed_deliveries.count, 0
  end

  test "上传照片到工会相册" do
    g = Guild.create({:game_id => 1, :name => 'guild name', :description => 'guild description', :president_id => 1}) 
    g.memberships.create(:user_id => 2, :status => 0).accept_invitation
    g.memberships.create(:user_id => 4, :status => 1).accept_request
    a = g.album
    p1 = save_photo 'EventPhoto', :album_id => a.id
    p2 = save_photo 'EventPhoto', :album_id => a.id
    a.record_upload @user1, [p1, p2]
    reload
    assert_equal @user1.guild_album_feed_deliveries.count, 0
    assert_equal @user2.guild_album_feed_deliveries.count, 1
    assert_equal @user3.guild_album_feed_deliveries.count, 0
    assert_equal @user4.guild_album_feed_deliveries.count, 1
  end

protected

  def reload
    @user1.reload
    @user2.reload
    @user3.reload
    @user4.reload
    @g.reload
    @p.reload
  end

  def save_photo photo_type, opts={}
    path = 'public/images/default_guild.jpg'
    mimetype = `file -ib #{path}`.gsub(/\n/,"")
    photo_type.constantize.create({:uploaded_data => ActionController::TestUploadedFile.new(path, mimetype)}.merge(opts))
  end


end
