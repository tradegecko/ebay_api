require 'ebay_api/resource'

module EbayAPI
  class Category < Resource
    attribute? :auto_pay_enabled, Types::Params::Bool
    attribute? :b2_bvat_enabled, Types::Params::Bool
    attribute? :best_offer_enabled, Types::Params::Bool
    attribute? :catalog_enabled, Types::Params::Bool
    attribute? :category_id, Types::String
    attribute? :category_level, Types::Coercible::Integer
    attribute? :category_name, Types::String
    attribute? :category_parent_id, Types::EbayArray.of(Types::String)
    attribute? :category_parent_name, Types::EbayArray.of(Types::String)
    attribute? :expired, Types::Params::Bool
    attribute? :leaf_category, Types::Params::Bool
    attribute? :lsd, Types::Params::Bool
    attribute? :orpa, Types::Params::Bool
    attribute? :orra, Types::Params::Bool
    attribute? :virtual, Types::Params::Bool
  end
end
