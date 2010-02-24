class Album < ActiveRecord::Base

	belongs_to :poster, :class_name => 'User'

  belongs_to :game

  acts_as_shareable

  acts_as_resource_feeds

	def recent_photos limit
		photos.find(:all, :limit => limit)
	end

end
