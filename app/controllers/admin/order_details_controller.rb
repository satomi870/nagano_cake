class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail=OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    if @order_detail.making_status=="manufacturing" #注文はひとつだけだからeach文はいらない
    @order_detail.order.update(order_status: "paid_up")  #order.updateだけだとorderの定義がないから@order_detailas.を書きアソシエーションにすることでorderの定義ができる
    end
    if@order_detail.making_status=="finish"
    @order_detail.order.update(order_status:"preparing")  
    end
    redirect_to admin_order_path(@order_detail.order.id)#こっちもorderページに行きたいから（@order_detail）ではダメ アソシエーションの記述をする だけど(order.id)だけだとorderの定義をこっちのページにしてないから@order_detailをつける
    #(@order_detail.order.id)こういう記述はmodelにアソシエーションの記述した時だけ使える(@order_detail.order.id)これだけではアソシエーションしたことにならない
  end
  def order_detail_params
     params.require(:order_detail).permit(:making_status)
  end    
end