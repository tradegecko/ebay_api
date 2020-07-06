require 'ebay_api/resource'
require 'ebay_api/resources/shared/amount'

module EbayAPI
  class InternationalShippingServiceOption < Resource
    attribute? :import_charge, EbayAPI::Amount
    attribute? :shipping_insurance_cost, EbayAPI::Amount
    attribute? :shipping_service, Types::String.optional
    attribute? :shipping_service_additional_cost, EbayAPI::Amount
    attribute? :shipping_service_cost, EbayAPI::Amount
    attribute? :shipping_service_cut_off_time, Types::Params::DateTime
    attribute? :shipping_service_priority, Types::Coercible::Integer
    attribute? :ship_to_location, Types::EbayArray.of(Types::String.optional)
  end
end
