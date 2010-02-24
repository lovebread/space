class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.integer :game_id
      t.integer :poster_id
      t.string :news_type
      t.text :data
      t.integer :comments_count, :default => 0
      t.integer :viewings_count, :default => 0
      t.integer :sharings_count, :default => 0
      t.timestamps
    end
  end
 
  def self.down
    drop_table :news
  end
end
