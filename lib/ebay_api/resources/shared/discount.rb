require 'ebay_api/resource'
require 'ebay_api/resources/shared/amount'
require 'ebay_api/resources/shared/measure'

module EbayAPI
  class Discount < Resource
    attribute? :discount_name, Types::String
    attribute? :discount_profile do
      attribute? :discount_profile_id, Types::String
      attribute? :discount_profile_name, Types::String
      attribute? :each_additional_amount, EbayAPI::Amount
      attribute? :each_additional_amount_off, EbayAPI::Amount
      attribute? :each_additional_percent_off, Types::Coercible::Float
      attribute? :mapped_discount_profile_id, Types::String
      attribute? :weight_off, EbayAPI::Measure
    end
  end
end
