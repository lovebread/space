require 'test_helper'

class User::ProfilesControllerTest < ActionController::TestCase

  test "查看自己的个人主页" do
    p = Profile.find(2)
    u = User.find(2)

    get 'show', {:id => 2}, {:user_id => 2}
    assert_equal assigns(:profile), p 
    assert_template 'user/profiles/show'

    edit_profile_link_exist p 
    assert_tag_head p, u
    wall_repliable p, u
    wall_viewable p, u
  end

  test "查看好友的个人主页" do
    p = Profile.find(2)
    u = User.find(1)

    get 'show', {:id => 2}, {:user_id => 1}
    assert_equal assigns(:profile), p
    assert_template 'user/profiles/show'

    edit_profile_link_not_exist p
    assert_tag_head p, u
    wall_repliable p, u
    wall_viewable p, u
  end

  test "查看相同游戏者的个人主页" do
    p = Profile.find(2)
    u = User.find(3)

    get 'show', {:id => 2}, {:user_id => 3}
    assert_equal assigns(:profile), p
    assert_template 'user/profiles/show'

    edit_profile_link_not_exist p
    assert_tag_head p, u
    wall_not_repliable p, u
    wall_viewable p, u
  end

  test "查看陌生人的个人主页" do
    get 'show', {:id => 2}, {:user_id => 4}
    assert_redirected_to new_friend_url(:id => 2)
  end

  test "编辑自己的档案" do
    p = Profile.find(2)
    u = User.find(2)

    get 'edit', {:id => 2}, {:user_id => 2}

    edit_basic_link_exist p
    edit_contact_link_exist p
    edit_character_link_exist u
    basic_info_viewable p, u
    email_viewable p, u
    qq_viewable p, u
    phone_viewable p, u
    website_viewable p, u 
  end

  test "编辑好友的档案" do
    p = Profile.find(2)
    u = User.find(1)

    get 'edit', {:id => 2}, {:user_id => 1}

    edit_basic_link_not_exist p
    edit_contact_link_not_exist p
    edit_character_link_not_exist u
    basic_info_viewable p, u
    email_viewable p, u
    qq_viewable p, u
    phone_viewable p, u
    website_viewable p, u 
  end

  test "编辑相同游戏的档案" do
    p = Profile.find(2)
    u = User.find(3)

    get 'edit', {:id => 2}, {:user_id => 3}

    edit_basic_link_not_exist p
    edit_contact_link_not_exist p
    edit_character_link_not_exist u
    basic_info_viewable p, u
    email_not_viewable p, u
    qq_not_viewable p, u
    phone_not_viewable p, u
    website_not_viewable p, u
  end

  test "编辑陌生人的档案" do
    get 'edit', {:id => 2}, {:user_id => 4}
    assert_redirected_to new_friend_url(:id => 2)
  end

  test "更新自己的基本信息" do
    put 'update', {:profile => {:login => 'a123'}, :id => 2}, {:user_id => 2}
    assert_equal Profile.find(2).login, 'a123'
  end

  test "更新别人的基本信息" do
    put 'update', {:profile => {:login => 'a123'}, :id => 2}, {:user_id => 3}
    assert_template 'not_found'
  end

  test "更新自己的联系信息" do
    put 'update', {:profile => {:phone => '123123123'}, :id => 2}, {:user_id => 2}
    puts "error: #{assigns(:profile).errors.on_base}"
    assert_equal Profile.find(2).phone, '123123123'
  end

  test "更新别人的联系信息" do
    put 'update', {:profile => {:phone => '123123123'}, :id => 2}, {:user_id => 3}
    assert_template 'not_found'
  end

