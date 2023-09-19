Rails.application.routes.draw do
  root 'games#index'
  resources :games, only: %i[index create]
  post 'games/submit_result', to: 'games#submit_result'
end
