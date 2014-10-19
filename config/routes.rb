Blocit::Application.routes.draw do

  get 'comments/create'

  devise_for :users

  resources :topics do
    resources :posts, except: [:index]
  
    resources :posts do
     resources :comments, only: [:create, :destroy]
    end

  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

  resources :users, only: [:update]

end