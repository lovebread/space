class PersonalPhoto < Photo

	has_attachment :content_type => :image, :storage => :file_system, :max_size => 8.megabytes, :thumbnails => { :large => '100x100>', :medium => '50x50>', :small => '27x27>'}
                                  
  validates_as_attachment

  acts_as_photo_taggable :delete_conditions => lambda {|user, photo, album| album.poster == user },
                         :create_conditions => lambda {|user, photo, album| user == photo.poster || (photo.privilege != 4 and album.poster.has_friend?(user)) || false}

  acts_as_commentable :order => 'created_at ASC',
                      :delete_conditions => lambda {|user, photo, comment| photo.poster == user || comment.poster == user}, 
                      :create_conditions => lambda {|user, photo| (photo.poster == user) || (photo.privilege == 1) || (photo.privilege == 2 and (photo.poster.has_friend? user or photo.poster.has_same_game_with? user)) || (photo.privilege == 3 and photo.poster.has_friend? user) || false}

  attr_readonly :poster_id, :game_id

  validates_presence_of :album_id, :if => Proc.new {|avatar| avatar.thumbnail.blank?}

  validate_on_update :album_is_valid

  validates_size_of :notation, :within => 0..1000, :too_long => "最多1000个字节", :allow_nil => true

  # game_id, poster_id 和 privilege 都是继承相册的权限，且不能改变，因此不需要校验

protected

  def album_is_valid
    return unless album_id_changed?

    album = PersonalAlbum.find_by_id(album_id)
    errors.add(:album_id, "不存在") if album.blank?
    errors.add(:album_id, "不是拥有者") if album.owner_id != poster_id
  end

end
