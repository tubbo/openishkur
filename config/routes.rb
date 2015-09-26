Rails.application.routes.draw do
  devise_for :users
  resources :genres, except: [:edit, :update] do
    resources :revisions, only: [:new, :create, :update]
    resources :samples, only: [:new, :create, :destroy]
  end
  resource :search, only: [:show]
  root to: 'genres#index'
end
