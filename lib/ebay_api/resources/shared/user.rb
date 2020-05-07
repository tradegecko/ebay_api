require 'ebay_api/resource'
require 'ebay_api/resources/shared/seller'

module EbayAPI
  class User < Resource
    attribute? :about_me_page, Types::String
    attribute? :bidding_summary do
      attribute? :bidding_activity_with_seller, Types::Coercible::Integer
      attribute? :bidding_retractions, Types::Coercible::Integer
      attribute? :bids_to_unique_categories, Types::Coercible::Integer
      attribute? :bids_to_unique_sellers, Types::Coercible::Integer
      attribute? :item_bid_details do
        attribute? :bid_count, Types::Coercible::Integer
        attribute? :category_id, Types::String
        attribute? :item_id, Types::String
        attribute? :last_bid_time, Types::Params::DateTime
        attribute? :seller_id, Types::String
        attribute? :summary_days, Types::Coercible::Integer
        attribute? :total_bids, Types::Coercible::Integer
      end
    end
    attribute? :bidding_email, Types::String
    attribute? :business_role, Types::String
    attribute? :buyer_info do
      attribute? :buyer_tax_identifier, Types::EbayArray do
        attribute? :attribute, Types::EbayArray do
          attribute? :name, Types::String.optional
          attribute? :value, Types::String.optional
        end
        attribute? :id, Types::String
        attribute? :type, Types::String
      end
      attribute? :shipping_address, EbayAPI::Address
    end
    attribute? :e_bay_good_standing, Types::Params::Bool
    attribute? :e_bay_wiki_read_only, Types::Params::Bool
    attribute? :eias_token, Types::String
    attribute? :email, Types::String
    attribute? :enterprise_seller, Types::Params::Bool
    attribute? :feedback_private, Types::Params::Bool
    attribute? :feedback_rating_star, Types::String
    attribute? :feedback_score, Types::Coercible::Integer
    attribute? :id_verified, Types::Params::Bool
    attribute? :membership do
      attribute? :program do
        attribute? :expiry_date, Types::Params::DateTime
        attribute? :program_name, Types::String
        attribute? :site, Types::String
      end
    end
    attribute? :new_user, Types::Params::Bool
    attribute? :pay_pal_account_level, Types::String
    attribute? :pay_pal_account_status, Types::String
    attribute? :pay_pal_account_type, Types::String
    attribute? :positive_feedback_percent, Types::Coercible::Float
    attribute? :qualifies_for_selling, Types::Params::Bool
    attribute? :registration_address, EbayAPI::Address
    attribute? :registration_date, Types::Params::DateTime
    attribute? :seller_info, EbayAPI::Seller
    attribute? :shipping_address, EbayAPI::Address
    attribute? :site, Types::String
    attribute? :site_verified, Types::Params::Bool
    attribute? :skype_id, Types::String
    attribute? :static_alias, Types::String
    attribute? :status, Types::String
    attribute? :tuv_level, Types::Coercible::Integer
    attribute? :unique_negative_feedback_count, Types::Coercible::Integer
    attribute? :unique_neutral_feedback_count, Types::Coercible::Integer
    attribute? :unique_positive_feedback_count, Types::Coercible::Integer
    attribute? :user_anonymized, Types::Params::Bool
    attribute? :user_first_name, Types::String
    attribute? :user_id, Types::String
    attribute? :user_id_changed, Types::Params::Bool
    attribute? :user_id_last_changed, Types::Params::DateTime
    attribute? :user_last_name, Types::String
    attribute? :user_subscription, Types::String
    attribute? :vatid, Types::String
    attribute? :vat_status, Types::String
  end
end
