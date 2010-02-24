class CreatePollInvitations < ActiveRecord::Migration
  def self.up
    create_table :poll_invitations do |t|
			t.integer :user_id
			t.integer :poll_id
      t.timestamps
    end
  end

  def self.down
    drop_table :poll_invitations
  end
end
