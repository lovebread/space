namespace :feed do

	task :delete_expired_deliveries => :environment do
		feed_deliveries = FeedDelivery.find(:all, :conditions => ["created_at <= ?", 1.month.ago.to_s(:db)])
		FeedDelivery.destroy(feed_deliveries.map(&:id))
	end

end 
