module Commentable

  def self.included(base)
    base.extend(ClassMethods)
  end

	module ClassMethods

		def acts_as_commentable opts={}
			has_many :comments, :as => 'commentable', :dependent => :destroy, :order => opts[:order]

			include Commentable::InstanceMethods

			extend Commentable::SingletonMethods
		
      cattr_accessor :commentable_opts

      self.commentable_opts = {:recipient_required => true}.merge(opts)
    end		

	end

	module SingletonMethods
	end

	module InstanceMethods
  
    def is_commentable_by? user
      proc = self.class.commentable_opts[:create_conditions] || lambda { true }
      proc.call user, self
    end

    def is_comment_deleteable_by? user, comment
      proc = self.class.commentable_opts[:delete_conditions] || lambda { true }
      proc.call user, self, comment
    end

    def is_comment_viewable_by? user
      proc = self.class.commentable_opts[:view_conditions] || self.class.commentable_opts[:create_conditions] || lambda { true }
      proc.call user, self  
    end
    
    def is_comment_recipient_required?
      self.class.commentable_opts[:recipient_required]
    end

	end

end

ActiveRecord::Base.send(:include, Commentable)
