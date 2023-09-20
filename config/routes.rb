Rails.application.routes.draw do
  root 'games#index'
  resources :game_results, only: :index
  resources :games, only: %i[index create]
  post 'games/submit_result', to: 'games#submit_result'

  get 'games/clear_state', to: 'games#clear_state' if Rails.env.development?
end
