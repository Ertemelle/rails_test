Rails.application.routes.draw do
  get 'sessions/new'
  root to:'static_pages#home', as: 'home'
  get '/club', to: 'static_pages#club', as: 'club'
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
