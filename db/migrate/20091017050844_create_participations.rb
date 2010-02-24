class CreateParticipations < ActiveRecord::Migration
  def self.up
    create_table :participations do |t|
      t.integer :participant_id
      t.integer :character_id
      t.integer :event_id
      t.integer :status # 0. invite 1. request 2. accept 3. maybe 4. decline
      t.timestamps
    end
  end

  def self.down
    drop_table :participations
  end
end
