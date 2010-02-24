class CreateFriendTags < ActiveRecord::Migration
  def self.up
    create_table :friend_tags do |t|
      t.integer :poster_id
      t.integer :tagged_user_id
      t.integer :taggable_id
      t.string :taggable_type
      t.timestamps
    end
  end

  def self.down
    drop_table :friend_tags
  end
end
