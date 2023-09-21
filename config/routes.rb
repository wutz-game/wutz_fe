require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    resources :challenges, only: [:index]
    resources :user_games, only: [:create]
  end

  root 'games#index'
  resources :game_results, only: :index
  resources :games, only: %i[index create]
  post '/game_results', to: 'game_results#submit'
  get 'games/clear_state', to: 'games#clear_state'

  resources :users, only: [:new, :create]
  get "/login", to: "users#login_form"
  post "/login", to: "users#login"
  get '/create_account', to: 'users#new', as: 'create_account'
  get '/logout', to: 'users#destroy'

  resources :mailers, only: [:create]
  mount Sidekiq::Web => '/sidekiq'
end
