class Admin::OrdersController < ApplicationController
  

  def show
    @sum=0
    @postage=800
    @order=Order.find(params[:id])
    @order_details=@order.order_details
  end

  def update
    @order=Order.find(params[:id])
    @order.update(order_params)
  if @order.order_status == "confirmation"#連動の書き方は最初にもしこうならこうするという結果を最初にかくとわかりやすい (16と１９）
      @order_details=@order.order_details #したの＠order_detailsだけだと定義がないからだめ
      @order_details.each do |order_detail| #何に対してupdateするのか書かないといけない(order_detailsに対して) 一回のupdateでは一つしかupdateできない order_details は複数だから(なぜなら一つの注文にいっぱいあるから)each文で一つずつupdateする
      order_detail.update(making_status: "waiting_manufacture")
    end 
  end
    redirect_to admin_order_path(@order)
  end
  
  def order_params
    params.require(:order).permit(:order_status)
  end
  
end 