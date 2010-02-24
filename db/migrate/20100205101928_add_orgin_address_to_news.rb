class AddOrginAddressToNews < ActiveRecord::Migration
  def self.up
    add_column :news, :origin_addr, :string, :limit => 256
  end

  def self.down
    remove_column :new, :origin_addr
  end
end
