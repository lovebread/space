class EventAlbumObserver < ActiveRecord::Observer

  # works for both save and update
  def before_save album
    event = album.event
    album.poster_id = event.poster_id
    album.privilege = 1
    album.game_id = event.game_id
    album.title = "活动'#{event.title}'的相册" 
  end

end
