module EbayAPI
  module Singleton
    module ClassMethods

      ALLOWABLE_PARAMS = [
        :limit, :offset
      ].freeze

      def singleton_name
        @singleton_name ||= model_name.element
      end

      def uri_prefix
        if Thread.current["EbayAPI"][:sandbox]
          "https://api.sandbox.ebay.com"
        else
          "https://api.ebay.com"
        end
      end

      def collection_key
        collection_name.camelize(:lower).pluralize
      end

      def collection_path(param_options=nil)
        "#{uri_prefix}/sell/inventory/v1/#{collection_name}#{string_query(param_options)}"
      end

      def string_query(param_options)
        params = param_options.slice(*ALLOWABLE_PARAMS)
        "?#{params.to_query}" unless param_options.blank?
      end

      def all(params={})
        uri = collection_path(params)
        response = http_request(:get, uri)
        response[collection_key].map do |response_object|
          new(response_object)
        end
      end

      def find(id)
        return unless id.present?

        response = http_request(:get, "#{collection_path}/#{id}")
        new(response)
      end

      def http_request(verb, url, options={})
        response = EbayAPI::Client.send(verb, url, options)
        parse_response(response)
      end

      def parse_response(response)
        JSON.parse(response.body.match(/({.*}|\[.*\])/).to_s)
      end
    end

    def self.included(receiver)
      receiver.extend ClassMethods
    end
  end
end