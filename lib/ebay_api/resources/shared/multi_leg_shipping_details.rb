require 'ebay_api/resource'
require 'ebay_api/resources/shared/amount'

module EbayAPI
  class MultiLegShippingDetails < Resource
    attribute? :seller_shipment_to_logistics_provider do
      attribute? :shipping_service_details do
        attribute? :shipping_service, Types::String.optional
        attribute? :total_shipping_cost, EbayAPI::Amount
      end
      attribute? :shipping_time_max, Types::Coercible::Integer
      attribute? :shipping_time_min, Types::Coercible::Integer
      attribute? :ship_to_address, EbayAPI::Address
    end
    attribute? :logistics_provider_shipment_to_buyer do
      attribute? :shipping_service_details do
        attribute? :shipping_service, Types::String.optional
        attribute? :total_shipping_cost, EbayAPI::Amount
      end
      attribute? :shipping_time_max, Types::Coercible::Integer
      attribute? :shipping_time_min, Types::Coercible::Integer
      attribute? :ship_to_address, EbayAPI::Address
    end
  end
end
