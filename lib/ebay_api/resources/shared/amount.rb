require 'ebay_api/resource'

module EbayAPI
  class Amount < Resource
    attribute :currency, Types::String
    attribute :value, Types::Float.constructor(&:to_f)
    attribute? :convertedFromCurrency, Types::String
    attribute? :convertedFromValue, Types::Float.constructor(&:to_f)
  end
end