protected

  def edit_basic_link_exist p
    assert_tag :tag => 'a', :attributes => {:onclick => /Iyxzone.Profile.Editor.editBasicInfo\(#{p.id}\)/}
  end

  def edit_basic_link_not_exist p
    assert_no_tag :tag => 'a', :attributes => {:onclick => /Iyxzone.Profile.Editor.editBasicInfo\(#{p.id}\)/}
  end

  def edit_contact_link_exist p
    assert_tag :tag => 'a', :attributes => {:onclick => /Iyxzone.Profile.Editor.editContactInfo\(#{p.id}\)/}
  end

  def edit_contact_link_not_exist p
    assert_no_tag :tag => 'a', :attributes => {:onclick => /Iyxzone.Profile.Editor.editContactInfo\(#{p.id}\)/}
  end

  def edit_character_link_exist u
    assert_tag :tag => 'a', :attributes => {:onclick => /Iyxzone.Profile.Editor.newCharacterInfo\(\)/}
    u.characters.each do |c|
      assert_tag :tag => 'a', :attributes => {:onclick => /Iyxzone.Profile.Editor.editCharacterInfo\(#{c.id}\)/}
    end
  end

  def edit_character_link_not_exist u
    assert_no_tag :tag => 'a', :attributes => {:onclick => /Iyxzone.Profile.Editor.newCharacterInfo\(\)/}
    u.characters.each do |c|
      assert_no_tag :tag => 'a', :attributes => {:onclick => /Iyxzone.Profile.Editor.editCharacterInfo\(#{c.id}\)/}
    end
  end

  def basic_info_viewable p, u
    assert (p.user == u || p.user.has_friend?(u) || p.user.privacy_setting.basic_info == 1 || (p.user.privacy_setting.basic_info == 2 and p.user.has_same_game_with?(u)))
  end

  def qq_viewable p, u
    assert (p.user == u || p.user.has_friend?(u) || p.user.privacy_setting.qq == 1 || (p.user.privacy_setting.qq == 2 and p.user.has_same_game_with?(u)))
  end

  def email_viewable p, u
    assert (p.user == u || p.user.has_friend?(u) || p.user.privacy_setting.email == 1 || (p.user.privacy_setting.email == 2 and p.user.has_same_game_with?(u)))
  end

  def phone_viewable p, u
    assert (p.user == u || p.user.has_friend?(u) || p.user.privacy_setting.phone == 1 || (p.user.privacy_setting.phone == 2 and p.user.has_same_game_with?(u)))
  end

  def website_viewable p, u
    assert (p.user == u || p.user.has_friend?(u) || p.user.privacy_setting.wall == 1 || (p.user.privacy_setting.wall == 2 and p.user.has_same_game_with?(u)))
  end

  def basic_info_not_viewable p, u
    assert !(p.user == u || p.user.has_friend?(u) || p.user.privacy_setting.basic_info == 1 || (p.user.privacy_setting.basic_info == 2 and p.user.has_same_game_with?(u)))
  end

  def qq_not_viewable p, u
    assert !(p.user == u || p.user.has_friend?(u) || p.user.privacy_setting.qq == 1 || (p.user.privacy_setting.qq == 2 and p.user.has_same_game_with?(u)))
  end
  
  def email_not_viewable p, u
    assert !(p.user == u || p.user.has_friend?(u) || p.user.privacy_setting.email == 1 || (p.user.privacy_setting.email == 2 and p.user.has_same_game_with?(u)))
  end

  def phone_not_viewable p, u
    assert !(p.user == u || p.user.has_friend?(u) || p.user.privacy_setting.phone == 1 || (p.user.privacy_setting.phone == 2 and p.user.has_same_game_with?(u))) 
  end

  def website_not_viewable p, u
    assert !(p.user == u || p.user.has_friend?(u) || p.user.privacy_setting.website == 1 || (p.user.privacy_setting.website == 2 and p.user.has_same_game_with?(u)))
  end

  def edit_profile_link_exist p
    assert_tag :tag => 'a', :attributes => {:href => edit_profile_url(p)}
  end

  def edit_profile_link_not_exist p
    assert_tag :tag => 'a', :attributes => {:href => edit_profile_url(p)}
  end

  def assert_tag_head p, u
    if p.user == u
      assert_tag :tag => 'b', :content => "大家对你的印象是"
    elsif p.is_taggable_by? u
      assert_tag :tag => 'b', :content => "你对TA的印象是"
    else
      assert_tag :tag => 'b', :content => "好友印象"
    end
  end

  def wall_repliable p, u
    p.user == u || p.user.has_friend?(u) || p.user.privacy_setting.leave_wall_message == 1
  end

  def wall_not_repliable p, u
    !wall_repliable(p,u)
  end

  def wall_viewable p, u
    p.user == u || p.user.has_friend?(u) || p.user.privacy_setting.wall == 1 || (p.user.privacy_setting.wall == 2 and p.user.has_same_game_with?(u))
  end

  def wall_not_viewable p, u
    !wall_viewable(p, u)
  end

end
