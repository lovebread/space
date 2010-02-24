#
# 头像新鲜事和照片新鲜事不同
# 头像一次只能上传一张，所以用after_create这个callback就够了
# 一般的照片一次上传多张，很难用after_create解决
#
class EventPhotoObserver < ActiveRecord::Observer

  def before_save photo
    return unless photo.thumbnail.blank?

    # inherit some attributes from album
    album = photo.album
    photo.privilege = album.privilege
    photo.game_id = album.game_id
  end

	def after_create photo
    return unless photo.thumbnail.blank?

    # increment counter
    photo.album.raw_increment :photos_count
	end

  def before_update photo 
    if photo.notation_changed?
      photo.verified = 0
    end
  end
  
  def after_destroy photo
    return unless photo.thumbnail.blank?
    
    # decrement counter
    photo.album.raw_decrement :photos_count

    # check if the deleted photo is cover
    album = photo.album
    if album.cover_id == photo.id
      album.update_attribute('cover_id', nil)
    end
  end   

end
