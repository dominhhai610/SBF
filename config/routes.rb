Rails.application.routes.draw do


  get 'session/new'

  resources :users
  resources :micropots
  resources :like_pros
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  #root 'application#testJson'
  #root 'application#index'
  #get 'static_pages/home'
  #get 'static_pages/help'
  # root 'application#userJson1'
  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  # get 'login'   => 'static_pages#login'
  get 'users'   =>'users'
  get 'signup'  => 'users#new'
  get 'edit'    => 'users#edit'
  get 'login'   => 'session#new'
  post 'login'   => 'session#create'
  # delete 'logout' => 'session#destroy'
  get 'logout' => 'session#destroy'

  put 'like'    => 'like_pros#update'
  put 'unlike'  => 'like_pros#update'


end
