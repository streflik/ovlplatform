class CreateUnlocks < ActiveRecord::Migration
  def self.up
    create_table :unlocks do |t|
      t.integer :video_id
      t.integer :user_id
      t.integer :teacher_id
      t.integer :credits
      t.integer :commission
      t.datetime :expires_at
      t.timestamps
    end
    add_index :unlocks,:user_id
    add_index :unlocks,[:user_id,:video_id]
  end

  def self.down
  drop_table :unlocks
  end
end
