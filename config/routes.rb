Rails.application.routes.draw do
 
  namespace :public do
    get 'homes/top'
    get 'homes/about',as:'about'
  end
  
  namespace :admin do
    resources :customers,only:[:new, :create, :index, :show ,:edit,:update]
  end
  namespace :admin do
    resources :items,only:[:new, :create, :index, :show ,:edit,:update]
    
  end
  namespace :admin do
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
end
