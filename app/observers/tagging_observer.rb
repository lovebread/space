class TaggingObserver < ActiveRecord::Observer

  def before_create tagging
    # 为什么写在这，因为我想比较容易的做到当tagging创建不成功的时候，tag也不会创建
    tag = Tag.find_or_create :name => tagging.tag_name, :taggable_type => tagging.taggable_type
    tagging.tag_id = tag.id
   
    # 删除已经有的tagging
    old_tagging = tagging.taggable.taggings.find_by_poster_id(tagging.poster_id)
    old_tagging.destroy unless old_tagging.blank?
  end

  def after_create tagging
    # increment counter
    tagging.tag.raw_increment :taggings_count

    # send notification if it's profile tag
    if tagging.taggable_type == 'Profile'
      profile = tagging.taggable
      profile.user.notifications.create(
        :category => Notification::FriendTag,
        :data => "#{profile_link tagging.poster} 对你的印象是: #{tagging.tag.name}")
    end
  end

  def after_destroy tagging
    tagging.tag.raw_decrement :taggings_count
  end

end
