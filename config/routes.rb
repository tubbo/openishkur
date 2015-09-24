Rails.application.routes.draw do
  devise_for :users
  resources :genres do
    resources :samples, only: [:create, :destroy]
  end
  root to: 'genres#index'
end
