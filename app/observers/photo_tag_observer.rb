require 'app/mailer/tag_mailer'

class PhotoTagObserver < ActiveRecord::Observer

  def after_save tag
    photo = tag.photo
    album = photo.album
	
    # increment counter
    photo.raw_increment :tags_count

    # issue notices and mail if necessary
		return if album.privilege == 4 
		if tag.poster_id != tag.tagged_user_id
			tag.notices.create(:user_id => tag.tagged_user_id)
			TagMailer.deliver_photo_tag tag if tag.tagged_user.mail_setting.tag_me_in_photo
    end
		if album.poster_id != tag.tagged_user_id and album.poster_id != tag.poster_id
      tag.notices.create(:user_id => album.poster_id)
      TagMailer.deliver_photo_tag_to_owner tag if album.poster.mail_setting.tag_my_photo
    end  
  end
  
  def after_destroy tag
    tag.photo.raw_decrement :tags_count
  end

end
