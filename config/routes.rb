Bloccit2::Application.routes.draw do

  get "comments/create"
  devise_for :users

  resources :topics do
    resources :posts, except: [:index]
      resources :comments, only: [:create]
  end

  resources :users, only: [:update]

  get 'about', to: 'welcome#about', as: 'about'
  
  root to: 'welcome#index'
  end
