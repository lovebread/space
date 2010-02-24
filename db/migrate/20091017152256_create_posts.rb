class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :topic_id
      t.integer :forum_id
      t.integer :poster_id
      t.text :content
      t.integer :floor

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
