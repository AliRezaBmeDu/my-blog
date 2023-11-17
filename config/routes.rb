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

  post 'api/users/:user_id/posts/:post_id/comments/new', to: 'api/api_comments#create', as: :add_new_comment_api
  namespace :api do
    resources :users, only: [:index], controller: 'api_users' do
      resources :posts, only: [:index], controller: 'api_posts' do
        resources :comments, only: [:index, :create], controller: 'api_comments'
      end
    end
  end
end
