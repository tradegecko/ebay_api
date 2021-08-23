module EbayAPI
  class NotificationValidator
    attr_reader :signature, :notification, :client_id, :client_secret

    PUBLIC_KEY_URL = "https://api.ebay.com/commerce/notification/v1/public_key/".freeze
    AUTHENTICATION_URL = "https://api.ebay.com/identity/v1/oauth2/token/".freeze
    PKEY_START = "-----BEGIN PUBLIC KEY-----".freeze
    PKEY_END = "-----END PUBLIC KEY-----".freeze

    def initialize(notification, signature, client_id, client_secret)
      @signature = signature
      @notification = notification
      @client_id = client_id
      @client_secret = client_secret
    end

    def valid?
      verifier = OpenSSL::PKey::EC.new(format_key(public_key))
      signature_base64 = Base64.decode64(decoded_signature['signature'])
      verifier.verify(OpenSSL::Digest.new('SHA1'), signature_base64, notification.to_json)
    end

  private

    def public_key
      HTTParty.get("#{PUBLIC_KEY_URL}#{decoded_signature['kid']}",
        headers: {
          'Authorization' => "Bearer #{access_token}",
        }
      )['key']
    end

    def format_key(key)
      key.sub(PKEY_START, "#{PKEY_START}\n").sub(PKEY_END, "\n#{PKEY_END}")
    end

    def decoded_signature
      @decoded_signature ||= JSON.parse(Base64.decode64(signature))
    end

    def access_token
      HTTParty.post(AUTHENTICATION_URL,
        body: URI.encode_www_form({grant_type: "client_credentials", scope: "https://api.ebay.com/oauth/api_scope"}),
        headers: {
          'Content-Type' => 'application/x-www-form-urlencoded',
          'Authorization' => "Basic #{encoded_client_credentials}",
        }
      )['access_token']
    end

    def encoded_client_credentials
      Base64.strict_encode64("#{client_id}:#{client_secret}")
    end
  end
end
