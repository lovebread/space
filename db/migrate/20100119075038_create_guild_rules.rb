class CreateGuildRules < ActiveRecord::Migration
  def self.up
    create_table :guild_rules do |t|
      t.string :reason
      t.integer :outcome
      t.integer :rule_type
      t.integer :guild_id
      t.timestamps
    end
  end

  def self.down
    drop_table :guild_rules
  end
end
