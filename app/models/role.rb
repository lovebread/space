class Role < ActiveRecord::Base

  has_many :role_users, :dependent => :destroy

  has_many :users, :through => :role_users

end
