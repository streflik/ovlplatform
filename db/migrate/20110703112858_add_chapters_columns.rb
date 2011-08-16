class AddChaptersColumns < ActiveRecord::Migration
  def self.up

    add_column :videos, :chapters_pl, :text
    add_column :videos, :chapters_en, :text

  end

  def self.down
   
    remove_column :videos, :chapters_pl
    remove_column :videos, :chapters_en

  end
end
