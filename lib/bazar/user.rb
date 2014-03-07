module Bazar
  class User

    CURRENT_API_USER = '/api/v1/users'
  
    attr_accessor :email, :token
    attr_writer :password, :password_confirmation
  
    def initialize(attributes = {})
      from_hash(attributes)
      @service = Faraday.new(url: Bazar::Config.host)
    end
  
    def create
      @service.post do |req|
        req.url CURRENT_API_USER
        req.headers['Content-Type'] = 'application/json'
        req.body = as_json
      end
    end
  
    def from_hash(attributes)
      attributes.each do |attribute, value|
        send("#{attribute}=", value)
      end
    end
  
    def as_json
      {
        email: @email, password: @password,
        password_confirmation: @password_confirmation
      }
    end
  
  end
end

