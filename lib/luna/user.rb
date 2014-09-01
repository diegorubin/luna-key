module Luna
  class User

    CURRENT_API_USER = '/api/v1/users'
    CURRENT_API_SESSION = '/api/v1/sessions'
  
    attr_accessor :email, :token
    attr_reader :id
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
      @service.post do |req|
        req.url CURRENT_API_SESSION
        req.body = {email: @email, password: password}
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

