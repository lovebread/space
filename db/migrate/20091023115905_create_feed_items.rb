class CreateFeedItems < ActiveRecord::Migration
  def self.up
    create_table :feed_items do |t|
			t.text :data
			t.string :originator_type
			t.integer :originator_id
			t.datetime :created_at
		end
  end

  def self.down
    drop_table :feed_items
  end
end
