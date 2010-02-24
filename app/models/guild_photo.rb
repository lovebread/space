class GuildPhoto < Photo

  has_attachment :content_type => :image, :storage => :file_system, :max_size => 8.megabytes, :thumbnails => { :large => '100x100>', :medium => '50x50>', :small => '27x27>'}

  validates_as_attachment

  acts_as_photo_taggable :delete_conditions => lambda {|user, photo, album| album.poster == user},
                         :create_conditions => lambda {|user, photo, album| album.guild.has_member?(user) }

  acts_as_commentable :order => 'created_at ASC', 
                      :delete_conditions => lambda {|user, photo, comment| photo.album.poster == user || comment.poster == user}

  attr_readonly :album_id, :poster_id, :game_id, :privilege

  validates_presence_of :album_id, :if => "thumbnail.blank?", :on => :create

  validate_on_create :album_is_valid

  validates_size_of :notation, :within => 0..1000, :too_long => "最多1000个字节", :allow_nil => true

protected

  def album_is_valid
    return if album_id.blank? or poster_id.blank?

    album = GuildAlbum.find_by_id(album_id)
    if album.blank?
      errors.add(:album_id, "不存在")
    else
      role = album.guild.role_for poster
      errors.add(:poster_id, "不是该工会的长老或者会长") if role.blank? or role == Membership::Member
    end
  end 

end
