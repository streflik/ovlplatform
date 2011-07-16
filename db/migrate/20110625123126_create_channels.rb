class CreateChannels < ActiveRecord::Migration
  def self.up
    create_table :channels do |t|
      t.string :name_en
      t.string :name_pl
      t.string :tagline_en
      t.string :tagline_pl

      t.timestamps
    end
  end

  def self.down
    drop_table :channels
  end
end
