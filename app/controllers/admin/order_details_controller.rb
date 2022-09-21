class Admin::OrderDetailsController < ApplicationController
    def update
      @order_detail=OrderDetail.find(params[:id])
      @order=@order_detail.order
      @order_detail.update(order_detail_params)
      if @order_detail.making_status=="manufacturing" #注文はひとつだけだからeach文はいらない
         @order.update(order_status: "paid_up")  #order.updateだけだとorderの定義がないから@order_detailas.を書きアソシエーションにすることでorderの定義ができる
      end
      @order_details=@order.order_details#9行目の後ろのorder_details定義してないから使えないじゃんと思うがアソシエーション（has manyとか）だから定義してなくていい９行目の最初の@order_detailは変数だから絶対定義しないとエラーになる　
      puts @order_details.nil?
      #@order_details = ["impossible_manufacture", "waiting_manufacture", "manufacturing", "finish"]
      if @order_details.all? { |w| w.making_status =="finish" }#wは@order_detaisを一つずつ取り出したやつ
        @order.update(order_status:"preparing")  
      end
      
      redirect_to admin_order_path(@order.id)#こっちもorderページに行きたいから（@order_detail）ではダメ アソシエーションの記述をする だけど(order.id)だけだとorderの定義をこっちのページにしてないから@order_detailをつける
      #(@order_detail.order.id)こういう記述はmodelにアソシエーションの記述した時だけ使える(@order_detail.order.id)これだけではアソシエーションしたことにならない
    end
def order_detail_params
 params.require(:order_detail).permit(:making_status)
end    
end
 