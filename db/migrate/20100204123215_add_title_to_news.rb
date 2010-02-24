class AddTitleToNews < ActiveRecord::Migration
  def self.up
    add_column :news, :title, :string, :limit => 64
  end

  def self.down
    remove_column :news, :title
  end
end
