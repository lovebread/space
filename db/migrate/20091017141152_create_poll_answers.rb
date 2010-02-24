class CreatePollAnswers < ActiveRecord::Migration
  def self.up
    create_table :poll_answers do |t|
      t.string :description
      t.integer :poll_id
      t.integer :votes_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :poll_answers
  end
end
