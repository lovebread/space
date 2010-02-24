class Region < ActiveRecord::Base

  has_many :cities

  has_many :profiles

end
