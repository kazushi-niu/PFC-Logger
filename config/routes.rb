Rails.application.routes.draw do
  root to: 'toppages#index'
  
  #user登録
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  
  #login
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end