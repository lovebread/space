class CreateFriendSuggestions < ActiveRecord::Migration
  def self.up
    create_table :friend_suggestions do |t|
			t.integer :user_id
			t.integer :suggested_friend_id
    end
  end

  def self.down
    drop_table :friend_suggestions
  end
end
