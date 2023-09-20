require 'sidekiq/web'

Rails.application.routes.draw do
  root 'games#index'
  resources :game_results, only: :index
  resources :games, only: %i[index create]

  resources :users, only: [:new, :create]
  get "/login", to: "users#login_form"
  post "/login", to: "users#login"
  get '/create_account', to: 'users#new', as: 'create_account'

  resources :session, only: [:destroy]
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  post 'games/submit_result', to: 'games#submit_result'
  get 'games/clear_state', to: 'games#clear_state' if Rails.env.development?

  mount Sidekiq::Web => '/sidekiq'

end
