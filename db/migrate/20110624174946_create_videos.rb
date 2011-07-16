class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.integer :user_id
      t.integer :channel_id
      t.string :name_en
      t.string :name_pl
      t.text :description_en
      t.text :description_en_paid
      t.text :description_pl
      t.text :description_pl_paid
      t.text :full_version
      t.string :duration
      t.boolean :is_featured
      t.boolean :is_paid
      t.integer :price
      t.integer :days
      t.integer :commission
      t.string :youtube_trailer
      t.integer :level
      t.string :native
      t.boolean :has_pl_captions
      t.boolean :has_en_captions

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
