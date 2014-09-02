Luna::Engine.routes.draw do
  get '/open', to: 'sessions#new', as: 'open_session'
  post '/open', to: 'sessions#create'
end

