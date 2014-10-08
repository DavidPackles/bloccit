Blocit::Application.routes.draw do

  devise_for :users

   resources :topics do
     resources :posts, except: [:index]
   end

  get 'about' => 'welcome#about'
  get 'me' => 'welcome#me'

  root to: 'welcome#index'

  resources :users, only: [:update]

end