Rails.application.routes.draw do

  devise_for :users
  resources :posts

  get 'about' => 'welcome#about'
  get 'me' => 'welcome#about'

  root to: 'welcome#index'
  
end
