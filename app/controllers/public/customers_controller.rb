class Public::CustomersController < ApplicationController
  def show
     @customer=current_customer #.idはつけない idつけるとエラーになる
     
  end

  def edit
     @customer=current_customer
  end
  
  def update
     @customer=current_customer
     if @customer.update(customer_params)
      redirect_to customers_path
     else
      render:edit
     end
  end
  
  def quit
     
  end    
  
  def out
      @customer=current_customer
      @customer.update(is_deleted: true)
       reset_session
       redirect_to root_path
  end
  
  def customer_params
    params.require(:customer).permit(:last_name,:last_name_kana,:first_name,:first_name_kana,:postal_code,:address,:telephone_number,:email)
  end

end