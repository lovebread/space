class User::FeedDeliveriesController < UserBaseController

	def destroy
		if @feed_delivery.destroy
		  render :update do |page|
			  page << "Effect.BlindUp($('feed_delivery_#{@feed_delivery.id}'));" 
		  end
    else
      render :update do |page|
        page << "error('发生错误')"
      end
    end
	end

protected

	def setup
		@feed_delivery = FeedDelivery.find(params[:id])
	rescue
		not_found
	end

  # no longer needed due to form authenticity token
=begin
	def recipient_required
    if @feed_delivery.recipient_type == 'User'
			@feed_delivery.recipient == current_user || not_found
		else
			@feed_delivery.recipient.user == current_user || not_found
		end
	end
=end

end
