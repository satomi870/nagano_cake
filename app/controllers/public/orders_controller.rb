class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end
  
  def create
     @order=Order.new(order_params)
     @order.save
     cart_items =current_customer.cart_items.all
   　cart_items.each do |cart_item|
   　  order_detail = OrdeDetail.new
   　  order_detail.item_id = cart_item.item_id
   　  order_detail.amount=cart_item.amount
   　  order_detail.price=cart_item.price
   　  order_detail.save
     current_user.cart_items.destroy_all  
   　
   　redirect_to order_thanks_path
  end
  
  def confirm
    @order=Order.new(order_params) # ユーザーが行った注文をDBで管理するためnewで注文モデルを生成する
    @cart_items=current_customer.cart_items
     @sum=0
    @order.postage=800
    
    if params[:order][:select_address]=="0"
    @order.postal_code=current_customer.postal_code
    @order.address=current_customer.address
    @order.name=current_customer.first_name+current_customer.last_name
    
    elsif params[:order][:select_address]=="1"
      @address=Address.find(params[:order][:address_id])
      @order.postal_code=@address.postal_code
      @order.address=@address,address
      @order.name=@address.name
      
    elsif params[:order][:select_address]=="2" 
      @order.postal_code=params[:order][:postal_code]
      @order.address=params[:order][:address]
      @order.name=params[:order][:name]
      
   
   end 
   end
  end
  
  def thanks
    
  end  
end
  
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method,:postal_code,:address,:name,:billing_amount)
  end

