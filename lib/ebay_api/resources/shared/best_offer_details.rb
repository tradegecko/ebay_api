require 'ebay_api/resource'
require 'ebay_api/resources/shared/amount'

module EbayAPI
  class BestOfferDetails < Resource
    attribute? :best_offer, EbayAPI::Amount
    attribute? :best_offer_count, Types::Coercible::Integer
    attribute? :best_offer_enabled, Types::Params::Bool
    attribute? :best_offer_status, Types::String
    attribute? :best_offer_type, Types::String
    attribute? :new_best_offer, Types::Params::Bool
  end
end
