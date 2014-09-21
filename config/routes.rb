Rails.application.routes.draw do

  resources :posts

  get 'about' => 'welcome#about'
  get 'me' => 'welcome#about'

  root to: 'welcome#index'
  
end
