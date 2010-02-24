class FriendSuggestion < ActiveRecord::Base

	belongs_to :user

	belongs_to :suggested_friend, :class_name => 'User'

end
