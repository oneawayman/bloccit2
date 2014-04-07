Bloccit2::Application.routes.draw do

  devise_for :users

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:update]

  get 'about', to: 'welcome#about', as: 'about'
  
  root to: 'welcome#index'
  end
