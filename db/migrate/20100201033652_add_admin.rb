class AddAdmin < ActiveRecord::Migration
  def self.up
    Role.create(:name => 'admin')
    RoleUser.create(:role_id => 1, :user_id => 1)
  end

  def self.down
  end
end
