Rails.application.routes.draw do
  devise_for :users
  get '/users', to: 'users#index', as: :users
  get '/users/:id', to: 'users#show', as: :user
  get '/users/:id/posts', to: 'posts#index', as: :user_posts
  get '/users/:user_id/posts/new', to: 'posts#new', as: :new_user_post
  get '/users/:user_id/posts/:id', to: 'posts#show', as: :user_post
  
  root to: 'devise/sessions#new'

  # For authenticated users, redirect to the homepage
  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end

  resources :users do
    resources :posts do
      member do
        post 'like', to: 'likes#create'
      end
      resources :comments
    end
  end
  resources :likes, only: [:create]

  root "users#index"
end
