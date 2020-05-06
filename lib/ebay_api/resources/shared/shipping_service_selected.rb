require 'ebay_api/resource'
require 'ebay_api/resources/shared/amount'

module EbayAPI
  class ShippingServiceSelected < Resource
    attribute? :expedited_service, Types::Params::Bool
    attribute? :import_charge, EbayAPI::Amount
    attribute? :shipping_package_info, Types::EbayArray do
      attribute? :actual_delivery_time, Types::Params::DateTime
      attribute? :estimated_delivery_time_max, Types::Params::DateTime
      attribute? :estimated_delivery_time_min, Types::Params::DateTime
      attribute? :handle_by_time, Types::Params::DateTime
      attribute? :max_native_estimated_delivery_time, Types::Params::DateTime
      attribute? :min_native_estimated_delivery_time, Types::Params::DateTime
      attribute? :scheduled_delivery_time_max, Types::Params::DateTime
      attribute? :scheduled_delivery_time_min, Types::Params::DateTime
      attribute? :shipping_tracking_event, Types::String.optional
      attribute? :store_id, Types::String.optional
    end
    attribute? :shipping_service, Types::String.optional
    attribute? :shipping_service_additional_cost, EbayAPI::Amount
    attribute? :shipping_service_cost, EbayAPI::Amount
    attribute? :shipping_service_priority, Types::Coercible::Integer
  end
end
