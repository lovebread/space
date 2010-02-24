#
# 头像新鲜事和照片新鲜事不同
# 头像一次只能上传一张，所以用after_create这个callback就够了
# 一般的照片一次上传多张，很难用after_create解决
#
class AvatarFeedObserver < ActiveRecord::Observer

	observe :avatar

	def after_create avatar
		return if avatar.album.blank? # thumbnail.. 
    return if !avatar.album.poster.application_setting.emit_photo_feed 
		recipients = avatar.album.poster.friends.find_all {|f| f.application_setting.recv_photo_feed }
		avatar.deliver_feeds :recipients => recipients
	end

end
