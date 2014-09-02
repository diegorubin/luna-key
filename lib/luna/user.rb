require 'faraday_middleware'

module Luna
  class User

    CURRENT_API_USER = '/api/v1/users'
    CURRENT_API_SESSION = '/api/v1/sessions'
  
    attr_accessor :email, :token
    attr_reader :id, :error
    attr_writer :password, :password_confirmation
  
    def initialize(attributes = {})
      from_hash(attributes)
    end
  
    def create
      @service = connection
      @service.post do |req|
        req.url CURRENT_API_USER
        req.body = as_json
      end
    end

    def auth(password)
      @service = connection
      response = @service.post do |req|
        req.url CURRENT_API_SESSION
        req.body = {email: @email, password: password}
      end

      if response.body.kind_of?(Hash)
        if response.body['status'] == 'ok'
          token = response.body['token']
          id = response.body['id']
          return true
        else
          @error = response.body['status']
        end
      else
        @error = 'wrong_response_type'
      end

      false

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

    private
    def connection
      @service ||= Faraday.new(url: Luna::Config.host) do |faraday|
        faraday.request :url_encoded
        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end
    end

    def id=(value)
      @id = value
    end
  
  end
end

