class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail=OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order_detail.order.id)#こっちもorderページに行きたいから（@order_detail）ではダメ アソシエーションの記述をする だけど(order.id)だけだとorderの定義をこっちのページにしてないから@order_detailをつける
  end  #(@order_detail.order.id)こういう記述はmodelにアソシエーションの記述した時だけ使える　(@order_detail.order.id)これだけではアソシエーションしたことにならない
 
  def order_detail_params
     params.require(:order_detail).permit(:making_status)
  end    
end