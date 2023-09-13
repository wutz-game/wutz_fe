Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    resources :challenges, only: [:index]
    resources :user_games, only: [:create]
  end
  root 'welcome#index'
  resources :games, only: %i[index show create]
end
