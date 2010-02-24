class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.integer :poster_id
      t.integer :game_id
      t.string :title
      t.text :description

			# the following 3 fields are required by acts_as_video
      t.string :video_url
			t.string :embed_html
			t.string :thumbnail_url
      t.integer :sharings_count, :default => 0
      t.integer :digs_count, :default => 0
      t.integer :comments_count, :default => 0
      t.integer :tags_count, :default => 0
      t.integer :privilege, :default => 1
      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
