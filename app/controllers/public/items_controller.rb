class Public::ItemsController < ApplicationController
  def new
  end

  def index
    @items=Item.all
  end

  def show
    @item=Item.find(params[:id])
    @cart_item=CartItem.new
  end

  def edit
  end
end
