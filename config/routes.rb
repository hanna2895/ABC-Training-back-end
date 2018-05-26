Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :admins
  resources :clients
  resources :groups
  resources :students
  resources :sessions

  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
