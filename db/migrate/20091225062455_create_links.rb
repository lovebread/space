class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :url
      t.integer :sharings_count, :default => 0
    end
  end

  def self.down
    drop_table :links
  end
end
