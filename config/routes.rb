require 'sidekiq/web'

Rails.application.routes.draw do
  root 'games#index'
  resources :games, only: %i[index create]

  # mailer stuff
  get "/sent", to: "mailers#sent"
  resources :mailers, only: [:create]

  mount Sidekiq::Web => '/sidekiq'
end
