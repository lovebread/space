class AddVerifiedColumnToModels < ActiveRecord::Migration
  def self.up
    add_column :videos, :verified, :integer, :default => 0
    add_column :statuses, :verified, :integer, :default => 0
    add_column :comments, :verified, :integer, :default => 0
    add_column :events, :verified, :integer, :default => 0
    add_column :sharings, :verified, :integer, :default => 0
    add_column :guilds, :verified, :integer, :default => 0
    add_column :photos, :verified, :integer, :default => 0
    add_column :polls, :verified, :integer, :default => 0
    add_column :tags, :verified, :integer, :default => 0
    add_column :photo_tags, :verified, :integer, :default => 0
  end

  def self.down
    remove_column :videos, :verified
    remove_column :statuses, :verified
    remove_column :comments, :verified
    remove_column :events, :verified
    remove_column :sharings, :verified
    remove_column :guilds, :verified
    remove_column :photos, :verified
    remove_column :polls, :verified
    remove_column :tags, :verified
    remove_column :photo_tags, :verified
  end
end
