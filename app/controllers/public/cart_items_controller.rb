class Public::CartItemsController < ApplicationController
  def new
    ðº#cart_itemã¯itemã®å­ãªã®ã«ã¢ã½ã·ã¨ã¼ã·ã§ã³ã®è¨è¿°ãã¦ãªã
    
  end
  
  def create
    
    if @cart_item=CartItem.find_by(item_id:params[:cart_item][:item_id],customer_id:current_customer.id)#ãã§ã«ã«ã¼ãã«ããå ´åã®å¦çãï¼ cart_itemã¯ãªãã¦ãããðº
    @new_amount=@cart_item.amount+params[:cart_item][:amount].to_i #@new_amountã¯ãã ã®å·¦å³åããã¦ã§ããæ°ãå·¦ãåãã«ã¼ãã«ããæ°ããå³ããã©ã¼ã ããéããã¦ããæ°
    @cart_item.update(amount: @new_amount) 

    else 
    @cart_item=CartItem.new(cart_items_params) #ãã®2è¡ã¯ãªãå ´åã®å¦çã ããelseã«æ¸ã
    @cart_item.customer_id=current_customer.id #ãã®ä¸æããªãã¨èª°ã®ã«ã¼ãåååãããããªãã¾ãæç¨¿ããã¨ãã¯å¿ãæ¸ããã«ã©ã ãå¨ã¦æç¨¿ããªãã¨ãããªã#å­ã¢ãã«ã ããè¦ªèª°ãªã®ãã¢ã½ã·ã¨ã¼ã·ã§ã³ããðº
    #ä¸ã®ä¸æã¯ã¨ã³ã¸ãã¢ãæ¸ããã¤?
    @cart_item.save
    end
    redirect_to cart_items_path
  end   

  def index
    @customer=current_customer #2 âã®@customerã®ã¤ã³ã¹ã¿ã³ã¹ãå®ç¾©ããã¦ããªãããå®ç¾©ãã¦ããã
    @cart_items=@customer.cart_items#ï¼ããä¼å¡ã®ä¸è¦§ãè¡¨ç¤ºãããããallããã ã
    @sum=0 #åè¨éé¡ç¨ã®å¥ãç© viewã«æ¸ãã¦ããã
    
   
  end
  
  

 #editã³ã³ãã­ã¼ã©ã¯ãããªããæ°éã®å¤æ´ã ããããå°ç¨ã®ãã¼ã¸ãããã°ãããä»åãªããããeditã³ã³ãã«ã¤ã³ã¹ã¿ã³ã¹æ¸ããã¨ããã§edit viewã¯ä½ãæ¸ãã¦ãªãããæ¸ãã¦ãæå³ãªã
  
    def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(cart_items_params)
    redirect_to cart_items_path
    
    end
    
    def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
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

#if CartItem.find_byï¼item_id:@cart_item.item_id,customer_id:@cart_item.customer_id)
      
#customer_id ããªãã¨AãããããªãBãããè²·ã£ã¦ãAããã®ã«ã¼ãã«å¥ã£ããã¨ã«ãªã£ã¦ãã¾ãå¨é¨elseã®å¦çã«ãªã£ã¦ãã¾ã
#item_id customer_idã¯å¼æ°find byã¯ã«ã©ã ï¼å¤ã§ãã#CartItem å¤§æå­ã¯ã¢ãã«ããå¼ã³åºãã¦ã
      