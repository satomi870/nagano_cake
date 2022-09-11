Rails.application.routes.draw do
    
 
 
  
 
  scope module: :public do
    get'customers/quit'=>  'customers#quit'
    patch'customers/out'=> 'customers#out'
    resource :customers,only:[:show ,:edit,:update]
    resources :addresses,only:[:create, :index,:edit,:update,:destroy]
    resources :items,only:[:new, :create, :index, :show ,:edit,:update]
    resources :cart_items,only:[:new, :create, :index, :show ,:edit,:update,:destroy]
    post 'orders/confirm'=>'orders#confirm'
    get 'orders/thanks'=>'orders#thanks'
    resources :orders,only:[:new, :create, :index, :show ,:edit,:update,:destroy]
    delete 'cart_items/destroy_all' =>'cart_items#destroy_all' , as: 'all'
  end
  

  
  

  namespace :admin do
     resources :orders,only:[:new, :create, :index, :show ,:update]
     resources :customers,only:[ :create, :index, :show ,:edit,:update]
     resources :items,only:[:new, :create, :index, :show ,:edit,:update]
     resources :genres,only:[:create, :index, :edit,:update]
     resources :order_details,only:[:index, :show,:update]
  end
  
  
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :public do
    get 'homes/top'
    get 'homes/about',as:'about'
  end
 
end  