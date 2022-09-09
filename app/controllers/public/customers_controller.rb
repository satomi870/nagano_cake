class Public::CustomersController < ApplicationController
  def show
     @customer=current_customer #.idはつけない idつけるとエラーになる
     
  end

  def edit
     @customer=current_customer
  end
  
  def update
     @customer=current_customer
     @customer.update(customer_params)
     redirect_to customers_path
  end
  
  def out
      @customer=Customer.find_by(email:params[:email])
      @customer.update(is_deleted: true)
       reset_session
       redirect_to public_homes_top_path
  end
  
  def customer_params
    params.require(:customer).permit(:last_name,:last_name_kana,:postal_code,:address,:telephone_number,:email)
  end

end
