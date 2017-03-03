module Plurk
  class Client
    attr_reader :consumer, :access_token

    OAUTH_OPTIONS = {
      site:               "http://www.plurk.com",
      request_token_path: "/OAuth/request_token",
      access_token_path:  "/OAuth/access_token",
      authorize_path:     "/OAuth/authorize"
    }

    def self.config_file_path
      ENV["PLURK_CONFIG_FILE"] || File.join(ENV['HOME'], '.plurk')
    end

    def initialize(key, secret)
      @key, @secret = key, secret
      @consumer = OAuth::Consumer.new(@key, @secret, OAUTH_OPTIONS)
      @access_token = OAuth::AccessToken.new(@consumer, nil, nil)
    end

    def authorize
      puts "Auto open browser for you."
      puts "Authorize url: #{authorize_url}"

      # undefined method ask
      puts "Enter Verification Number:"
      oauth_verifier = gets.chomp

      get_access_token(oauth_verifier)
    end

    def request_token
      @request_token ||= @consumer.get_request_token
    end

    def authorize_url
      request_token.authorize_url
      Launchy.open(request_token.authorize_url)
    end

    def get_access_token(oauth_verifier)
      @access_token = request_token.get_access_token(oauth_verifier: oauth_verifier)

      File.open(Plurk::Client.config_file_path, 'w') do |f|
        f.puts @key
        f.puts @secret
        f.puts access_token.token
        f.puts access_token.secret
      end
    end
  end
end
