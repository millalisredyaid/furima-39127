Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  #root to: "furimas#index"

  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]

  resources :items do
    collection do
      get 'search'
    end
  end
end

