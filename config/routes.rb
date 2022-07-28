Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  devise_for :users
  resources :login, only: [:index, :show] do
  end 
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
end
