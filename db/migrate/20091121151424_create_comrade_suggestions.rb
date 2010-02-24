class CreateComradeSuggestions < ActiveRecord::Migration
  def self.up
    create_table :comrade_suggestions do |t|
			t.integer :user_id
			t.integer :comrade_id
			t.integer :game_id
			t.integer :area_id
			t.integer :server_id
    end
  end

  def self.down
    drop_table :comrade_suggestions
  end
end
