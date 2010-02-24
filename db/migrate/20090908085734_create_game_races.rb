class CreateGameRaces < ActiveRecord::Migration
  def self.up
    create_table :game_races do |t|
      t.string :name
      t.integer :game_id
      t.timestamps
    end
  end

  def self.down
    drop_table :game_races
  end
end
