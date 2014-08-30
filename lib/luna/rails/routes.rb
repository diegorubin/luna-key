module ActionDispatch::Routing
  class Mapper
    get '/open', to: 'luna_oauth/sessions#new', as: 'open_session'
  end
end

