class CreateViewings < ActiveRecord::Migration
  def self.up
    create_table :viewings do |t|
      t.integer :user_id
      t.integer :viewable_id
      t.string :viewable_type
      t.datetime :viewed_at
    end
  end

  def self.down
    drop_table :viewings
  end
end
