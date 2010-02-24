class FeedDelivery < ActiveRecord::Base

	belongs_to :feed_item

	belongs_to :recipient, :polymorphic => true

  def is_deleteable_by? user
    recipient.is_feed_deleteable_by? user, self
  end

end
