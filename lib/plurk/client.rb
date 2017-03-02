module Plurk
  class Client
    attr_reader :consumer, :access_token

    OAUTH_OPTIONS = {
      site:               "http://www.plurk.com",
      request_token_path: "/OAuth/request_token",
      access_token_path:  "/OAuth/access_token",
      authorize_path:     "/OAuth/authorize"
    }

    def initialize(key, secret)
      @key, @secret = key, secret
      @consumer = OAuth::Consumer.new(@key, @secret, OAUTH_OPTIONS)
      @access_token = OAuth::AccessToken.new(@consumer, nil, nil)
    end
  end
end
