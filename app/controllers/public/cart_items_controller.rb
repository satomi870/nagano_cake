class Public::CartItemsController < ApplicationController
  def new
    
  end

  def index
  @cart_items=@customer.cart_items
  
  end

  def show
  end

  def edit
  end
end
