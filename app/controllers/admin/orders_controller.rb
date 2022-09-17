class Admin::OrdersController < ApplicationController
  def index
    #@orders=Order.all
  end

  def show
    @sum=0
    @postage=800
    @order=Order.find(params[:id])
    @order_details=@order.order_details
  end

  def update
    @order=Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end
  
  def order_params
    params.require(:order).permit(:order_status)
  end
  
end 