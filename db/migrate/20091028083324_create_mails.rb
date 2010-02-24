class CreateMails < ActiveRecord::Migration
  def self.up
    create_table :mails do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.boolean :delete_by_sender, :default => false
      t.boolean :delete_by_recipient, :default => false
      t.boolean :read_by_recipient, :default => false
      t.string :title
      t.text :content
      t.integer :parent_id, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :mails
  end
end
