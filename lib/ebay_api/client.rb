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
      token         = ''
      refresh_token = ''
      client_id     = 'TradeGec-TradeGec-SBX-2196b7be0-3d4642fe';
      client_secret = 'SBX-196b7be0b40b-4544-40de-889e-2e8b';

      self.new(client_id, client_secret, access_token: token, refresh_token: refresh_token)
    end

    def initialize(client_id, client_secret, options = {})
      session_options = self.class.default_client_options
      session_options[:client_id] = client_id
      session_options[:client_secret] = client_secret
      session_options[:refresh_token] = options[:refresh_token]
      session_options[:access_token] = options[:access_token]
      session_options[:sandbox] = options[:sandbox] if options[:sandbox].present?
      session_options[:headers] = self.class.default_headers.merge(
        { "Authorization" => "Bearer #{ options[:access_token] }" }
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
        raise_error(response['errors']) if response['errors']
        response
      rescue EbayAPI::InvalidToken
        refresh_token!
        retry
      end
    end

    def self.raise_error(errors)
      if token_invalid?(errors)
        raise EbayAPI::InvalidToken
      else
        raise EbayAPI::Error
      end
    end

    def self.token_invalid?(errors=[])
      errors.any? do |error|
        error['errorId'] == 1001 && error['message'] == 'Invalid access token'
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
      new_headers["Authorization"] = "Bearer #{new_oauth_token.token}"
      new_session_options[:access_token] = new_oauth_token.token
      new_session_options[:refresh_token] = new_oauth_token.refresh_token

      Thread.current["EbayAPI"] = new_session_options
    end

    def self.fetch_new_oauth_token(oauth_client)
      api_scopes = %w[
        https://api.ebay.com/oauth/api_scope
        https://api.ebay.com/oauth/api_scope/buy.order.readonly
        https://api.ebay.com/oauth/api_scope/sell.inventory
        https://api.ebay.com/oauth/api_scope/sell.account.readonly
        https://api.ebay.com/oauth/api_scope/sell.fulfillment
        https://api.ebay.com/oauth/api_scope/commerce.identity.readonly
        https://api.ebay.com/oauth/api_scope/commerce.identity.readonly
        https://api.ebay.com/oauth/api_scope/commerce.identity.email.readonly
        https://api.ebay.com/oauth/api_scope/commerce.identity.phone.readonly
        https://api.ebay.com/oauth/api_scope/commerce.identity.address.readonly
        https://api.ebay.com/oauth/api_scope/commerce.identity.name.readonly
        https://api.ebay.com/oauth/api_scope/sell.finances
        https://api.ebay.com/oauth/api_scope/sell.payment.dispute
        https://api.ebay.com/oauth/api_scope/sell.item
      ];

      OAuth2::AccessToken.new(
        oauth_client, default_options[:access_token], refresh_token: default_options[:refresh_token]
      ).refresh!(scope: api_scopes.join(' '))
    end
  end
end
