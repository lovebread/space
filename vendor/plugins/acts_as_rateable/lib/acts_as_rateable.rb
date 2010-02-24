# ActsAsRateable
# the origin plugin is out-of-date and is full of some useless methods
# author: 高毛
module Rateable

	def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def acts_as_rateable opts={}
      has_many :ratings, :as => 'rateable', :dependent => :destroy

      cattr_accessor :rating_opts

      self.rating_opts = opts

      include Rateable::InstanceMethods

      extend Rateable::SingletonMethods
    end   

  end

	module SingletonMethods
	
	end

	module InstanceMethods

		def find_rating_by_user user
			ratings.find_by_user_id(user.id)
		end
 
		def rated_by? user
			!ratings.find_by_user_id(user.id).nil?
		end 

    def is_rateable_by? user
      rating = ratings.find_by_user_id(user.id)
      proc = self.class.rating_opts[:create_conditions] || lambda { true }
      proc.call rating, self, user
    end

	end

end
