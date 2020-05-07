require 'ebay_api/resource'

module EbayAPI
  class Measure < Resource
    attribute :measurement_system, Types::String
    attribute :unit, Types::String
    attribute :value, Types::Coercible::Float
  end
end
