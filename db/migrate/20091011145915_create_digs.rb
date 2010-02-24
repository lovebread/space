class CreateDigs < ActiveRecord::Migration
  def self.up
    create_table :digs do |t|
      t.integer :poster_id
      t.integer :diggable_id
      t.string :diggable_type
      t.timestamps
    end
  end

  def self.down
    drop_table :digs
  end
end
