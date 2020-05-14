require 'ebay_api/resource'
require 'ebay_api/resources/shared/discount_price_info'
require 'ebay_api/resources/shared/amount'
require 'ebay_api/resources/shared/name_value_list'

module EbayAPI
  class Variations < Resource
    attribute? :modify_name_list do
      attribute? :modify_name, Types::EbayArray do
        attribute? :name, Types::String
        attribute? :new_name, Types::String
      end
    end
    attribute? :pictures do
      attribute? :variation_specific_name, Types::String
      attribute? :variation_specific_picture_set, Types::EbayArray do
        attribute? :extended_picture_details do
          attribute? :picture_ur_ls, Types::EbayArray do
            attribute? :e_bay_picture_url, Types::EbayArray.of(Types::String)
            attribute? :external_picture_url, Types::String
          end
        end
        attribute? :external_picture_url, Types::EbayArray.of(Types::String)
        attribute? :gallery_url, Types::EbayArray.of(Types::String)
        attribute? :picture_url, Types::EbayArray.of(Types::String)
        attribute? :variation_specific_value, Types::String
      end
    end
    attribute? :variation, Types::EbayArray do
      attribute? :delete, Types::Params::Bool
      attribute? :discount_price_info, EbayAPI::DiscountPriceInfo
      attribute? :private_notes, Types::String
      attribute? :quantity, Types::Coercible::Integer
      attribute? :selling_manager_product_inventory_status do
        attribute? :average_selling_price, EbayAPI::Amount
        attribute? :quantity_active, Types::Coercible::Integer
        attribute? :quantity_scheduled, Types::Coercible::Integer
        attribute? :quantity_sold, Types::Coercible::Integer
        attribute? :quantity_unsold, Types::Coercible::Integer
        attribute? :quantity_success_percent, Types::Coercible::Float
      end
      attribute? :selling_status, EbayAPI::SellingStatus
      attribute? :sku, Types::String
      attribute? :start_price, EbayAPI::Amount
      attribute? :unit_cost, EbayAPI::Amount
      attribute? :units_available, Types::Coercible::Integer
      attribute? :variation_product_listing_details do
        attribute? :ean, Types::String
        attribute? :isbn, Types::String
        attribute? :name_value_list, Types::EbayArray.of(EbayAPI::NameValueList)
        attribute? :product_reference_id, Types::String
        attribute? :upc, Types::String
      end
      attribute? :variation_specifics do
        attribute? :name_value_list, Types::EbayArray.of(EbayAPI::NameValueList)
      end
      attribute? :variation_title, Types::String
      attribute? :variation_view_item_url, Types::String
      attribute? :watch_count, Types::Coercible::Float
    end
    attribute? :variation_specifics_set do
      attribute? :name_value_list, Types::EbayArray.of(EbayAPI::NameValueList)
    end
  end
end
