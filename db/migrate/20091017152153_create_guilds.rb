class CreateGuilds < ActiveRecord::Migration
  def self.up
    create_table :guilds do |t|
      t.string :name
      t.integer :game_id
      t.integer :game_area_id
      t.integer :game_server_id
      t.string :description
      t.integer :president_id
      t.integer :character_id

      # counters
			t.integer :members_count, :default => 0
			t.integer :veterans_count, :default => 0
			t.integer :invitations_count, :default => 0
			t.integer :requests_count, :default => 0 
			t.integer :comments_count, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :guilds
  end
end
