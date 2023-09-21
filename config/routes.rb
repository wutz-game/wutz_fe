require 'sidekiq/web'

Rails.application.routes.draw do
  root 'games#index'
  resources :game_results, only: :index
  resources :games, only: %i[index create]
  post 'games/submit_result', to: 'games#submit_result'
  get 'games/clear_state', to: 'games#clear_state'

  resources :users, only: [:new, :create]
  get "/login", to: "users#login_form"
  post "/login", to: "users#login"
  get '/create_account', to: 'users#new', as: 'create_account'
  get '/logout', to: 'users#destroy'

  resources :mailers, only: [:create]
  mount Sidekiq::Web => '/sidekiq'
end
