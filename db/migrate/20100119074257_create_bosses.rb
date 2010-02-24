class CreateBosses < ActiveRecord::Migration
  def self.up
    create_table :bosses do |t|
      t.string  "name"
      t.integer "game_id"
      t.integer "guild_id"
      t.integer "reward"
      t.timestamps
    end
  end

  def self.down
    drop_table :bosses
  end
end
