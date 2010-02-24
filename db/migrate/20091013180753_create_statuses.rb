class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.integer :poster_id
      t.text :content
      t.integer :comments_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end
end
