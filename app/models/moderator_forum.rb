class ModeratorForum < ActiveRecord::Base

	belongs_to :moderator, :class_name => 'User'

	belongs_to :forum

end
