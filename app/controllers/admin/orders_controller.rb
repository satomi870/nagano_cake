class Admin::OrdersController < ApplicationController
  def index
    @orders=Order.all
  end

  def show
  end

  def edit
  end
end
