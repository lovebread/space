class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string  :title
      t.integer :poster_id
      t.integer :character_id
      t.integer :game_id
      t.integer :game_server_id
      t.integer :game_area_id
      t.integer :guild_id
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :expired, :default => false
      t.text :description
      t.integer :privilege, :default => 1
		
			# counters
      t.integer :comments_count, :default => 0
      t.integer :invitations_count, :default => 0 
      t.integer :requests_count, :default => 0
      t.integer :confirmed_count, :default => 0
      t.integer :maybe_count, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
