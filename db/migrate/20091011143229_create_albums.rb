class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :type
      t.integer :poster_id # user
      t.integer :owner_id # can be event, guild, user o
      t.integer :game_id
      t.integer :photos_count, :default => 0
      t.integer :privilege, :default => 1
      t.integer :cover_id
      t.string :title
      t.text :description
      t.integer :sharings_count, :default => 0
      t.integer :comments_count, :default => 0
      t.datetime :uploaded_at
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :albums
  end
end
