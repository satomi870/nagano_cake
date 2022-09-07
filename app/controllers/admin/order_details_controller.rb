class Admin::OrderDetailsController < ApplicationController
  
  def show
    @customer = customer.find(params[:id])
    @order_datail=@customer.order
    
  end
end
