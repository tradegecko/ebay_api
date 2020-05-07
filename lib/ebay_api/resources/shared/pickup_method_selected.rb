require 'ebay_api/resource'

module EbayAPI
  class PickupMethodSelected < Resource
    attribute? :merchant_pickup_code, Types::String.optional
    attribute? :pickup_fulfillment_time, Types::Params::DateTime
    attribute? :pickup_location_UUID, Types::String.optional
    attribute? :pickup_method, Types::String.optional
    attribute? :pickup_status, Types::String.optional
    attribute? :pickup_store_id, Types::String.optional
  end
end
