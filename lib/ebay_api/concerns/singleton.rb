module EbayAPI
  module Singleton
    module ClassMethods
      ALLOWABLE_PARAMS = [
        :limit, :offset
      ].freeze

      API_TYPES_TO_COLLECTION = {
        fulfillment: %w[order],
        inventory: %w[inventory_item]
      }.freeze

      def singleton_name
        @singleton_name ||= model_name.element
      end

      def uri_prefix
        if Thread.current['EbayAPI'][:sandbox]
          'https://api.sandbox.ebay.com'
        else
          'https://api.ebay.com'
        end
      end

      def api_type
        API_TYPES_TO_COLLECTION.keys.detect do |api_type|
          API_TYPES_TO_COLLECTION[api_type].include?(collection_name)
        end
      end

      def collection_key
        collection_name.camelize(:lower).pluralize
      end

      def collection_path(param_options = {})
        "#{uri_prefix}/sell/#{api_type}/v1/#{collection_name}#{string_query(param_options)}"
      end

      def string_query(param_options)
        return unless param_options
        params = param_options.slice(*ALLOWABLE_PARAMS)
        "?#{params.to_query}" unless param_options.blank?
      end

      def all(params = {})
        response = http_request(:get, collection_path(params))
        response[collection_key].map do |response_object|
          new(response_object)
        end
      end

      def count
        response = http_request(:get, collection_path)
        response['total'].to_i
      end

      def find(id)
        return unless id.present?

        response = http_request(:get, "#{collection_path}/#{id}")
        new(response)
      end

      def http_request(verb, url, options={})
        EbayAPI::Client.send(verb, url, options)
      end
    end

    def self.included(receiver)
      receiver.extend ClassMethods
    end
  end
end
