class Public::AddressesController < ApplicationController
  def index
   @address=Address.new
   @addresses=current_customer.addresses  #これもアソシエーション
   
     
     
   
  end

  def edit
    @address=Address.find(params[:id])
  end
  
  def create
    @address=Address.new(address_params)
    @address.customer_id=current_customer.id  #エンジニアが代わりにcustomer_idを入れてあげる
   if @address.save
    redirect_to addresses_path
   else 
     @addresses=current_customer.addresses  #bookers２の時のバリデーションと同じ
     render:index
   end  
  end
  
  def destroy
    address=Address.find(params[:id]) #こっちも@addressにするとcreateの@addressと区別できなくなる
    address.destroy
    redirect_to addresses_path
  end
  
  def update
    @address=Address.find(params[:id])
   if @address.update(address_params)
    redirect_to addresses_path
   else
     render:edit
   end  
  end 
  
  private
  def address_params
  params.require(:address).permit(:name,:postal_code,:address)
  end
end
