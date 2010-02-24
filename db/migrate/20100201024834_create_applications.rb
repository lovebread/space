class CreateApplications < ActiveRecord::Migration
  def self.up
    create_table :applications do |t|
      t.string :name
      t.string :icon_class
      t.text :about
      t.integer :comments_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :applications
  end
end
