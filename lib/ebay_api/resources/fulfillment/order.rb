require 'ebay_api/resource'
require 'ebay_api/resources/shared/address'
require 'ebay_api/resources/shared/amount'

module EbayAPI
  class Order < Resource
    attribute :buyer do
      attribute :username, Types::String
      attribute? :taxIdentifier do
        attribute? :taxpayer_id, Types::String
        attribute? :tax_identifier_type, Types::String
        attribute? :issuing_country,Types::String
      end
    end
    attribute? :buyer_checkout_notes, Types::String
    attribute? :cancel_status do
      attribute :cancel_state, Types::String
      attribute? :cancelled_date, Types::DateTime.constructor(&:to_datetime)
      attribute :cancel_requests, Types::Array do
        attribute? :cancel_completed_date, Types::DateTime.constructor(&:to_datetime)
        attribute? :cancel_initiator, Types::String
        attribute? :cancel_reason, Types::String
        attribute :cancel_requested_date, Types::DateTime.constructor(&:to_datetime)
        attribute? :cancel_request_id, Types::String
        attribute? :cancel_request_state, Types::String
      end
    end
    attribute :creation_date, Types::DateTime.constructor(&:to_datetime)
    attribute? :ebay_collect_and_remit_tax, Types::Bool
    attribute? :fulfillment_hrefs, Types::Array.of(Types::String)
    attribute :fulfillment_start_instructions, Types::Array do
      attribute? :destination_time_zone, Types::String
      attribute? :ebay_supported_fulfillment, Types::Bool
      attribute? :final_destination_address, EbayAPI::Address
      attribute :fulfillment_instructions_type, Types::String
      attribute? :max_estimated_delivery_date, Types::DateTime.constructor(&:to_datetime)
      attribute? :min_estimated_delivery_date, Types::DateTime.constructor(&:to_datetime)
      attribute? :pickup_step do
        attribute? :merchant_location_key, Types::String
      end
      attribute? :shipping_step do
        attribute :shipping_carrier_code, Types::String
        attribute :shipping_service_code, Types::String
        attribute :ship_to do
          attribute? :company_name, Types::String
          attribute :contact_address, EbayAPI::Address
          attribute? :email, Types::String
          attribute :full_name, Types::String
          attribute? :primary_phone do
            attribute :phone_number, Types::String
          end
        end
        attribute? :ship_to_reference_id, Types::String
      end
    end
    attribute :last_modified_date, Types::DateTime.constructor(&:to_datetime)
    attribute :legacy_order_id, Types::String
    attribute :line_items, Types::Array do
      attribute :applied_promotions, Types::Array do
        attribute? :description, Types::String
        attribute? :discountAmount, EbayAPI::Amount
        attribute? :promotion_id, Types::String
      end
      attribute :delivery_cost do
        attribute? :import_charges, EbayAPI::Amount
        attribute :shipping_cost, EbayAPI::Amount
        attribute? :shipping_intermediation_fee, EbayAPI::Amount
      end
      attribute? :discounted_line_item_cost, EbayAPI::Amount
      attribute? :ebay_collect_and_remit_taxes, Types::Array do
        attribute? :amount, EbayAPI::Amount
        attribute? :tax_type, Types::String
        attribute? :collection_method, Types::String
      end
      attribute? :gift_details do
        attribute? :message, Types::String
        attribute :recipient_email, Types::String
        attribute :sender_name, Types::String
      end
      attribute :legacy_item_id, Types::String
      attribute? :legacy_variation_id, Types::String
      attribute :line_item_cost, EbayAPI::Amount
      attribute :line_item_fulfillment_instructions do
        attribute? :destination_time_zone, Types::String
        attribute :guaranteed_delivery, Types::Bool
        attribute :max_estimated_delivery_date, Types::DateTime.constructor(&:to_datetime)
        attribute :min_estimated_delivery_date, Types::DateTime.constructor(&:to_datetime)
        attribute :ship_by_date, Types::DateTime.constructor(&:to_datetime)
        attribute? :source_time_zone, Types::String
      end
      attribute :line_item_fulfillment_status, Types::String
      attribute :line_item_id, Types::String
      attribute :listing_marketplace_id, Types::String
      attribute :properties do
        attribute :buyer_protection, Types::Bool
        attribute? :from_best_offer, Types::Bool
        attribute? :sold_via_ad_campaign, Types::Bool
      end
      attribute :purchase_marketplace_id, Types::String
      attribute :quantity, Types::Integer
      attribute :refunds, Types::Array do
        attribute? :amount, EbayAPI::Amount
        attribute? :refund_date, Types::DateTime.constructor(&:to_datetime)
        attribute? :refund_id, Types::String
        attribute? :refund_reference_id, Types::String
      end
      attribute? :sku, Types::String
      attribute :sold_format, Types::String
      attribute :taxes, Types::Array do
        attribute? :amount, EbayAPI::Amount
      end
      attribute :title, Types::String
      attribute :total, EbayAPI::Amount
    end
    attribute :order_fulfillment_status, Types::String
    attribute :order_id, Types::String
    attribute :order_payment_status, Types::String
    attribute :payment_summary do
      attribute :payments, Types::Array do
        attribute :amount, EbayAPI::Amount
        attribute? :payment_date, Types::DateTime.constructor(&:to_datetime)
        attribute? :payment_holds, Types::Array do
          attribute? :expected_release_date, Types::DateTime.constructor(&:to_datetime)
          attribute? :hold_amount, EbayAPI::Amount
          attribute? :hold_reason, Types::String
          attribute? :hold_state, Types::String
          attribute? :release_date, Types::DateTime.constructor(&:to_datetime)
          attribute? :seller_actions_to_release, Types::Array do
            attribute? :seller_action_to_release, Types::String
          end
        end
        attribute :payment_method, Types::String
        attribute? :payment_reference_id, Types::String
        attribute :payment_status, Types::String
      end
      attribute :refunds, Types::Array do
        attribute? :amount, EbayAPI::Amount
        attribute? :refund_date, Types::DateTime.constructor(&:to_datetime)
        attribute? :refund_id, Types::String
        attribute? :refund_reference_id, Types::String
        attribute? :refund_status, Types::String
      end
      attribute :total_due_seller, EbayAPI::Amount
    end
    attribute :pricing_summary do
      attribute? :adjustment, EbayAPI::Amount
      attribute :delivery_cost, EbayAPI::Amount
      attribute? :delivery_discount, EbayAPI::Amount
      attribute? :fee, EbayAPI::Amount
      attribute? :price_discount_subtotal, EbayAPI::Amount
      attribute :price_subtotal, EbayAPI::Amount
      attribute? :tax, EbayAPI::Amount
      attribute :total, EbayAPI::Amount
    end
    attribute? :sales_record_reference, Types::String
    attribute :seller_id, Types::String

    def self.collection_name
      'order'
    end
  end
end
