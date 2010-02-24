class CreatePhotoTags < ActiveRecord::Migration
  def self.up
    create_table :photo_tags do |t|
      t.integer :poster_id
      t.integer :tagged_user_id
      t.integer :photo_id
      t.string :photo_type # avatar, event_photo, guild_photo, personal_photo
			t.integer :x
      t.integer :y
      t.integer :width
      t.integer :height
      t.string :content
      t.timestamps
    end
  end

  def self.down
    drop_table :photo_tags
  end
end
