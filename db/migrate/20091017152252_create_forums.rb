class CreateForums < ActiveRecord::Migration
  def self.up
    create_table :forums do |t|
      t.string :name
      t.text :description
      t.integer :topics_count, :default => 0
      t.integer :posts_count, :default => 0
      t.integer :guild_id
      t.timestamps
    end
  end

  def self.down
    drop_table :forums
  end
end
