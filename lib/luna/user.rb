module Luna
  class User

    CURRENT_API_USER = '/api/v1/users'
  
    attr_accessor :email, :token
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
  
  end
end

