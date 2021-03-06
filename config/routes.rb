Rails.application.routes.draw do
  root to: 'toppages#index'
  
  #user登録
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  
  #follow
  resources :relationships, only: [:create, :destroy]
  
  #favorite
  resources :favorites, only: [:create, :destroy]
  
  #login
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #menu
  resources :menus do
    #comment
    resources :comments, only: [:create, :destroy]
  end
  
end