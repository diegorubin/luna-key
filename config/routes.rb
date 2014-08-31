Rails.application.routes.draw do
  get '/open', to: 'luna_oauth/sessions#new', as: 'open_session'
end

