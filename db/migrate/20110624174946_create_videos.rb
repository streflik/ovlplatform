class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.integer :user_id
      t.integer :channel_id
      t.string :name
      t.text :description
      t.string :name_pl
      t.text :description_pl
      t.text :embed
      t.string :duration
      t.boolean :is_featured
      t.boolean :is_paid
      t.integer :price
      t.integer :days
      t.string :youtube
      t.integer :level

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
