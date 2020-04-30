module EbayAPI
  class Client
    include HTTParty

    def self.default_options
      Thread.current["EbayAPI"] || raise("Session has not been activated yet")
    end

    def self.default_client_options
      {
        parser:  HTTParty::Parser,
        format:  :json,
        # sandbox: false
        sandbox: true
      }
    end

    def self.default_headers
      {
        "Accept"           => "application/json",
        "Content-Type"     => "application/json",
        "Content-Language" => "en-US"
      }
    end

    def self.auto_init
      token="";
      self.new('asdf', 'asdf', access_token: token)
    end

    def initialize(client_id, client_secret, options = {})
      session_options = self.class.default_client_options
      session_options[:sandbox] = options[:sandbox] if options[:sandbox].present?
      session_options[:headers] = self.class.default_headers.merge(
        { "Authorization" => "Bearer #{ options[:access_token] }" }
      )
      Thread.current["EbayAPI"] = session_options
    end

    def self.perform_request(http_method, path, options = {}, &block)
      ActiveSupport::Notifications.instrument("request.ebay_api") do |payload|
        payload[:method]        = http_method::METHOD.downcase
        payload[:request_uri]   = path
        payload[:request_body]  = options[:body]
        payload[:response_body] = super
      end
    end
  end
end
