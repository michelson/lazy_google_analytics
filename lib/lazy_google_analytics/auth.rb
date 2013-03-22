module LazyGoogleAnalytics
  class Auth

    attr_accessor :analytics

    def initialize(config)
      @key = Google::APIClient::PKCS12.load_key(config.key_file, config.pass_phrase)
      @asserter = Google::APIClient::JWTAsserter.new( config.email, config.scope, @key)
    end

    def authorize
      #Do stuff
      client = Google::APIClient.new()
      client.authorization = @asserter.authorize()
      @analytics = client.discovered_api("analytics",'v3')
    end

  end
end

