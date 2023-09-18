Rails.application.routes.draw do
  root 'games#index'
  resources :games, only: %i[index create]

  resources :users, only: [:new, :create]
  get "/login", to: "users#login_form"
  post "/login", to: "users#login"
  get '/create_account', to: 'users#new', as: 'create_account'
end
