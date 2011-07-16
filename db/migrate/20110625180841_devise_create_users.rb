class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable

      t.string :first_name
      t.string :last_name
      t.boolean :accept_policy
      t.text :description_en
      t.text :description_pl
      t.string :tagline_en
      t.string :tagline_pl
      t.boolean :is_admin, :default => false
      t.boolean :is_teacher, :default => false
      t.boolean :is_subscriber, :default => false
      t.integer :credits_available, :default => "0"
      t.integer :credits_total, :default => "0"

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end
