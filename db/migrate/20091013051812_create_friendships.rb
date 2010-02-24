class CreateFriendships < ActiveRecord::Migration
  def self.up
    create_table :friendships do |t|
      t.integer :friend_id
      t.integer :user_id
      t.integer :status
			t.string :data
      t.timestamps
    end
  end

  def self.down
    drop_table :friendships
  end
end
