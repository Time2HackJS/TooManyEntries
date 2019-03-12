Rails.application.routes.draw do
  get '/main', action: 'main', controller: 'titles'
  get '/create', action: 'create', controller: 'titles'
  get 'titles/entryadd', action: 'entryadd', controller: 'titles'
  get 'titles/entrydelete', action: 'entrydelete', controller: 'titles'
  root 'sessions#index'
  get '/index', action: 'index', controller: 'sessions'
  resources :users
  resources :titles
  resources :entry_path
  get '/sign_up', action: 'sign_up', controller: 'sessions'
  post '/auth', action: 'auth', controller: 'sessions'
  get '/log_out', action: 'logout', controller: 'sessions'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
