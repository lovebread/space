class City < ActiveRecord::Base

  has_many :districts

  belongs_to :region

  has_many :profiles

end
