class TagMailer < ActionMailer::Base

  def blog_tag(tag)
    setup_email	tag
		subject			"Dayday3 - #{tag.poster.login}在博客里标记了你"
		body				:user => tag.tagged_user, :url => "#{SITE_URL}/blogs/#{tag.taggable_id}"
  end

  def video_tag(tag)
		setup_email tag
    subject     "Dayday3 - #{tag.poster.login}在视频里标记了你"
    body        :user => tag.tagged_user, :url => "#{SITE_URL}/videos/#{tag.taggable_id}"
	end

  def photo_tag(tag)
		setup_email tag
    subject     "Dayday3 - #{tag.poster.login}在相册里标记了你"
    body        :user => tag.tagged_user, :url => "#{SITE_URL}/#{tag.photo.class.to_s.underscore.pluralize}/#{tag.photo_id}"
  end

  def photo_tag_to_owner(tag)
	  setup_email tag
    subject     "Dayday3 - #{tag.poster.login}标记了你的相册"
    body        :user => tag.tagged_user, :url => "#{SITE_URL}/#{tag.photo.class.to_s.underscore.pluralize}/#{tag.photo_id}"
	end

protected

  def setup_email(tag)
		recipients	tag.tagged_user.email
		from				SITE_MAIL
		sent_on			Time.now
  end

end
