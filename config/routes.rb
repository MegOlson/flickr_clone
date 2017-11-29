Rails.application.routes.draw do
  root to: 'images#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :images do
    resources :categories, only: [:create, :update, :destroy]
    resources :favorites, only: [:create, :destroy]
  end
  resources :categories
  resources :users, only: [:show] do
    resources :favorites, only: [:index]
    resources :images, only: [:index]
  end
end
