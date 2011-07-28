class AddImageColumns < ActiveRecord::Migration
  def self.up

    add_column :users, :avatar_file_name,    :string
    add_column :users, :avatar_content_type, :string
    add_column :users, :avatar_file_size,    :integer
    add_column :users, :avatar_updated_at,   :datetime

    add_column :users, :thumb_file_name,    :string
    add_column :users, :thumb_content_type, :string
    add_column :users, :thumb_file_size,    :integer
    add_column :users, :thumb_updated_at,   :datetime

    add_column :videos, :thumb_file_name,    :string
    add_column :videos, :thumb_content_type, :string
    add_column :videos, :thumb_file_size,    :integer
    add_column :videos, :thumb_updated_at,   :datetime

    add_column :channels, :thumb_file_name,    :string
    add_column :channels, :thumb_content_type, :string
    add_column :channels, :thumb_file_size,    :integer
    add_column :channels, :thumb_updated_at,   :datetime

    add_column :channels, :banner_file_name,    :string
    add_column :channels, :banner_content_type, :string
    add_column :channels, :banner_file_size,    :integer
    add_column :channels, :banner_updated_at,   :datetime

  end

  def self.down
   
    remove_column :users, :avatar_file_name
    remove_column :users, :avatar_content_type
    remove_column :users, :avatar_file_size
    remove_column :users, :avatar_updated_at

    remove_column :users, :thumb_file_name
    remove_column :users, :thumb_content_type
    remove_column :users, :thumb_file_size
    remove_column :users, :thumb_updated_at

    remove_column :videos, :thumb_file_name
    remove_column :videos, :thumb_content_type
    remove_column :videos, :thumb_file_size
    remove_column :videos, :thumb_updated_at

    remove_column :channels, :thumb_file_name
    remove_column :channels, :thumb_content_type
    remove_column :channels, :thumb_file_size
    remove_column :channels, :thumb_updated_at

    remove_column :channels, :banner_file_name
    remove_column :channels, :banner_content_type
    remove_column :channels, :banner_file_size
    remove_column :channels, :banner_updated_at
  end
end
