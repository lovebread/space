class AddDigsCountToNews < ActiveRecord::Migration
  def self.up
    add_column :news, :digs_count, :integer, :default => 0
  end

  def self.down
    remove_column :news, :digs_count
  end
end
