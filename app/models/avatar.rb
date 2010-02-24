class Avatar < Photo

  has_attachment :content_type => :image, :storage => :file_system, :max_size => 8.megabytes, :thumbnails => { :large => '100x100>', :medium => '50x50>', :small => '27x27>'}

  validates_as_attachment

  acts_as_photo_taggable :delete_conditions => lambda {|user, photo, album| album.poster == user},
                         :create_conditions => lambda {|user, photo, album| album.poster.has_friend?(user) || album.poster == user}

  acts_as_commentable :order => 'created_at ASC',
                      :delete_conditions => lambda {|user, photo, comment| photo.poster == user || comment.poster == user}, 
                      :create_conditions => lambda {|user, photo| (photo.poster == user) || (photo.poster.has_friend? user)} 

  attr_readonly :poster_id, :album_id, :game_id, :privilege

  validates_size_of :notation, :within => 0..1000, :too_long => "最多1000个字节", :allow_nil => true

  # album_id, game_id, poster_id 和 privilege 都由系统赋值，且不能改变，因此不需要校验

end
