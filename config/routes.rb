Bloccit2::Application.routes.draw do

  devise_for :users
  resources :posts

  get 'about', to: 'welcome#about', as: 'about'
  
  root to: 'welcome#index'
  end
