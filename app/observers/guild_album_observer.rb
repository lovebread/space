class GuildAlbumObserver < ActiveRecord::Observer

  # works for both save and update
  def before_save album
    guild = album.guild
    album.poster_id = guild.president_id
    album.privilege = 1
    album.game_id = guild.game_id
    album.title = "工会'#{guild.name}'的相册" 
  end

end
