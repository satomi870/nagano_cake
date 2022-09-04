class Public::CartItemsController < ApplicationController
  def new
    
  end
  
  def create
    
    if @cart_item=CartItem.find_by(item_id:params[:cart_item][:item_id],customer_id:current_customer.id)#すでにカートにある場合の処理　＠cart_itemはなくてもいい
    @new_amount=@cart_item.amount+params[:cart_item][:amount].to_i #@new_amountはただの左右合わせてできた数　左　元々カートにある数　　右　フォームから送られてきた数
    @cart_item.update(amount: @new_amount)    

    else 
    @cart_item=CartItem.new(cart_items_params) #この2行はない場合の処理だからelseに書く
    @cart_item.customer_id=current_customer.id #この一文がないと誰のカート内商品かわからないまた投稿するときは必ず書いたカラムを全て投稿しないといけない
    @cart_item.save
    end
    redirect_to cart_items_path
  end   

  def index
    @customer=current_customer #2 ↓の@customerのインスタンスが定義されていないから定義してあげる
    @cart_items=@customer.cart_items#１ある会員の一覧を表示したいからallじゃだめ
    @sum=0 #合計金額用の入れ物 viewに書いてもいい
    
   
  end
  
  

 #editコントローラはいらない　数量の変更だけをする専用のページがあればいるが今回ないから　editコントにインスタンス書いたところでedit viewは何も書いてないから書いても意味ない
  
    def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(cart_items_params)
    redirect_to cart_items_path
    
  end
 def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to cart_items_path
  end  
  
 def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
 end 
  
   def cart_items_params
    params.require(:cart_item).permit(:item_id,:amount)
   end
end

#if CartItem.find_by（item_id:@cart_item.item_id,customer_id:@cart_item.customer_id)
      
#customer_id がないとAさんじゃなくBさんが買ってもAさんのカートに入ったことになってしまう全部elseの処理になってしまう
#item_id customer_idは引数find byはカラム：値でかく#CartItem 大文字はモデルから呼び出してる
      