class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.integer :poster_id
      t.integer :game_id
      t.string :title, :limit => 64
      t.text :content, :limit => 100000
      t.integer :sharings_count, :default => 0
      t.integer :digs_count, :default => 0
      t.integer :comments_count, :default => 0
      t.integer :tags_count, :default => 0
      t.integer :viewings_count, :default => 0
      t.boolean :draft, :default => true
      t.integer :privilege, :default => 1 # 1:all, 2:friend or same game, 3:friend, 4:owner
      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
