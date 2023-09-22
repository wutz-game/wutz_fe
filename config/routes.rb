Rails.application.routes.draw do
  root 'games#index'
  resources :game_results, only: :index
  resources :games, only: %i[index create]
  post '/game_results', to: 'game_results#submit'
  get 'games/clear_state', to: 'games#clear_state'

  resources :users, only: [:new, :create]
  get "/login", to: "users#login_form"
  post "/login", to: "users#login"
  get '/create_account', to: 'users#new', as: 'create_account'
end
