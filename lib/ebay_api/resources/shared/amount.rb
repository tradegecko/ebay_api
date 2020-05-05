require 'ebay_api/resource'

module EbayAPI
  class Amount < Resource
    attribute :currency_id, Types::String
    attribute :value, Types::Coercible::Float
  end
end
