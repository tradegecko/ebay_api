require 'ebay_api/resource'
require 'ebay_api/resources/shared/amount'
require 'ebay_api/resources/shared/address'
require 'ebay_api/resources/shared/user'
require 'ebay_api/resources/shared/measure'
require 'ebay_api/resources/shared/selling_status'
require 'ebay_api/resources/shared/shipping_details'
require 'ebay_api/resources/shared/variations'
require 'ebay_api/resources/shared/best_offer_details'
require 'ebay_api/resources/shared/discount_price_info'
require 'ebay_api/resources/shared/category'
require 'ebay_api/resources/shared/name_value_list'

module EbayAPI
  class Item < Resource
    VARIANT_ATTRIBUTES =  %w[quantity price].map(&:to_sym)

    attribute? :auto_pay, Types::Params::Bool
    attribute? :application_data, Types::String
    attribute? :apply_buyer_protection do
      attribute? :buyer_protection_source, Types::String
      attribute? :buyer_protection_status, Types::String
    end
    attribute? :available_for_pickup_dropoff, Types::Bool
    attribute? :best_offer_details, EbayAPI::BestOfferDetails
    attribute? :business_seller_details do
      attribute? :additional_contact_information, Types::String
      attribute? :address, EbayAPI::Address
      attribute? :email, Types::String
      attribute? :fax, Types::String
      attribute? :legal_invoice, Types::Params::Bool
      attribute? :terms_and_conditions, Types::String
      attribute? :trade_registration_number, Types::String
      attribute? :vat_details do
        attribute? :business_seller, Types::Params::Bool
        attribute? :restricted_to_business, Types::Params::Bool
        attribute? :vatid, Types::String
        attribute? :vat_percent, Types::Coercible::Float
        attribute? :vat_site, Types::String
      end
    end
    attribute? :buyer_guarantee_price, EbayAPI::Amount
    attribute? :buyer_protection, Types::String
    attribute? :buyer_requirement_details do
      attribute? :maximum_item_requirements do
        attribute? :maximum_item_count, Types::Coercible::Integer
        attribute? :minimum_feedback_score, Types::Coercible::Integer
      end
      attribute? :maximum_unpaid_item_strikes_info do
        attribute? :count, Types::Coercible::Integer
        attribute? :period, Types::String
      end
      attribute? :ship_to_registration_country, Types::Params::Bool
      attribute? :zero_feedback_score, Types::Params::Bool
    end
    attribute? :buyer_reponsible_for_shipping, Types::Params::Bool
    attribute? :buy_it_now_price, EbayAPI::Amount
    attribute? :charity do
      attribute? :charity_id, Types::String
      attribute? :charity_listing, Types::Params::Bool
      attribute? :charity_name, Types::String
      attribute? :charity_number, Types::Coercible::Integer
      attribute? :donation_percent, Types::Coercible::Float
      attribute? :logo_url, Types::String
      attribute? :mission, Types::String
      attribute? :status, Types::String
    end
    attribute? :condition_definition, Types::String
    attribute? :condition_display_name, Types::String
    attribute? :condition_id, Types::Coercible::Integer
    attribute? :country, Types::String
    attribute? :cross_border_trade, Types::EbayArray.of(Types::String)
    attribute? :currency, Types::String
    attribute? :description, Types::String
    attribute? :digital_good_info do
      attribute? :digital_delivery, Types::Params::Bool
    end
    attribute? :disable_buyer_requirements, Types::Params::Bool
    attribute? :discount_price_info, EbayAPI::DiscountPriceInfo
    attribute? :dispatch_time_max, Types::Coercible::Integer
    attribute? :ebay_plus, Types::Params::Bool
    attribute? :ebay_plus_eligible, Types::Params::Bool
    attribute? :eligible_for_pickup_drop_off, Types::Params::Bool
    attribute? :e_mail_delivery_available, Types::Params::Bool
    attribute? :extended_seller_contact_details do
      attribute? :classified_ad_contact_by_email_enabled, Types::Params::Bool
      attribute? :contact_hours_details do
        attribute? :hours1_any_time, Types::Params::Bool
        attribute? :hours1_days, Types::String
        attribute? :hours1_from, Types::Params::Time
        attribute? :hours1_to, Types::Params::Time
        attribute? :hours2_any_time, Types::Params::Bool
        attribute? :hours2_days, Types::String
        attribute? :hours2_from, Types::Params::Time
        attribute? :hours2_to, Types::Params::Time
        attribute? :time_zone_id, Types::String
      end
      attribute? :pay_per_lead_phone_number, Types::String
    end
    attribute? :free_added_category, EbayAPI::Category
    attribute? :hide_from_search, Types::Params::Bool
    attribute? :hit_count, Types::Coercible::Float
    attribute? :hit_counter, Types::String
    attribute? :ignore_quantity, Types::Params::Bool
    attribute? :integrated_merchant_credit_card_enabled, Types::Params::Bool
    attribute? :inventory_tracking_method, Types::String
    attribute? :is_intermediated_shipping_eligible, Types::Params::Bool
    attribute? :is_secure_description, Types::Params::Bool
    attribute? :item_compatibility_count, Types::Coercible::Integer
    attribute? :item_compatibility_list do
      attribute? :compatibility, Types::EbayArray do
        attribute? :compatibility_notes, Types::String
        attribute? :delete, Types::Params::Bool
        attribute? :name_value_list, Types::EbayArray.of(EbayAPI::NameValueList)
      end
    end
    attribute? :item_id, Types::String
    attribute? :id, Types::String
    attribute? :item_policy_violation do
      attribute? :policy_id, Types::Coercible::Float
      attribute? :policy_text, Types::String
    end
    attribute? :item_specifics do
      attribute? :name_value_list, Types::EbayArray.of(EbayAPI::NameValueList)
    end
    attribute? :listing_designer do
      attribute? :layout_id, Types::Coercible::Integer
      attribute? :optimal_picture_size, Types::Params::Bool
      attribute? :theme_id, Types::Coercible::Integer
    end
    attribute? :listing_details do
      attribute? :adult, Types::Params::Bool
      attribute? :best_offer_auto_accept_price, EbayAPI::Amount
      attribute? :binding_auction, Types::Params::Bool
      attribute? :buy_it_now_available, Types::Params::Bool
      attribute? :checkout_enabled, Types::Params::Bool
      attribute? :converted_buy_it_now_price, EbayAPI::Amount
      attribute? :converted_reserve_price, EbayAPI::Amount
      attribute? :converted_start_price, EbayAPI::Amount
      attribute? :ending_reason, Types::String
      attribute? :end_time, Types::Params::DateTime
      attribute? :has_public_messages, Types::Params::Bool
      attribute? :has_reserve_price, Types::Params::Bool
      attribute? :has_unanswered_questions, Types::Params::Bool
      attribute? :local_listing_distance, Types::String
      attribute? :minimum_best_offer_message, Types::String
      attribute? :minimum_best_offer_price, EbayAPI::Amount
      attribute? :pay_per_lead_enabled, Types::Params::Bool
      attribute? :relisted_item_id, Types::String
      attribute? :second_chance_original_item_id, Types::String
      attribute? :seller_business_code_type, Types::String
      attribute? :start_time, Types::Params::DateTime
      attribute? :tcr_original_item_id, Types::String
      attribute? :view_item_url, Types::String
      attribute? :view_item_url_for_natural_search, Types::String
    end
    attribute? :listing_duration, Types::String
    attribute? :listing_enhancement, Types::String
    attribute? :listing_subtype_2, Types::String
    attribute? :listing_type, Types::String
    attribute? :location, Types::String.optional
    attribute? :location_defaulted, Types::Params::Bool
    attribute? :lot_size, Types::Coercible::Integer
    attribute? :mechanical_check_accepted, Types::Params::Bool
    attribute? :payment_allowed_site, Types::EbayArray.of(Types::String)
    attribute? :payment_details do
      attribute? :days_to_full_payment, Types::Coercible::Integer
      attribute? :deposit_amount, EbayAPI::Amount
      attribute? :deposit_type, Types::String
      attribute? :hours_to_deposit, Types::Coercible::Integer
    end
    attribute? :payment_methods, Types::EbayArray.of(Types::String)
    attribute? :pay_pal_email_address, Types::String
    attribute? :pickup_in_store_details do
      attribute? :eligible_for_pickup_drop_off, Types::Params::Bool
      attribute? :eligible_for_pickup_in_store, Types::Params::Bool
    end
    attribute? :picture_details do
      attribute? :extended_picture_details do
        attribute? :picture_urls, Types::EbayArray do
          attribute? :e_bay_picture_url, Types::String
          attribute? :external_picture_url, Types::String
        end
      end
      attribute? :external_picture_url, Types::EbayArray.of(Types::String)
      attribute? :gallery_error_info, Types::String
      attribute? :gallery_status, Types::String
      attribute? :gallery_type, Types::String
      attribute? :photo_display, Types::String
      attribute? :picture_source, Types::String
      attribute? :picture_url, Types::EbayArray.of(Types::String)
    end
    attribute? :postal_code, Types::String.optional
    attribute? :primary_category, EbayAPI::Category
    attribute? :private_listing, Types::Params::Bool
    attribute? :product_listing_details do
      attribute? :brand_mpn do
        attribute? :brand, Types::String
        attribute? :mpn, Types::String
      end
      attribute? :copyright, Types::EbayArray.of(Types::String)
      attribute? :details_url, Types::String
      attribute? :ean, Types::String
      attribute? :includee_bay_product_details, Types::Params::Bool
      attribute? :include_stock_photo_url, Types::Params::Bool
      attribute? :isbn, Types::String
      attribute? :name_value_list, Types::EbayArray.of(EbayAPI::NameValueList)
      attribute? :product_details_url, Types::String
      attribute? :product_reference_id, Types::String
      attribute? :return_search_result_on_duplicates, Types::Params::Bool
      attribute? :stock_photo_url, Types::String
      attribute? :ticket_listing_details do
        attribute? :event_title, Types::String
        attribute? :printed_date, Types::String
        attribute? :printed_time, Types::String
        attribute? :venue, Types::String
      end
      attribute? :upc, Types::String
      attribute? :use_first_product, Types::Params::Bool
      attribute? :use_stock_photo_url_as_gallery, Types::Params::Bool
    end
    attribute? :proxy_item, Types::Params::Bool
    attribute? :quantity, Types::Coercible::Integer
    attribute? :quantity_available_hint, Types::Coercible::Integer
    attribute? :quantity_info do
      attribute? :minimum_remnant_set, Types::Coercible::Integer
    end
    attribute? :quantity_threshold, Types::Coercible::Integer
    attribute? :reason_hide_from_search, Types::String
    attribute? :relist_parent_id, Types::Coercible::Float
    attribute? :reserve_price, EbayAPI::Amount
    attribute? :return_policy do
      attribute? :description, Types::String
      attribute? :international_refund_option, Types::String
      attribute? :international_returns_accepted_option, Types::String
      attribute? :international_returns_within_option, Types::String
      attribute? :international_shipping_cost_paid_by_option, Types::String
      attribute? :refund, Types::String
      attribute? :refund_option, Types::String
      attribute? :returns_accepted, Types::String
      attribute? :returns_accepted_option, Types::String
      attribute? :returns_within, Types::String
      attribute? :returns_within_option, Types::String
      attribute? :shipping_cost_paid_by, Types::String
      attribute? :shipping_cost_paid_by_option, Types::String
    end
    attribute? :revise_status do
      attribute? :buy_it_now_added, Types::Params::Bool
      attribute? :buy_it_now_lowered, Types::Params::Bool
      attribute? :item_revised, Types::Params::Bool
      attribute? :reserve_lowered, Types::Params::Bool
      attribute? :reserve_removed, Types::Params::Bool
    end
    attribute? :secondary_category, EbayAPI::Category
    attribute? :seller, EbayAPI::User
    attribute? :seller_contact_details, EbayAPI::Address
    attribute? :seller_profiles do
      attribute? :seller_payment_profile do
        attribute? :payment_profile_id, Types::Coercible::Float
        attribute? :payment_profile_name, Types::String
      end
      attribute? :seller_return_profile do
        attribute? :return_profile_id, Types::Coercible::Float
        attribute? :return_profile_name, Types::String
      end
      attribute? :seller_shipping_profile do
        attribute? :shipping_profile_id, Types::Coercible::Float
        attribute? :shipping_profile_name, Types::String
      end
    end
    attribute? :seller_vacation_note, Types::String
    attribute? :selling_status, EbayAPI::SellingStatus
    attribute? :shipping_details, EbayAPI::ShippingDetails
    attribute? :shipping_package_details do
      attribute? :measurement_unit, Types::String
      attribute? :package_depth, EbayAPI::Measure
      attribute? :package_length, EbayAPI::Measure
      attribute? :package_width, EbayAPI::Measure
      attribute? :shipping_irregular, Types::Params::Bool
      attribute? :shipping_package, Types::String
      attribute? :weight_major, EbayAPI::Measure
      attribute? :weight_minor, EbayAPI::Measure
    end
    attribute? :shipping_service_cost_override_list do
      attribute? :shipping_service_cost_override, Types::EbayArray do
        attribute? :shipping_service_additional_cost, EbayAPI::Amount
        attribute? :shipping_service_cost, EbayAPI::Amount
        attribute? :shipping_service_priority, Types::Coercible::Integer
        attribute? :shipping_service_type, Types::String
        attribute? :shipping_surcharge, EbayAPI::Amount
      end
    end
    attribute? :ship_to_locations, Types::EbayArray.of(Types::String)
    attribute? :site, Types::String
    attribute? :sku, Types::String
    attribute? :start_price, EbayAPI::Amount
    attribute? :store_front do
      attribute? :store_category2_id, Types::Coercible::Float
      attribute? :store_category2_name, Types::String
      attribute? :store_category_id, Types::Coercible::Float
      attribute? :store_category_name, Types::String
      attribute? :store_name, Types::String
      attribute? :store_url, Types::String
    end
    attribute? :sub_title, Types::String
    attribute? :tax_category, Types::String
    attribute? :time_left, Types::String
    attribute? :title, Types::String
    attribute? :top_rated_listing, Types::Params::Bool
    attribute? :unit_info do
      attribute? :unit_quantity, Types::Coercible::Float
      attribute? :unit_type, Types::String
    end
    attribute? :uuid, Types::String
    attribute? :variations, EbayAPI::Variations
    attribute? :vat_details do
      attribute? :vat_percent, Types::Coercible::Float
    end
    attribute? :watch_count, Types::Coercible::Float

    def self.collection_name
      'item'
    end

    def self.parse_item(item)
      item['Id'] = item['ItemID']
      new(item)
    end

    def self.get_item(id)
      return unless id.present?

      body = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
        xml.GetItemRequest("xmlns" => "urn:ebay:apis:eBLBaseComponents") do
          xml.ItemID id
        end
      end.to_xml

      response = http_request(__method__, body)
      parse_item(response['GetItemResponse']['Item'])
    end

    def self.get_seller_list(params = {})
      end_time_from = params[:end_time_from] || Time.now.utc
      end_time_to = params[:end_time_to] || end_time_from + 110.days

      body = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
        xml.GetSellerListRequest("xmlns" => "urn:ebay:apis:eBLBaseComponents") do
          xml.IncludeVariations true
          xml.Sort params[:sort] if params[:sort]
          xml.EndTimeFrom end_time_from
          xml.EndTimeTo end_time_to
          xml.GranularityLevel params[:granularity_level] || 'Fine'
          xml.Pagination {
            xml.EntriesPerPage params[:limit] || 200
            xml.PageNumber params[:page] || 1
          }
          if params[:skus]
            xml.SKUArray {
              params[:skus].each do |sku|
                xml.SKU sku
              end
            }
          end
        end
      end.to_xml

      response = http_request(__method__, body)
      return [] if response['GetSellerListResponse']['ItemArray'].nil?

      items = Array.wrap(response['GetSellerListResponse']['ItemArray']['Item'])
      items.map { |item| parse_item(item) }
    rescue EbayAPI::Error => ex
      return [] if ex.code == '340'

      raise
    end

    def self.update_attributes(item_id, attributes)
      return if attributes.empty?

      revise_inventory_status(item_id, attributes)
    end

    private_class_method def self.revise_inventory_status(item_id, attributes)
      body = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
        xml.ReviseInventoryStatusRequest("xmlns" => "urn:ebay:apis:eBLBaseComponents") do
          xml.InventoryStatus {
            xml.ItemID item_id
            xml.Quantity attributes[:quantity].to_i if attributes[:quantity]
            xml.StartPrice attributes[:price] if attributes[:price]
            xml.SKU attributes[:sku] if attributes[:sku]
          }
        end
      end.to_xml

      response = EbayAPI::Item.http_request(__method__, body)
    end
  end
end
