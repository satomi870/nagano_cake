class Address < ApplicationRecord
    def address_disply
        '〒'+postal_code+''+address+''+name
    end    
    belongs_to :customer
    
    
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
    
end
