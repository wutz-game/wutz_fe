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
  post 'games/submit_result', to: 'games#submit_result'
  get 'games/clear_state', to: 'games#clear_state'

  resources :users, only: [:new, :create]
  get "/login", to: "users#login_form"
  post "/login", to: "users#login"
  get '/create_account', to: 'users#new', as: 'create_account'
end
