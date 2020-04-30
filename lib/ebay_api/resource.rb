require 'dry-types'
require 'dry-struct'
require 'ebay_api/concerns/singleton'

module EbayAPI
  class Resource < Dry::Struct
    include EbayAPI::Singleton

    transform_keys do |key|
      key.underscore.to_sym
    end

    module Types
      include Dry.Types()
    end
  end
end
