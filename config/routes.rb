Rails.application.routes.draw do
  devise_for :users
  resources :genres do
    resources :samples, only: [:new, :create, :destroy]
  end
  resource :search, only: [:show]
  root to: 'genres#index'
end
