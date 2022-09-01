Rails.application.routes.draw do
    
 
  scope module: :public do
    resources :items,only:[:new, :create, :index, :show ,:edit,:update]
    resources :cart_items,only:[:new, :create, :index, :show ,:edit,:update,:destroy]
    post 'orders/confirm'=>'orders#confirm'
    resources :orders,only:[:new, :create, :index, :show ,:edit,:update,:destro]
    delete 'cart_items/destroy_all' =>'cart_items#destroy_all' , as: 'all'
  end
  

  
  

  namespace :admin do
     resources :orders,only:[:new, :create, :index, :show ,:edit,:update]
     resources :customers,only:[:new, :create, :index, :show ,:edit,:update]
     resources :items,only:[:new, :create, :index, :show ,:edit,:update]
     resources :genres,only:[:new, :create, :index, :edit,:update]
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