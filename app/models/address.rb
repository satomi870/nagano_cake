class Address < ApplicationRecord
    def address_disply
        '〒'+postal_code+''+address+''+name
    end    
    belongs_to :customer
end
