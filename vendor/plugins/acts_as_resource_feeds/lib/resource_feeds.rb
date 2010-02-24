# ActsAsResourceFeeds
module ResourceFeeds

	def self.included base
		base.extend(ClassMethods)
	end	

	module ClassMethods

    def acts_as_feed_recipient opts={}
    
      has_many :feed_deliveries, :as => 'recipient', :dependent => :destroy

      cattr_accessor :feed_recipient_opts

      self.feed_recipient_opts = opts

      opts[:categories].each do |item_key, item_type|
        has_many "#{item_key}_feed_deliveries", :class_name => 'FeedDelivery', :as => 'recipient', :order => 'created_at DESC', :conditions => {:item_type => item_type}

        has_many "#{item_key}_feed_items", :through => "#{item_key}_feed_deliveries", :source => 'feed_item', :order => 'created_at DESC' 
      end unless opts[:categories].blank?

      include ResourceFeeds::InstanceMethods
    end
		
		def acts_as_resource_feeds

			has_many :feed_items, :as => 'originator', :dependent => :destroy

			define_method(:deliver_feeds) do |opts|
				return if opts[:recipients].blank?
				item = feed_items.create(:data => opts[:data])
				values = []
				# use self.class.name rather than item.originator_type ensures correct class name
				opts[:recipients].each do |recipient|
					values << "(NULL, #{recipient.id}, '#{recipient.class.to_s}', #{item.id}, '#{self.class.name}', '#{Time.now.to_s(:db)}')"
				end
				sql = "insert into feed_deliveries values #{values.join(',')}"
				ActiveRecord::Base.connection.execute(sql)	
			end	

      define_method(:destroy_feeds) do
        feed_items.each {|item| item.destroy}
      end

		end

	end

  module InstanceMethods
  
    def is_feed_deleteable_by? user, feed_delivery
      proc = self.class.feed_recipient_opts[:delete_conditions] || lambda { false }
      proc.call user, self
    end

  end

end
