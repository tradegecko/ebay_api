require 'ebay_api/resource'

module EbayAPI
  class PaymentHoldDetails < Resource
    attribute? :expected_release_date, Types::Params::DateTime
    attribute? :num_of_req_seller_actions, Types::Coercible::Integer
    attribute? :payment_hold_reason, Types::String.optional
    attribute? :required_seller_action_array do
      attribute? :required_seller_action, Types::EbayArray.of(Types::String.optional)
    end
  end
end
