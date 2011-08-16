class Payment < ActiveRecord::Base

attr_accessible :invoice_first_name, :invoice_last_name, :invoice_street, :invoice_postal_code, :invoice_city, :credits

validates :invoice_first_name, :invoice_last_name, :invoice_street, :invoice_postal_code, :invoice_city, :credits, :presence => true

#belongs_to :country
belongs_to :user

end
