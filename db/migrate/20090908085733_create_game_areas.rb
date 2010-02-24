class CreateGameAreas < ActiveRecord::Migration
  def self.up
    create_table :game_areas do |t|
      t.string :name
      t.integer :game_id
      t.integer :servers_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :game_areas
  end
end
