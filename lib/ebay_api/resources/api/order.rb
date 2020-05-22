require 'ebay_api/resource'
require 'ebay_api/resources/shared/address'
require 'ebay_api/resources/shared/amount'
require 'ebay_api/resources/shared/external_transaction'
require 'ebay_api/resources/shared/monetary_details'
require 'ebay_api/resources/shared/multi_leg_shipping_details'
require 'ebay_api/resources/shared/payment_hold_details'
require 'ebay_api/resources/shared/pickup_method_selected'
require 'ebay_api/resources/shared/shipping_details'
require 'ebay_api/resources/shared/shipping_service_selected'
require 'ebay_api/resources/shared/tax_details'
require 'ebay_api/resources/shared/user'

module EbayAPI
  class Order < Resource
    attribute? :adjustment_amount, EbayAPI::Amount
    attribute? :amount_paid, EbayAPI::Amount
    attribute? :amount_saved, EbayAPI::Amount
    attribute? :buyer_checkout_message, Types::String.optional
    attribute? :buyer_package_enclosures, Types::EbayArray do
      attribute? :type, Types::String.optional
      attribute? :value, Types::String.optional
    end
    attribute? :buyer_tax_identifier, Types::EbayArray do
      attribute? :attribute, Types::EbayArray do
        attribute? :name, Types::String.optional
        attribute? :value, Types::String.optional
      end
      attribute? :id, Types::String.optional
      attribute? :type, Types::String.optional
    end
    attribute? :buyer_user_id, Types::String.optional
    attribute? :cancel_detail, Types::EbayArray do
      attribute? :cancel_complete_date, Types::Params::DateTime
      attribute? :cancel_initiation_date, Types::Params::DateTime
      attribute? :cancelintiator, Types::String.optional
      attribute? :cancel_reason, Types::String.optional
      attribute? :cancel_reason_details, Types::String.optional
    end
    attribute? :cancel_reason, Types::String.optional
    attribute? :cancel_reason_details, Types::String.optional
    attribute? :cancel_status, Types::String.optional
    attribute? :checkout_status do
      attribute? :e_bay_payment_status, Types::String.optional
      attribute? :integrated_merchant_credit_card_enabled, Types::Params::Bool
      attribute? :last_modified_time, Types::Params::DateTime
      attribute? :payment_instrument, Types::String.optional
      attribute? :payment_method, Types::String.optional
      attribute? :status, Types::String.optional
    end
    attribute? :containse_bay_plus_transaction, Types::Params::Bool
    attribute? :created_time, Types::Params::DateTime
    attribute? :creating_user_role, Types::String.optional
    attribute? :e_bay_collect_and_remit_tax, Types::Params::Bool
    attribute? :eias_token, Types::String.optional
    attribute? :extended_order_id, Types::String.optional
    attribute? :external_transaction, Types::EbayArray.of(EbayAPI::ExternalTransaction)
    attribute? :integrated_merchant_credit_card_enabled, Types::Params::Bool
    attribute? :is_multi_leg_shipping, Types::Params::Bool
    attribute? :logistics_plan_type, Types::String.optional
    attribute? :monetary_details, EbayAPI::MonetaryDetails
    attribute? :multi_leg_shipping_details, EbayAPI::MultiLegShippingDetails
    attribute? :order_id, Types::String.optional
    attribute? :order_status, Types::String.optional
    attribute? :paid_time, Types::Params::DateTime
    attribute? :payment_hold_details, EbayAPI::PaymentHoldDetails
    attribute? :payment_hold_status, Types::String.optional
    attribute? :payment_methods, Types::EbayArray.of(Types::String.optional)
    attribute? :pickup_details do
      attribute? :pickup_options, Types::EbayArray do
        attribute? :pickup_method, Types::String.optional
        attribute? :pickup_priority, Types::Coercible::Integer
      end
    end
    attribute? :pickup_method_selected, EbayAPI::PickupMethodSelected
    attribute? :seller_eias_token, Types::String.optional
    attribute? :seller_email, Types::String.optional
    attribute? :seller_user_id, Types::String.optional
    attribute? :shipped_time, Types::Params::DateTime
    attribute? :shipping_address, EbayAPI::Address
    attribute? :shipping_details, EbayAPI::ShippingDetails
    attribute? :shipping_service_selected, EbayAPI::ShippingServiceSelected
    attribute? :subtotal, EbayAPI::Amount
    attribute? :total, EbayAPI::Amount
    attribute? :transaction_array do
      attribute? :transaction, Types::EbayArray do
        attribute? :actual_handling_cost, EbayAPI::Amount
        attribute? :actual_shipping_cost, EbayAPI::Amount
        attribute? :buyer, EbayAPI::User
        attribute? :buyer_package_enclosures do
          attribute? :buyer_package_enclosure, Types::EbayArray do
            attribute? :type, Types::String.optional
            attribute? :value, Types::String.optional
          end
        end
        attribute? :created_date, Types::Params::DateTime
        attribute? :digital_delivery_selected do
          attribute? :delivery_details do
            attribute? :recipient do
              attribute? :email, Types::String.optional
              attribute? :name, Types::String.optional
            end
            attribute? :sender do
              attribute? :email, Types::String.optional
              attribute? :name, Types::String.optional
            end
            attribute? :delivery_method, Types::String.optional
            attribute? :delivery_status do
              attribute? :email, Types::String.optional
            end
          end
        end
        attribute? :e_bay_collect_and_remit_tax, Types::Params::Bool
        attribute? :e_bay_collect_and_remit_taxes do
          attribute? :tax_details, Types::EbayArray.of(EbayAPI::TaxDetails)
          attribute? :total_tax_amount, EbayAPI::Amount
        end
        attribute? :e_bay_plus_transaction, Types::Params::Bool
        attribute? :extended_order_id, Types::String.optional
        attribute? :external_transaction, Types::EbayArray.of(EbayAPI::ExternalTransaction)
        attribute? :final_value_fee, EbayAPI::Amount
        attribute? :gift, Types::Params::Bool
        attribute? :gift_summary do
          attribute? :message, Types::String.optional
        end
        attribute? :guaranteed_delivery, Types::Params::Bool
        attribute? :guaranteed_shipping, Types::Params::Bool
        attribute? :inventory_reservation_id, Types::String.optional
        attribute? :invoice_sent_time, Types::Params::DateTime
        attribute? :item do
          attribute? :integrated_merchant_credit_card_enabled, Types::Params::Bool
          attribute? :item_id, Types::String.optional
          attribute? :site, Types::String.optional
          attribute? :sku, Types::String.optional
          attribute? :title, Types::String.optional
        end
        attribute? :logistics_plan_type, Types::String.optional
        attribute? :monetary_details, EbayAPI::MonetaryDetails
        attribute? :multi_leg_shipping_details, EbayAPI::MultiLegShippingDetails
        attribute? :order_line_item_id, Types::String.optional
        attribute? :paid_time, Types::Params::DateTime
        attribute? :payment_hold_details, EbayAPI::PaymentHoldDetails
        attribute? :pickup_method_selected, EbayAPI::PickupMethodSelected
        attribute? :quantity_purchased, Types::Coercible::Integer
        attribute? :seller_discounts do
          attribute? :original_item_price, EbayAPI::Amount
          attribute? :original_item_shipping_cost, EbayAPI::Amount
          attribute? :original_shipping_service, Types::String.optional
          attribute? :seller_discount, Types::EbayArray do
            attribute? :campaign_display_name, Types::String.optional
            attribute? :campaign_id, Types::String.optional
            attribute? :item_discount_amount, EbayAPI::Amount
            attribute? :shipping_discount_amount, EbayAPI::Amount
          end
        end
        attribute? :shipped_time, Types::Params::DateTime
        attribute? :shipping_details, EbayAPI::ShippingDetails
        attribute? :shipping_service_selected, EbayAPI::ShippingServiceSelected
        attribute? :status do
          attribute? :digital_status, Types::String.optional
          attribute? :inquiry_status, Types::String.optional
          attribute? :integrated_merchant_credit_card_enabled, Types::Params::Bool
          attribute? :payment_hold_status, Types::String.optional
          attribute? :payment_instrument, Types::String.optional
          attribute? :return_status, Types::String.optional
        end
        attribute? :taxes do
          attribute? :tax_details, Types::EbayArray.of(EbayAPI::TaxDetails)
          attribute? :total_tax_amount, EbayAPI::Amount
        end
        attribute? :transaction_id, Types::String.optional
        attribute? :transaction_price, EbayAPI::Amount
        attribute? :transaction_site_id, Types::String.optional
        attribute? :unpaid_item do
          attribute? :status, Types::String.optional
          attribute? :type, Types::String.optional
        end
        attribute? :variation do
          attribute? :sku, Types::String.optional
          attribute? :variation_specifics, Types::EbayArray do
            attribute? :name_value_list, Types::EbayArray do
              attribute? :name, Types::String.optional
              attribute? :value, Types::EbayArray.of(Types::String.optional)
            end
          end
          attribute? :variation_title, Types::String.optional
          attribute? :variation_view_item_url, Types::String.optional
        end
      end
    end

    def self.collection_name
      'order'
    end

    def self.get_orders(params = {})
      # TODO : Ensure Options can be used instead of order_ids
      return if (params[:order_ids].nil? && params[:create_time_from].nil? && params[:mod_time_from].nil?)

      body = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
        xml.GetOrdersRequest("xmlns" => "urn:ebay:apis:eBLBaseComponents") do
          if (params[:order_ids].present?)
            xml.OrderIDArray do
              params[:order_ids].each do |order_id|
                xml.OrderID order_id
              end
            end
          else
            xml.CreateTimeFrom params[:create_time_from] if params[:create_time_from]
            xml.CreateTimeTo params[:create_time_to] if  params[:create_time_to]
            xml.ModTimeFrom  params[:mod_time_from] if params[:mod_time_from]
            xml.ModTimeTo    params[:mod_time_to] if params[:mod_time_to]
            xml.NumberOfDays params[:number_of_days] if params[:number_of_days]
          end
          xml.Pagination {
            xml.EntriesPerPage params[:limit] || 200
            xml.PageNumber params[:page] || 1
          }
        end
      end.to_xml

      response = http_request(__method__, body)
      orders = Array.wrap(response['GetOrdersResponse']['OrderArray']['Order'])
      orders.map { |order| new(order) }
    rescue EbayAPI::InvalidPage
      []
    end

    def self.get_order(order_id)
      orders = get_orders({order_ids: Array.wrap(order_id)})
      orders.one? ? orders.first : orders
    end

    def self.ship_line_item(order_line_item_id, shipment_tracking_number, shipping_carrier_used)
      response = complete_sale(nil, order_line_item_id, shipment_tracking_number, shipping_carrier_used)
      raise EbayAPI::Error if response['CompleteSaleResponse']['Ack'] != 'Success'

      return true
    end

    def self.ship_order(order_id, shipment_tracking_number, shipping_carrier_used)
      response = complete_sale(order_id, nil, shipment_tracking_number, shipping_carrier_used)
      raise EbayAPI::Error if response['CompleteSaleResponse']['Ack'] != 'Success'

      return true
    end

    private_class_method def self.complete_sale(order_id, order_line_item_id, tracking_number, carrier_used)
      body = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
        xml.CompleteSaleRequest("xmlns" => "urn:ebay:apis:eBLBaseComponents") do
          xml.OrderID order_id if order_id
          xml.OrderLineItemID order_line_item_id if order_line_item_id
          xml.Shipment {
            xml.ShipmentTrackingDetails {
              xml.ShipmentTrackingNumber tracking_number
              xml.ShippingCarrierUsed carrier_used
            }
            xml.ShippedTime Time.now.utc
          }
          xml.Shipped true
        end
      end.to_xml

      response = http_request(__method__, body)
    end
  end
end
