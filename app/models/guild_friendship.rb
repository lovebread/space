class GuildFriendship < ActiveRecord::Base

  belongs_to :guild

  belongs_to :friend, :class_name => 'Guild' 

end
