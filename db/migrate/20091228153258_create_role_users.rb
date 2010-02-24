class CreateRoleUsers < ActiveRecord::Migration
  def self.up
    create_table :role_users do |t|
      t.integer :role_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :role_users
  end
end
