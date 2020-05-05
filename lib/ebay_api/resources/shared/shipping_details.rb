require 'ebay_api/resource'
require 'ebay_api/resources/shared/measure'
require 'ebay_api/resources/shared/discount'
require 'ebay_api/resources/shared/amount'
require 'ebay_api/resources/shared/shipping_service_options'

module EbayAPI
  class ShippingDetails < Resource
    attribute? :allow_payment_edit, Types::Params::Bool
    attribute? :apply_shipping_discount, Types::Params::Bool
    attribute? :calculated_shipping_discount, EbayAPI::Discount
    attribute? :calculated_shipping_rate do
      attribute? :international_packaging_handling_costs, Types::Coercible::Float
      attribute? :measurement_unit, EbayAPI::Measure
      attribute? :originating_postal_code, Types::String
      attribute? :packaging_handling_costs, Types::Coercible::Float
      attribute? :shipping_irregular, Types::Params::Bool
    end
    attribute? :change_payment_instructions, Types::Params::Bool
    attribute? :cod_cost, Types::Coercible::Float
    attribute? :default_shipping_cost, Types::Coercible::Float
    attribute? :exclude_ship_to_location, Types::String
    attribute? :flat_shipping_discount, EbayAPI::Discount
    attribute? :get_it_fast, Types::Params::Bool
    attribute? :global_shipping, Types::Params::Bool
    attribute? :insurance_wanted, Types::Params::Bool
    attribute? :international_calculated_shipping_discount, EbayAPI::Discount
    attribute? :international_flat_shipping_discount, EbayAPI::Discount
    attribute? :international_promotional_shipping_discount, Types::Params::Bool
    attribute? :international_shipping_service_option do
      attribute? :import_charge, EbayAPI::Discount
      attribute? :shipping_insurance_cost, EbayAPI::Discount
      attribute? :shipping_service, Types::String
      attribute? :shipping_service_additional_cost, EbayAPI::Discount
      attribute? :shipping_service_cost, EbayAPI::Discount
      attribute? :shipping_service_cut_off_time, Types::Params::DateTime
      attribute? :shipping_service_priority, Types::Coercible::Integer
      attribute? :ship_to_location, Types::String
    end
    attribute? :payment_edited, Types::Params::Bool
    attribute? :payment_instructions, Types::String
    attribute? :promotional_shipping_discount, Types::Params::Bool
    attribute? :promotional_shipping_discount_details do
      attribute? :discount_name, Types::String
      attribute? :item_count, Types::Coercible::Integer
      attribute? :order_amount, EbayAPI::Amount
      attribute? :shipping_cost, EbayAPI::Amount
    end
    attribute? :rate_table_details do
      attribute? :domestic_rate_table, Types::String
      attribute? :domestic_rate_table_id, Types::String
      attribute? :international_rate_table, Types::String
      attribute? :international_rate_table_id, Types::String
    end
    attribute? :sales_tax do
      attribute? :sales_tax_amount, EbayAPI::Amount
      attribute? :sales_tax_percent, Types::Coercible::Float
      attribute? :sales_tax_state, Types::String
      attribute? :shipping_included_in_tax, Types::Params::Bool
    end
    attribute? :seller_exclude_ship_to_locations_preference, Types::Params::Bool
    attribute? :selling_manager_sales_record_number, Types::Coercible::Integer
    attribute? :shipment_tracking_details, Types::EbayArray do
      attribute? :shipment_line_item do
        attribute? :line_item, Types::EbayArray do
          attribute :country_of_origin, Types::String
          attribute :description, Types::String
          attribute :item_id_type, Types::String
          attribute :quantity, Types::Coercible::Integer
          attribute :transaction_id, Types::String
        end
      end
      attribute :shipment_tracking_number, Types::String
      attribute :shipping_carrier_used, Types::String
    end
    attribute? :shipping_discount_profile_id, Types::String
    attribute? :shipping_rate_error_message, Types::String
    attribute? :shipping_rate_type, Types::String
    attribute? :shipping_service_options, EbayAPI::ShippingServiceOptions
    attribute? :shipping_service_used, Types::String
    attribute? :shipping_type, Types::String
    attribute? :tax_table do
      attribute? :tax_jurisdiction, Types::EbayArray do
        attribute? :detail_version, Types::String
        attribute? :jurisdiction_id, Types::String
        attribute? :jurisdiction_name, Types::String
        attribute? :sales_tax_percent, Types::Coercible::Float
        attribute? :sales_included_in_tax, Types::Params::Bool
        attribute? :update_time, Types::Params::DateTime
      end
    end
    attribute? :third_party_checkout, Types::Params::Bool
  end
end
