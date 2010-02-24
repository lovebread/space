class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.integer :forum_id
      t.integer :poster_id
      t.string :subject
			t.text :content
      t.integer :posts_count, :default => 0
      t.boolean :top, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
