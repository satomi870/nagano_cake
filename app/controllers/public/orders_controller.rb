class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end
  
  def create
    @order=Order.new(order_params)
    @order.save
    redirect_to orders_confirm_path
  end

  def index
  end

  def show
  end

  def edit
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code,:address,:name)
  end

end
