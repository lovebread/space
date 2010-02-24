class PersonalPhotoObserver < ActiveRecord::Observer

  def before_save photo
    return unless photo.thumbnail.blank?
  
    album = photo.album

    # inherit some attributes from album
    photo.privilege = album.privilege
    photo.poster_id = album.poster_id
    photo.game_id = album.game_id
  end

  def after_create photo
    return unless photo.thumbnail.blank?
    
    # increment counter
    photo.poster.raw_increment :photos_count
    photo.album.raw_increment :photos_count
  end

  def after_update photo
    return unless photo.thumbnail.blank?
    
    # if photo is moved to another album, change counter
    if photo.album_id_changed?
      from = PersonalAlbum.find(photo.album_id_was)
      to = photo.album
      from.raw_decrement :photos_count
      to.raw_increment :photos_count
    end
  end

  def after_destroy photo
    return unless photo.thumbnail.blank? 

    # decrement counter
    photo.poster.raw_decrement :photos_count
    photo.album.raw_decrement :photos_count

    # check if the deleted photo is cover
    album = photo.album
    if album.cover_id == photo.id
      album.update_attribute('cover_id', nil)
    end
  end

end
