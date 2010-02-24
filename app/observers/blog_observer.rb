class BlogObserver < ActiveRecord::Observer

  def field blog
    blog.draft ? 'drafts_count' : 'blogs_count'
  end

  def after_create blog
    # update counter
    blog.poster.raw_increment field(blog)
	
    # issue feeds
    return if blog.draft
    return unless blog.poster.application_setting.emit_blog_feed
    return if blog.privilege == 4 # only for myself

    recipients = [].concat blog.poster.guilds
    recipients.concat blog.poster.friends.find_all{|f| f.application_setting.recv_blog_feed}
    blog.deliver_feeds :recipients => recipients
  end

  def after_update blog
    # update counter if necessary
		if blog.draft_was and !blog.draft
			blog.poster.raw_increment :blogs_count
			blog.poster.raw_decrement :drafts_count
		end

    # issue feeds if necessary
    return if blog.draft

    if (blog.draft_was and blog.privilege != 4) or (blog.privilege_was == 4 and blog.privilege != 4)
      return unless blog.poster.application_setting.emit_blog_feed
      recipients = [].concat blog.poster.guilds
      recipients.concat blog.poster.friends.find_all{|f| f.application_setting.recv_blog_feed}
      blog.deliver_feeds :recipients => recipients
    else
      blog.destroy_feeds if blog.privilege == 4 and blog.privilege_was != 4
    end 
  end

	def after_destroy blog
    blog.poster.raw_decrement field(blog)
	end
	
end
