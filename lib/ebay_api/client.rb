module EbayAPI
  class Client
    include HTTParty

    SITE_IDS = {
      "0"   => "EBAY-US",
      "2"   => "EBAY-ENCA",
      "3"   => "EBAY-GB",
      "15"  => "EBAY-AU",
      "16"  => "EBAY-AT",
      "23"  => "EBAY-FRBE",
      "71"  => "EBAY-FR",
      "77"  => "EBAY-DE",
      "100" => "EBAY-MOTOR",
      "101" => "EBAY-IT",
      "123" => "EBAY-NLBE",
      "146" => "EBAY-NL",
      "186" => "EBAY-ES",
      "193" => "EBAY-CH",
      "201" => "EBAY-HK",
      "203" => "EBAY-IN",
      "205" => "EBAY-IE",
      "207" => "EBAY-MY",
      "210" => "EBAY-FRCA",
      "211" => "EBAY-PH",
      "212" => "EBAY-PL",
      "216" => "EBAY-SG"
    }.freeze

    def self.default_options
      Thread.current["EbayAPI"] || raise("Session has not been activated yet")
    end

    def self.default_client_options
      {
        parser:  HTTParty::Parser,
        format:  :xml,
        sandbox: false
      }
    end

    def self.default_headers
      {
        "Content-Type" => 'text/xml',
        "X-EBAY-API-COMPATIBILITY-LEVEL" => "967",
        "X-EBAY-API-SITEID" => "0",
        "X-EBAY-SOA-GLOBAL-ID" => "EBAY-US"
      }
    end

    def initialize(client_id, client_secret, options = {})
      session_options = self.class.default_client_options
      session_options[:client_id] = client_id
      session_options[:client_secret] = client_secret
      session_options[:refresh_token] = options[:refresh_token]
      session_options[:access_token] = options[:access_token]
      session_options[:sandbox] = options[:sandbox] if options[:sandbox].present?
      session_options[:headers] = self.class.default_headers.merge(
        {
          "X-EBAY-API-IAF-TOKEN" => options[:access_token],
          "X-EBAY-API-SITEID"    => options[:site_id],
          "X-EBAY-SOA-GLOBAL-ID" => SITE_IDS[options[:site_id]]
        }
      )
      Thread.current["EbayAPI"] = session_options
    end

    def self.perform_request(http_method, path, options = {}, &block)
      response = ActiveSupport::Notifications.instrument("request.ebay_api") do |payload|
        payload[:method]        = http_method::METHOD.downcase
        payload[:request_uri]   = path
        payload[:request_body]  = options[:body]
        payload[:response_body] = super
      end
      raise_error(response.values.first['Errors'])
      response.parsed_response
    end

    def self.raise_error(errors)
      return if errors.nil?

      errors = Array.wrap(errors)
      raise EbayAPI::Error.new(errors.first)
    end

    def self.authentication_url
      if default_options[:sandbox]
        'https://api.sandbox.ebay.com/identity/v1/oauth2/token'
      else
        'https://api.ebay.com/identity/v1/oauth2/token'
      end
    end

    def self.refresh_token!
      oauth_client = OAuth2::Client.new(
        default_options[:client_id],
        default_options[:client_secret],
        token_url:   authentication_url,
        auth_scheme: 'basic_auth'
      )

      new_oauth_token = fetch_new_oauth_token(oauth_client)
      new_session_options = Thread.current["EbayAPI"]
      new_headers = new_session_options[:headers]
      new_headers['X-EBAY-API-IAF-TOKEN'] = new_oauth_token.token
      new_session_options[:access_token] = new_oauth_token.token
      new_session_options[:refresh_token] = new_oauth_token.refresh_token

      Thread.current["EbayAPI"] = new_session_options

      {
        access_token: new_oauth_token.token,
        refresh_token: new_oauth_token.refresh_token,
        expires_at: new_oauth_token.expires_at
      }
    end

    def self.fetch_new_oauth_token(oauth_client)
      api_scopes = %w[
        https://api.ebay.com/oauth/api_scope
        https://api.ebay.com/oauth/api_scope/sell.marketing.readonly
        https://api.ebay.com/oauth/api_scope/sell.marketing
        https://api.ebay.com/oauth/api_scope/sell.inventory.readonly
        https://api.ebay.com/oauth/api_scope/sell.inventory
        https://api.ebay.com/oauth/api_scope/sell.account.readonly
        https://api.ebay.com/oauth/api_scope/sell.account
        https://api.ebay.com/oauth/api_scope/sell.fulfillment.readonly
        https://api.ebay.com/oauth/api_scope/sell.fulfillment
        https://api.ebay.com/oauth/api_scope/sell.analytics.readonly
        https://api.ebay.com/oauth/api_scope/sell.finances
        https://api.ebay.com/oauth/api_scope/sell.payment.dispute
        https://api.ebay.com/oauth/api_scope/commerce.identity.readonly
      ];

      OAuth2::AccessToken.new(
        oauth_client, default_options[:access_token], refresh_token: default_options[:refresh_token]
      ).refresh!(scope: api_scopes.join(' '))
    end
  end
end
