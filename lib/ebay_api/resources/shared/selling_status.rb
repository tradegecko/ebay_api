require 'ebay_api/resource'
require 'ebay_api/resources/shared/amount'
require 'ebay_api/resources/shared/user'

module EbayAPI
  class SellingStatus < Resource
    attribute? :admin_ended, Types::Params::Bool
    attribute? :bid_count, Types::String
    attribute? :bidder_count, Types::Coercible::Float
    attribute? :bid_increment, EbayAPI::Amount
    attribute? :converted_current_price, EbayAPI::Amount
    attribute? :current_price, EbayAPI::Amount
    attribute? :final_value_fee, EbayAPI::Amount
    attribute? :high_bidder, EbayAPI::User
    attribute? :lead_count, Types::Coercible::Float
    attribute? :listing_status, Types::String
    attribute? :minimum_to_bid, EbayAPI::Amount
    attribute? :promotional_sale_details do
      attribute? :end_time, Types::Params::DateTime
      attribute? :original_price, EbayAPI::Amount
      attribute? :start_time, Types::Params::DateTime
    end
    attribute? :quantity_sold, Types::Coercible::Integer
    attribute? :quantity_sold_by_pickup_in_store, Types::Coercible::Integer
    attribute? :reserve_met, Types::Params::Bool
    attribute? :second_chance_eligible, Types::Params::Bool
    attribute? :sold_as_bin, Types::Params::Bool
    attribute? :suggested_bid_values do
      attribute? :bid_value, EbayAPI::Amount
    end
  end
end
