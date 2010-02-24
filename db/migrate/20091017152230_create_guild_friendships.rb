class CreateGuildFriendships < ActiveRecord::Migration
  def self.up
    create_table :guild_friendships do |t|
      t.integer :guild_id
      t.integer :friend_id

      t.timestamps
    end
  end

  def self.down
    drop_table :guild_friendships
  end
end
