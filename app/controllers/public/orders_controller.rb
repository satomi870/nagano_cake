class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end
  
  def create
    @order=current_customer.orders.new(order_params)#アソシエーション書き方2
    
    @cart_items =current_customer.cart_items.all
    #@sum+@order.postage
   
    if @order.save
    current_customer.cart_items.each do |cart_item|
    @order_detail = OrderDetail.new
    @order_detail.order_id=@order.id #アソシエーション order_idがわからないと注文一覧で出せない
    @order_detail.item_id = cart_item.item_id#アソシエーション
    @order_detail.amount=cart_item.amount
    @order_detail.unit_price=cart_item.item.price
    @order_detail.save!
    end 
     current_customer.cart_items.destroy_all  
     redirect_to orders_thanks_path
    else 
     render:new 
    end 
  end
  def confirm
    @order=Order.new(order_params) # ユーザーが行った注文をDBで管理するためnewで注文モデルを生成する
    @cart_items=current_customer.cart_items 
    @order.postage=800
    
    if params[:order][:select_address]=="0"
    @order.postal_code=current_customer.postal_code
    @order.address=current_customer.address 
    @order.name=current_customer.first_name+current_customer.last_name
    
    elsif params[:order][:select_address]=="1"
      @address=Address.find(params[:order][:address_id]) #🔴params[:][:]は絶対送られてきたviewここでいうorderのnew 、(フォームから送られてきた値)が[:][:]ここに入る?
      @order.postal_code=@address.postal_code
      @order.address=@address.address
      @order.name=@address.name
      
    elsif params[:order][:select_address]=="2" 
      @order.postal_code=params[:order][:postal_code]
      @order.address=params[:order][:address]
      @order.name=params[:order][:name]
    end 
    
   @order.order_status="waiting" #変数@orderのorder_statusカラムに”入金待ち(英語)”を代入する→他のpostal_codeカラムと同じようにviewのhidden_fieldに入れる
   end
  
  def thanks
  
  end  
  
  def index
    @customer=current_customer
    #@orders=@customer.orders.includes(:order_details)
    @orders=current_customer.orders #この一文でいける　throughの記述さえすれば中間テーブル難しく考える必要はない
    #まずどのコントローラでもcurrent_customerはわざわざ定義しないで文に入れ込んじゃっていい　　モデルのthroughtの記述は絶対必要
     
  end
  
  def show
    @order=Order.find(params[:id])
    #@order=current_customer.orders #ある一人のさらにその詳細画面だからこの記述は使えない
    #@orders=@customer.orders.includes(:order_details,:items)
    @order_items=Order.find(params[:id]).order_details
    @order_postage=800
    
    
    
  end 
  
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method,:postal_code,:address,:name,:billing_amount,:postage,:order_status)#ここに入っているものしか受付ないから絶対に足さないといけない
  end
end