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
        # sandbox: false
        sandbox: true
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

    def self.auto_init
      token         = 'v^1.1#i^1#f^0#p^3#r^0#I^3#t^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'
      refresh_token = 'v^1.1#i^1#f^0#p^3#r^1#I^3#t^Ul4xMF8xMDpENjkzMEYxNzUwRkIzODRCRkY3OUJFN0FCRkUyQ0UyNl8wXzEjRV4xMjg0'
      client_id     = 'TradeGec-TradeGec-SBX-2196b7be0-3d4642fe';
      client_secret = 'SBX-196b7be0b40b-4544-40de-889e-2e8b';
      site_id       = "0"

      self.new(client_id, client_secret, access_token: token, refresh_token: refresh_token, site_id: site_id)
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
      begin
        response = ActiveSupport::Notifications.instrument("request.ebay_api") do |payload|
          payload[:method]        = http_method::METHOD.downcase
          payload[:request_uri]   = path
          payload[:request_body]  = options[:body]
          payload[:response_body] = super
        end
        raise_error(response.values.first['Errors'])
        response.parsed_response
      rescue EbayAPI::InvalidToken
        refresh_token!
        options[:headers]["X-EBAY-API-IAF-TOKEN"] = Thread.current["EbayAPI"][:headers]["X-EBAY-API-IAF-TOKEN"]
        retry
      end
    end

    def self.raise_error(errors)
      return if errors.nil?

      errors = Array.wrap(errors)
      if token_invalid?(errors)
        raise EbayAPI::InvalidToken
      elsif page_invalid?(errors)
        raise EbayAPI::InvalidPage
      else
        error = errors.first
        error_message = "Code: #{error['ErrorCode']} - #{error['ShortMessage']}"
        raise EbayAPI::Error.new error_message
      end
    end

    def self.token_invalid?(errors=[])
      errors.any? do |error|
        error['ErrorCode'] == '21917053' && error['ShortMessage'].include?('IAF')
      end
    end

    def self.page_invalid?(errors=[])
      errors.any? do |error|
        error['ErrorCode'] == '340' && error['ShortMessage'] == 'Invalid page number.'
      end
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
