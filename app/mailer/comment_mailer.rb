class CommentMailer < ActionMailer::Base

  def blog_comment(comment, user)
    setup_email user
    subject			"Dayday3 - #{comment.poster.login}在博客#{comment.commentable.title}发表评论"
		body				:user => user, :url => "#{SITE_URL}/blogs/#{comment.commentable_id}"
  end

  def blog_comment_to_tagged_user(comment, user)
    setup_email user
		subject     "Dayday3 - #{comment.poster.login}在和你相关的博客#{comment.commentable.title}发表评论"
    body        :user => user, :url => "#{SITE_URL}/blogs/#{comment.commentable_id}"
	end

  def video_comment(comment,user)
    setup_email user
		subject     "Dayday3 - #{comment.poster.login}在视频#{comment.commentable.title}发表评论"
    body        :user => user, :url => "#{SITE_URL}/videos/#{comment.commentable_id}"
	end

  def video_comment_to_tagged_user(comment, user)
    setup_email user
		subject     "Dayday3 - #{comment.poster.login}在和你相关的视频#{comment.commentable.title}发表评论"
    body        :user => user, :url => "#{SITE_URL}/videos/#{comment.commentable_id}"
	end

  def photo_comment(comment,user)
    setup_email user
		subject     "Dayday3 - #{comment.poster.login}在相册#{comment.commentable.album.title}发表评论"
    body        :user => user, :url => "#{SITE_URL}/#{comment.commentable.class.to_s.underscore}s/#{comment.commentable_id}"
	end

  def photo_comment_to_tagged_user(comment, user)
    setup_email user
		subject     "Dayday3 - #{comment.poster.login}在你被标记的图片里发表评论"
    body        :user => user, :url => "#{SITE_URL}/#{comment.commentable.class.to_s.underscore}s/#{comment.commentable_id}"
	end

	def album_comment(comment, user)
		setup_email user
		subject			"Dayday3 - #{comment.poster.login}在相册#{comment.commentable.title}发表评论"
		body				:user => user, :url => "#{SITE_URL}/#{comment.commentable.class.to_s.underscore}s/#{comment.commentable_id}"
	end

  def status_comment(comment,user)
    setup_email user
		subject     "Dayday3 - #{comment.poster.login}在你的状态里留言了"
    body        :user => user, :url => "#{SITE_URL}/statuses"
	end

  def poll_comment(comment,user)
    setup_email user
		subject     "Dayday3 - #{comment.poster.login}在投票#{comment.commentable.name}发表评论"
    body        :user => user, :url => "#{SITE_URL}/polls/#{comment.commentable_id}"
	end

	def event_comment(comment,user)
    setup_email user
		subject     "Dayday3 - #{comment.poster.login}在活动#{comment.commentable.title}留言了"
    body        :user => user, :url => "#{SITE_URL}/events/#{comment.commentable_id}/comments"
	end

	def guild_comment(comment,user)
    setup_email user
		subject     "Dayday3 - #{comment.poster.login}在工会#{comment.commentable.name}留言了"
    body        :user => user, :url => "#{SITE_URL}/guilds/#{comment.commentable_id}/comments"
	end

	def profile_comment(comment,user)
		setup_email	user
		subject			"Dayday3 - #{comment.poster.login}在你的留言版上留言了"
		body				:user => user, :url => "#{SITE_URL}/profiles/#{comment.commentable_id}/comments"
	end

  def game_comment(comment,user)
    setup_email user
    subject     "Dayday3 - #{comment.poster.login}在游戏#{comment.commentable.name}的留言版上留言了"
    body        :user => user, :url => "#{SITE_URL}/games/#{comment.commentable_id}/comments"
  end

protected

  def setup_email user
		recipients	user.email	
		from				SITE_MAIL
		sent_on			Time.now
  end

end
