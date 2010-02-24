class CreateGears < ActiveRecord::Migration
  def self.up
    create_table :gears do |t|
      t.string :name
      t.string :gear_type
      t.integer :boss_id
      t.integer :guild_id
      t.integer :cost
      t.timestamps
    end
  end

  def self.down
    drop_table :gears
  end
end
