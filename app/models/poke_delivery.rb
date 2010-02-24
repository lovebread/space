class PokeDelivery < ActiveRecord::Base

	belongs_to :sender, :class_name => 'User'

	belongs_to :recipient, :class_name => 'User', :counter_cache => :poke_deliveries_count

	belongs_to :poke

end
