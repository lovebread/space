# ActsAsShareable
module Shareable

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def acts_as_shareable opts={}
      has_many :sharings, :as => 'shareable', :dependent => :destroy, :order => opts[:order]

      include Shareable::InstanceMethods

      extend Shareable::SingletonMethods
    end

  end

  module SingletonMethods
  end

  module InstanceMethods

    def shared_by? user
      !sharings.find_by_poster_id(user.id).nil?
    end

    def first_sharer
      sharings.find(:first, :order => "created_at ASC").poster
    end

  end

end

ActiveRecord::Base.send(:include, Shareable)
