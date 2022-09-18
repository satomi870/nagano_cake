class Order < ApplicationRecord
    enum payment_method: { credit_card: 0, transfer: 1 }
    enum order_status: { waiting: 0,confirmation:1,paid_up:2, preparing:3, shipped:4 }
    enum making_status: { impossible_manufacture: 0, waiting_manufacture:1,manufacturing:2,finish:3}
     #has_many :items
     has_many :order_details
     belongs_to :customer
    
    def with_tax_price
        (price*1.1).floor 
    end 
    
    validates :postal_code, presence: true
    validates :address, presence: true
    validates :name, presence: true
    

 
     
     
end
