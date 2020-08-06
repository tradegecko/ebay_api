require 'ebay_api/resource'
require 'ebay_api/resources/shared/amount'

module EbayAPI
  class DiscountPriceInfo < Resource
    attribute? :made_for_outlet_comparison_price, EbayAPI::Amount
    attribute? :minimum_advertised_price, EbayAPI::Amount
    attribute? :minimum_advertised_price_exposure, Types::String
    attribute? :original_retail_price, EbayAPI::Amount
    attribute? :pricing_treatment, Types::String
    attribute? :sold_off_e_bay, Types::Params::Bool
    attribute? :sold_on_e_bay, Types::Params::Bool
  end
end
