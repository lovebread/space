module PhotoTaggable

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def acts_as_photo_taggable opts={}
      
      has_many :tags, :class_name => 'PhotoTag', :foreign_key => 'photo_id', :dependent => :destroy

      has_many :relative_users, :through => :tags, :source => :tagged_user

      cattr_accessor :photo_taggable_opts

      self.photo_taggable_opts = opts

      include PhotoTaggable::InstanceMethods

      extend PhotoTaggable::SingletonMethods

    end

  end

  module SingletonMethods

  end

  module InstanceMethods

    def is_taggable_by? user
      proc = self.class.photo_taggable_opts[:create_conditions] || lambda { true }
      proc.call user, self, self.album
    end

    def is_tag_deleteable_by? user, tag
      proc = self.class.photo_taggable_opts[:delete_conditions] || lambda { true }
      proc.call user, self, self.album 
    end

  end

end

ActiveRecord::Base.send(:include, PhotoTaggable)
 
