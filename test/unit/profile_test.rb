require 'test_helper'

class ProfileTest < ActiveSupport::TestCase

  def setup
    @user = User.find(1)
    @profile = @user.profile
  end

  # 创建user的时候，profile的login和gender被自动赋值 
  test "初始状态" do
    user = User.new
    user.login = '高下红'
    user.password = '111111'
    user.password_confirmation = '111111'
    user.email = 'gaoxh05@gmail.com'
    user.gender = 'male'
    user.save(false)
    user.activate
    user.reload
    profile = user.profile
    assert_equal user.login, profile.login
    assert_equal user.gender, profile.gender
  end

  # 测试 validate
  test "昵称不对" do
    @profile.update_attributes :login => nil
    assert_equal @profile.errors.on_base, "昵称不能为空"

    @profile.update_attributes :login => 'aa'
    assert_equal @profile.errors.on_base, "昵称长度不对"

    @profile.update_attributes :login => 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
    assert_equal @profile.errors.on_base, "昵称长度不对"

    @profile.update_attributes :login => '123abcd'
    assert_equal @profile.errors.on_base, "昵称不能以数字开头" 
  
    # TODO: 如何检测中文
  end

  test "生日不对" do
    @profile.update_attributes :birthday => 40.years.ago.to_s(:db)
    assert_equal @profile.errors.on_base, "你这么老了阿"

    @profile.update_attributes :birthday => 1.day.from_now.to_s(:db)
    assert_equal @profile.errors.on_base, "生日比今天还晚"
  end

  test "地址不对" do
    @profile.update_attributes :city_id => 1
    assert_equal @profile.errors.on_base, "没有省份"

    @profile.update_attributes :region_id => 1, :city_id => nil, :district_id => 1
    assert_equal @profile.errors.on_base, "没有城市"

    @profile.update_attributes :region_id => 1, :city_id => 1000
    assert_equal @profile.errors.on_base, "城市不存在"

    @profile.update_attributes :region_id => 1, :city_id => 1, :district_id => 10000
    assert_equal @profile.errors.on_base, "地区不存在"    
  end

  test "性别不对" do
    @profile.update_attributes :gender => nil
    assert_equal @profile.errors.on_base, "性别为空"

    @profile.update_attributes :gender => 'adsf'
    assert_equal @profile.errors.on_base, "未知的性别"
  end

  test "qq不对" do
    @profile.update_attributes :qq => 'asdfdsa'
    assert_equal @profile.errors.on_base, "qq只能是数字"
    
    @profile.update_attributes :qq => '123'
    assert_equal @profile.errors.on_base, "qq号码长度不对"

    @profile.update_attributes :qq => '123123123123123123'
    assert_equal @profile.errors.on_base, "qq号码长度不对"
  end

  test "电话不对" do
    @profile.update_attributes :phone => 'asdfdsa'
    assert_equal @profile.errors.on_base, "电话只能是数字"

    @profile.update_attributes :phone => '123'
    assert_equal @profile.errors.on_base, "电话长度不对"

    @profile.update_attributes :phone => '123123123123123123'
    assert_equal @profile.errors.on_base, "电话长度不对"
  end

  test "网址不对" do
    @profile.update_attributes :website => '@#$%^&'
    assert_equal @profile.errors.on_base, "非法的url"
  end

  # 测试 更新基本信息
  test "更新昵称" do
    @profile.update_attributes :login => 'new_name'
    @user.reload
    assert_equal @profile.login, 'new_name'
    assert_equal @user.login, 'new_name'
    assert_equal User.find(2).profile_feed_items.count, 1
    assert_equal User.find(3).profile_feed_items.count, 1
  end

  test "更新性别" do
    @profile.update_attributes :gender => 'female'
    @user.reload
    assert_equal @profile.gender, 'female'
    assert_equal @user.gender, 'female'
    assert_equal User.find(2).profile_feed_items.count, 1
    assert_equal User.find(3).profile_feed_items.count, 1
  end

  test "更新生日" do
    @profile.update_attributes :birthday => 1.months.ago.to_s(:db)
    #assert_equal @profile.birthday, 1.months.ago
    assert_equal User.find(2).profile_feed_items.count, 1
    assert_equal User.find(3).profile_feed_items.count, 1
  end

  test "更新地址" do
    @profile.update_attributes :region_id => 1
    assert_equal @profile.region_id, 1
    assert_equal User.find(2).profile_feed_items.count, 1
    assert_equal User.find(3).profile_feed_items.count, 1
  end

  # 测试 更新联系信息
  test "qq" do
    @profile.update_attributes :qq => '372163074'
    assert_equal @profile.qq, '372163074'
    assert_equal User.find(2).profile_feed_items.count, 1
    assert_equal User.find(3).profile_feed_items.count, 1
  end

  test "mobile" do
    @profile.update_attributes :phone => '15021113626'
    assert_equal @profile.phone, '15021113626'
    assert_equal User.find(2).profile_feed_items.count, 1
    assert_equal User.find(3).profile_feed_items.count, 1
  end

  test "website" do
    @profile.update_attributes :website => 'www.baidu.com'
    assert_equal @profile.website, 'www.baidu.com'
    assert_equal User.find(2).profile_feed_items.count, 1
    assert_equal User.find(3).profile_feed_items.count, 1
  end 

end
