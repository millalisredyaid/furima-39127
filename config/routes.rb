Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  #root to: "furimas#index"
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:edit, :update]
  resource :session, only: [:new, :create, :destroy]
  resources :categories, only: :index

  resources :items do
    collection do
      get 'search'
    end
  end
end

