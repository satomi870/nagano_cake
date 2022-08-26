class Admin::CustomersController < ApplicationController
  def new
  end

  def index
    @customers=Customer.all
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    
  end
end
