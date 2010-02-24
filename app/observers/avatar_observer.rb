#
# 头像新鲜事和照片新鲜事不同
# 头像一次只能上传一张，所以用after_create这个callback就够了
# 一般的照片一次上传多张，很难用after_create解决
#
class AvatarObserver < ActiveRecord::Observer

  def before_create avatar
    return unless avatar.thumbnail.blank?

    # inherit some attributes from album
    album = avatar.album
    avatar.poster_id = album.poster_id
    avatar.privilege = album.privilege
    avatar.game_id = nil
  end

	def after_create avatar
    return unless avatar.thumbnail.blank?

		# set cover
		avatar.album.update_attributes(:cover_id => avatar.id)
    avatar.album.update_attributes(:uploaded_at => Time.now)
    avatar.poster.update_attributes(:avatar_id => avatar.id) 

    # increment counter
    avatar.poster.raw_increment :photos_count
    avatar.album.raw_increment :photos_count

    # issue avatar feeds if necessary 
    return if !avatar.album.poster.application_setting.emit_photo_feed 
		recipients = avatar.album.poster.friends.find_all {|f| f.application_setting.recv_photo_feed }
		avatar.deliver_feeds :recipients => recipients
	end

  def before_destroy avatar
    return false
    #return unless avatar.thumbnail.blank?
    #return false if avatar.is_cover?
  end

  def after_destroy avatar
    return unless avatar.thumbnail.blank?
    # decrement counter
    avatar.album.raw_decrement :photos_count
    avatar.poster.raw_decrement :photos_count
  end   

end
