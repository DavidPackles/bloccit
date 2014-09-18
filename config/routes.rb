Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/me'

  root to: 'welcome#index'
  
end
