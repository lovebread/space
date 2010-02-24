require 'mime/types'

class Photo < ActiveRecord::Base

  belongs_to :poster, :class_name => 'User'

	belongs_to :album

	has_many :relative_users, :through => :tags, :source => 'tagged_user'

	named_scope :hot, :conditions => ["parent_id IS NULL and created_at > ? and privilege != 4", 2.weeks.ago.to_s(:db)], :order => "digs_count DESC"

	acts_as_privileged_resources

	acts_as_resource_feeds

  acts_as_shareable

  acts_as_diggable :create_conditions => lambda {|user, photo| (photo.type != 'PersonalPhoto' and photo.type != 'Avatar') or photo.privilege != 4}

  def is_cover?
    album.cover_id == id
  end

	def swf_uploaded_data=(data)
    data.content_type = MIME::Types.type_for(data.original_filename)
    self.uploaded_data = data
  end

end
