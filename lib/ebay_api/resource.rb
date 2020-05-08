require 'dry-types'
require 'ebay_api/concerns/singleton'

module EbayAPI
  class Resource < Dry::Struct
    include EbayAPI::Singleton

    transform_keys do |key|
      key == '__content__' ? :value : key.underscore.to_sym
    end

    module Types
      include Dry.Types()

      EbayArray = Types.Constructor(Array) { |values| ::Array.wrap(values) }
    end
  end
end
