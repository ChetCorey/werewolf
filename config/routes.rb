Rails.application.routes.draw do
  resources :players
  get '/kill_user' => 'users#kill_user' # or match for older Rails versions
  get '/select_user' => 'users#select_user' # or match for older Rails versions
  get '/new_game' => 'users#new_game' # or match for older Rails versions
  post '/new_game' => 'users#new_game' # or match for older Rails versions
  get '/start_game' => 'users#start_game' # or match for older Rails versions
end
