require 'ebay_api/resource'
require 'ebay_api/resources/shared/address'
require 'ebay_api/resources/shared/charity_affiliation_detail'

module EbayAPI
  class Seller < Resource
    attribute? :allow_payment_edit, Types::Params::Bool
    attribute? :billing_currency, Types::String
    attribute? :charity_affiliation_details, Types::Array.of(EbayAPI::CharityAffiliationDetailType).constructor{|x| Array.wrap(x)}
    attribute? :charity_registered, Types::Params::Bool
    attribute? :checkout_enabled, Types::Params::Bool
    attribute? :cip_back_account_stored, Types::Params::Bool
    attribute? :domestic_rate_table, Types::Params::Bool
    attribute? :feature_eligibility do
      attribute? :qualified_for_auction_one_day_duration, Types::Params::Bool
      attribute? :qualified_for_fixed_price_one_day_duration, Types::Params::Bool
      attribute? :qualifies_for_buy_it_now, Types::Params::Bool
      attribute? :qualifies_for_buy_it_now_multiple, Types::Params::Bool
      attribute? :qualifies_for_variations, Types::Params::Bool
    end
    attribute? :good_standing, Types::Params::Bool
    attribute? :integrated_merchant_credit_card_info do
      attribute? :supported_site, Types::String
    end
    attribute? :international_rate_table, Types::Params::Bool
    attribute? :paisa_pay_escrow_emi_status, Types::Coercible::Integer
    attribute? :paisa_pay_status, Types::Coercible::Integer
    attribute? :payment_method, Types::String
    attribute? :qualifies_for_b2_bvat, Types::Params::Bool
    attribute? :recoupment_policy_consent do
      attribute? :site, Types::String
    end
    attribute? :registered_business_seller, Types::Params::Bool
    attribute? :self_payment_exempt, Types::Params::Bool
    attribute? :scheduling_info do
      attribute? :max_scheduled_items, Types::Coercible::Integer
      attribute? :max_scheduled_minutes, Types::Coercible::Integer
      attribute? :min_scheduled_minuts, Types::Coercible::Integer
    end
    attribute? :seller_business_type, Types::String
    attribute? :seller_level, Types::String
    attribute? :seller_payment_address, EbayAPI::Address
    attribute? :store_owner, Types::Params::Bool
    attribute? :store_url, Types::String
    attribute? :top_rated_seller, Types::Params::Bool
    attribute? :top_rated_seller_details do
      attribute? :top_rated_program, Types::String
    end
    attribute? :transaction_percent, Types::Coercible::Float
  end
end
