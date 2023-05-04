Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get '/items/new', to: 'items#new' 
  
  resources :items, only: [:new, :create]
end

