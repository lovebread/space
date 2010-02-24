class FeedItem < ActiveRecord::Base

	serialize :data, Hash

	belongs_to :originator, :polymorphic => true

	has_many :deliveries, :class_name => 'FeedDelivery', :dependent => :destroy

end
