class CreateFeedDeliveries < ActiveRecord::Migration
  def self.up
    create_table :feed_deliveries do |t|
			t.integer :recipient_id
			t.string :recipient_type # guild? user? profile? game?
			t.integer :feed_item_id
			t.string :item_type # this is a replication of originator type in feed_item. For some performance reason, we need this
			t.datetime :created_at
    end
  end

  def self.down
    drop_table :feed_deliveries
  end
end
