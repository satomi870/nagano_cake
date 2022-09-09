# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
    
    
    before_action:customer_state,only:[:create]
    
    protected
    def customer_state
        @customer=Customer.find_by(email[:customer][:email])
        return if!@customer
        if @customer.valid_password?(params[:customer][:password]) &&(@customer.is_deleted==true)
        redirect_to new_customer_registration_path
        end
    end    
    
  
   def after_sign_in_path_for(resource)
       public_homes_top_path
   end
   
   def after_sign_out_path_for(resource)
       public_homes_top_path
   end
  
  

end# GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
