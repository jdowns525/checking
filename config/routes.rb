Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'likes/create'
  get 'likes/destroy'
  get 'comments/create'
  get 'comments/destroy'
  get 'users/show'
  devise_for :users

  resources :users, only: [:show] do
    member do
      get :following, :followers
    end
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
  
  root 'posts#index'
end
