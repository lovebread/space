class CreatePokes < ActiveRecord::Migration
  def self.up
    create_table :pokes do |t|
			t.string :name
			t.string :path
    end
	end

  def self.down
    drop_table :pokes
  end
end
