require 'faraday_middleware'

module Luna
  class User

    CURRENT_API_USER = '/api/v1/users'
    CURRENT_API_SESSION = '/api/v1/sessions'
  
    attr_accessor :id, :email, :token, :remember_me
    attr_reader :error
    attr_writer :password, :password_confirmation
  
    def initialize(attributes = {})
      from_hash(attributes)
    end
  
    def create
      @service ||= User.connection
      @service.post do |req|
        req.url CURRENT_API_USER
        req.body = as_json
      end
    end

    def auth(password)
      @service ||= User.connection
      response = @service.post do |req|
        req.url CURRENT_API_SESSION
        req.body = {email: @email, password: password}
      end

      if response.body.kind_of?(Hash)
        if response.body['status'] == 'ok'
          @token = response.body['token']
          @id = response.body['id']
          return true
        else
          @error = response.body['status']
        end
      else
        @error = 'wrong_response_type'
      end

      false

    end

    def logout
      @service ||= User.connection
      response = @service.delete do |req|
        req.url CURRENT_API_SESSION
        req.body = {token: @token}
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

    def self.from_token(token)
      service = connection

      response = service.post do |req|
        req.url CURRENT_API_USER + '/' + token
        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end

      if response.body['status'] == 'ok'
        User.new(
          token: token, 
          email:  response.body['user']['email'],
          id:  response.body['user']['id']
        )
      end
    end

    def self.connection
      Faraday.new(url: Luna::Config.host) do |faraday|
        faraday.request :url_encoded
        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end
    end

  end

end

