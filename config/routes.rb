Rails.application.routes.draw do
  resources :players
  get '/players_circle' => 'players#circle' # or match for older Rails versions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
