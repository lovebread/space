class Profile < ActiveRecord::Base

  belongs_to :user

	belongs_to :region

	belongs_to :city

	belongs_to :district

  acts_as_viewable :create_conditions => lambda {|user, profile| profile.user != user}

  acts_as_shareable
  
  acts_as_feed_recipient :delete_conditions => lambda {|user, profile| profile.user == user},
                         :categories => {
														:status => 'Status',
                            :video => 'Video',
                            :poll => 'Poll',
                            :vote => 'Vote',
                            :event => 'Event',
                            :participation => 'Participation',
                            :guild => 'Guild',
                            :membership => 'Membership',
														:friendship => 'Friendship'
													}

	acts_as_resource_feeds

  acts_as_taggable :delete_conditions => lambda {|profile, user| profile.user == user},
                   :create_conditions => lambda {|tagging, profile, user| (tagging.nil? || tagging.created_at < 10.days.ago) and (profile.user.has_friend? user)}

  acts_as_commentable :order => 'created_at DESC',
                      :delete_conditions => lambda {|user, profile, comment| profile.user == user}, 
                      :create_conditions => lambda {|user, profile| profile.user == user || profile.user.has_friend?(user) || profile.user.privacy_setting.leave_wall_message == 1},
                      :view_conditions => lambda {|user, profile| profile.user == user || profiler.user.has_friend?(user) || profile.user.privacy_setting.wall == 1}  

  acts_as_feed_recipient :delete_conditions => lambda {|user, profile| profile.user == user},
                         :categories => {
                            :video => 'Video',
                            :poll => 'Poll',
                            :vote => 'Vote',
                            :event => 'Event',
                            :participation => 'Participation',
                            :guild => 'Guild',
                            :membership => 'Membership',
                            :sharing => 'Sharing'
                          } 

  def viewable_by viewer
    privilege = user.privacy_setting.personal
    user == viewer || privilege == 1 || user.has_friend?(viewer) || (privilege == 2 and user.has_same_game_with?(current_user))
  end

  def basic_info_changed?
    login_changed? || gender_changed? || region_id_changed? || city_id_changed? || district_id_changed? || birthday_changed?
  end

  def contact_info_changed?
    qq_changed? || phone_changed? || website_changed?
  end

  after_save :save_characters

  def new_characters= character_attrs
    @new_characters_attrs = character_attrs
  end

  def existing_characters= character_attrs
    @existing_characters_attrs = character_attrs
  end  

  def del_characters= character_ids
    @del_characters_ids = character_ids
  end 

  def save_characters
    unless @new_characters_attrs.blank?
      @new_characters_attrs.each_value do |attrs|
        user.characters.create(attrs)
      end
    end
    @new_characters_attrs = nil
    unless @existing_characters_attrs.blank?
      @existing_characters_attrs.each do |id, attrs|
        user.characters.find(id).update_attributes(attrs)
      end
    end
    @existing_characters_attrs = nil
    # 我对这个很不满意，为了敷衍编辑档案那里，但是招不到更好的办法了   
    unless @del_characters_ids.blank?
      @del_characters_ids.each do |id|
        user.characters.find(id).destroy
      end
    end
    @del_characters_ids = nil
  end
  
  attr_readonly :user_id

  def validate_on_update
    # check login
    if login.blank?
      errors.add_to_base("昵称不能为空")
      return
    elsif login.length < 4 or login.length > 16
      errors.add_to_base("昵称长度不对")
      return
    elsif /^\d/.match(login)
      errors.add_to_base("昵称不能以数字开头")
      return
      # TODO: how to validate chinese characters
    end

    # check gender
    if gender.blank?
      errors.add_to_base("性别为空")
      return
    elsif gender != 'male' and gender != 'female'
      errors.add_to_base("未知的性别")
      return
    end

    # check birthday
    unless birthday.blank?
      if birthday > Time.now
        errors.add_to_base("生日比今天还晚")
        return
      elsif birthday < 40.years.ago
        errors.add_to_base("你这么老了阿")
        return
      end
    end
    
    # check region, city, district
    if region_id.blank?
      if !city_id.blank? or !district_id.blank?
        errors.add_to_base("没有省份")
        return
      end
    else
      if city_id.blank?
        if !district_id.blank?
          errors.add_to_base("没有城市")
          return
        end
      else
        if City.find(:first, :conditions => {:region_id => region_id, :id => city_id}).blank? 
          errors.add_to_base("城市不存在")
          return
        elsif !district_id.blank? and District.find(:first, :conditions => {:city_id => city_id, :id => district_id}).blank?
          errors.add_to_base("地区不存在")
          return
        end
      end
    end
    
    # check qq
    unless qq.blank?
      if !/\d+/.match(qq)   
        errors.add_to_base("qq只能是数字") 
        return
      elsif qq.length < 4 or qq.length > 15
        errors.add_to_base("qq号码长度不对")
        return
      end
    end

    # check phone
    unless phone.blank?
      if !/\d+/.match(phone)
        errors.add_to_base("电话只能是数字")
        return
      elsif phone.length < 8 or phone.length > 15
        errors.add_to_base("电话长度不对")
        return
      end
    end
  
    # check website
    unless website.blank?
      # TODO: 这个regular expression貌似不够强大，不能把adsfadsf视为非法的url
      unless website =~ /^((https?:\/\/)?)(([a-zA-Z0-9_-])+(\.)?)*(:\d+)?(\/((\.)?(\?)?=?&?[a-zA-Z0-9_-](\?)?)*)*$/
        errors.add_to_base("非法的url")
        return
      end 
    end

  end

end

