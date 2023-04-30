Rails.application.routes.draw do
  devise_for :users

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :posts do
    resources :comments, except: [:index, :show]
    resources :likes, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]

  root 'posts#index'
end
