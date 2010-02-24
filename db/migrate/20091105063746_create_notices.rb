class CreateNotices < ActiveRecord::Migration
  def self.up
    create_table :notices do |t|
			t.integer :producer_id
			t.string	:producer_type
			t.integer	:user_id
			t.string	:data
			t.boolean :read, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :notices
  end
end
