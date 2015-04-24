Rails.application.routes.draw do
  get 'sessions/new'

  post 'sessions/create'

  get 'sessions/destroy'

  resources :users

  root to: 'users#new'
  
end
