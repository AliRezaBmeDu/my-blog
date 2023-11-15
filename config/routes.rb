Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  
  get '/users', to: 'users#index', as: :users
  get '/users/:id', to: 'users#show', as: :user
  get '/users/:id/posts', to: 'posts#index', as: :user_posts
  get '/users/:user_id/posts/new', to: 'posts#new', as: :new_user_post
  get '/users/:user_id/posts/:id', to: 'posts#show', as: :user_post

  resources :users, only: [:index, :show, :new] do
    resources :posts do
      member do
        post 'like', to: 'likes#create'
      end
      resources :comments
    end
  end

  resources :likes, only: [:create]

  authenticated :user do
    root to: 'users#index', as: :authenticated_root
  end

  devise_scope :user do
    root to: "devise/sessions#new", as: :sign_in_root
  end

  # root 'users#index'
end
