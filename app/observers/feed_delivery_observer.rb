class FeedDeliveryObserver < ActiveRecord::Observer

  def before_create delivery
    delivery.expired_at = 1.week.from_now 
  end

  def after_create delivery
    # TODO: this is not necessary now
  end

  def after_destroy delivery
    # TODO: this is not necessary now
  end

end
