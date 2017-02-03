Rails.application.routes.draw do
  resources :games do
    resources :players
  end
  get '/kill_user' => 'users#kill_user' # or match for older Rails versions
  get '/select_user' => 'users#select_user' # or match for older Rails versions
  get '/new_game' => 'users#new_game' # or match for older Rails versions
  post '/new_game' => 'users#new_game' # or match for older Rails versions
  get 'games/:id/start', to: 'games#start' # or match for older Rails versions

end
