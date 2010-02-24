class FriendTagObserver < ActiveRecord::Observer

  def after_create tag
    # increment counter
    tag.taggable.raw_increment :tags_count
  
    # issue notices and emails if necessary
    eval("after_#{tag.taggable_type.underscore}_tag_save(tag)")
  end

  def after_blog_tag_save tag
    blog = tag.taggable

    return if blog.draft
    return if blog.privilege == 4 # return if this blog is only open for owner
    
    if blog.poster != tag.tagged_user
      tag.notices.create(:user_id => tag.tagged_user_id)
      TagMailer.deliver_blog_tag tag if tag.tagged_user.mail_setting.tag_me_in_blog
    end
  end

  def after_video_tag_save tag
    video = tag.taggable

    return if video.privilege == 4 # return if this video is only open for owner
    
    if video.poster != tag.tagged_user
      tag.notices.create(:user_id => tag.tagged_user_id) 
      TagMailer.deliver_video_tag tag if tag.tagged_user.mail_setting.tag_me_in_video
    end
  end

  def after_destroy tag
    tag.taggable.raw_decrement :tags_count
  end

end
