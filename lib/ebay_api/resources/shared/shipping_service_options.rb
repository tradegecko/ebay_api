require 'ebay_api/resource'
require 'ebay_api/resources/shared/amount'

module EbayAPI
  class ShippingServiceOptions < Resource
    attribute? :expedited_service, Types::Params::Bool
    attribute? :free_shipping, Types::Params::Bool
    attribute? :import_charge, EbayAPI::Amount
    attribute? :local_pickup, Types::Params::Bool
    attribute? :logistic_plan_type, Types::String
    attribute? :shipping_insurance_cost, EbayAPI::Amount
    attribute? :shipping_service, Types::String
    attribute? :shipping_service_additional_cost, EbayAPI::Amount
    attribute? :shipping_service_cost, EbayAPI::Amount
    attribute? :shipping_service_cut_off_time, Types::Params::DateTime
    attribute? :shipping_service_priority, Types::Coercible::Integer
    attribute? :shipping_time_max, Types::Coercible::Integer
    attribute? :shipping_time_min, Types::Coercible::Integer
  end
end
