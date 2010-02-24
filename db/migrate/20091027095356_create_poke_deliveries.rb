class CreatePokeDeliveries < ActiveRecord::Migration
  def self.up
    create_table :poke_deliveries do |t|
			t.integer :sender_id
			t.integer :recipient_id
			t.integer :poke_id
      t.timestamps
    end
  end

  def self.down
    drop_table :poke_deliveries
  end
end
