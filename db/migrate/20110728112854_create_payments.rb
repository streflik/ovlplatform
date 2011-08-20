class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :user_id
      t.integer :country_id
      t.string :invoice_first_name
      t.string :invoice_last_name
      t.string :invoice_street
      t.string :invoice_postal_code
      t.string :invoice_city
      t.integer :credits
      t.integer :price
      t.string :country

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
