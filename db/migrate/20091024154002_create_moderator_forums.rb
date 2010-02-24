class CreateModeratorForums < ActiveRecord::Migration
  def self.up
    create_table :moderator_forums do |t|
			t.integer :forum_id
			t.integer :moderator_id
      t.timestamps
    end
  end

  def self.down
    drop_table :moderator_forums
  end
end
