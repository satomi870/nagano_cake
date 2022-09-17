Rails.application.routes.draw do
    
 
 
  
 
  namespace :admin do
    get 'homes/top'
  end
  scope module: :public do
    root to:'homes#top' #どういうURLに飛ぶかは決まってるからアクション先だけ書く
    get 'about'=>'homes#about'#左側は勝手に決めていい
    get'customers/quit'=>  'customers#quit'
    patch'customers/out'=> 'customers#out'
    resource :customers,only:[:show ,:edit,:update]
    resources :addresses,only:[:create, :index,:edit,:update,:destroy]
    resources :items,only:[:index, :show]
    delete 'cart_items/destroy_all' =>'cart_items#destroy_all'
    resources :cart_items,only:[:create, :index,:update,:destroy]
    post 'orders/confirm'=>'orders#confirm'
    get 'orders/thanks'=>'orders#thanks'
    resources :orders,only:[:new, :create, :index,:show]
  end
  

  
  

  namespace :admin do
     root to:"homes#top"
     resources :orders,only:[:show ,:update]
     resources :customers,only:[ :index, :show ,:edit,:update]
     resources :items,only:[:new, :create, :index, :show ,:edit,:update]
     resources :genres,only:[:create, :index, :edit,:update]
     resources :order_details,only:[:update]
  end
  
  
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

end