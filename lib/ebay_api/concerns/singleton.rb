module EbayAPI
  module Singleton
    module ClassMethods
      def singleton_name
        @singleton_name ||= model_name.element
      end

      def http_request(action, body)
        headers =  EbayAPI::Client.default_options[:headers].merge({
          "X-EBAY-API-CALL-NAME" => action.to_s.camelize
        })
        EbayAPI::Client.post(api_endpoint, { body: body, headers: headers })
      end

      def api_endpoint
        if Thread.current['EbayAPI'][:sandbox]
          'https://api.sandbox.ebay.com/ws/api.dll'
        else
          'https://api.ebay.com/ws/api.dll'
        end
      end
    end

    def self.included(receiver)
      receiver.extend ClassMethods
    end
  end
end
