class AvatarAlbum < Album

	belongs_to :cover, :class_name => 'Avatar'

  belongs_to :user, :foreign_key => 'owner_id'

  has_many :photos, :class_name => 'Avatar', :dependent => :destroy, :foreign_key => 'album_id', :order => 'created_at DESC'

  acts_as_commentable :order => 'created_at ASC',
                      :delete_conditions => lambda {|user, album, comment| album.poster == user || comment.poster == user}, 
                      :create_conditions => lambda {|user, album| (album.poster == user) || (album.poster.has_friend? user)}

  # 这些属性都是系统创建的，不需要检查
  attr_readonly :owner_id, :poster_id, :privilege, :game_id

  def set_cover photo
    Avatar.transaction do
      user.update_attribute('avatar_id', photo.id)
      self.update_attribute('cover_id', photo.id)
    end
  rescue
    return false
  end

end
