module Diggable

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def acts_as_diggable opts={}

      has_many :digs, :as => 'diggable', :dependent => :destroy

      cattr_accessor :diggable_opts

      self.diggable_opts = opts

      include Diggable::InstanceMethods

      extend Diggable::SingletonMethods
    end   

  end

  module SingletonMethods
  end

  module InstanceMethods

		def digged_by? user
			!digs.find_by_poster_id(user.id).nil?
		end

    def is_diggable_by? user
      proc = self.class.diggable_opts[:create_conditions] || lambda { true }
      proc.call user, self
    end

  end

end

ActiveRecord::Base.send(:include, Diggable)

