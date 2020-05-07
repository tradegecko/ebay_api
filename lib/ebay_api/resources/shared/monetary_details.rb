require 'ebay_api/resource'
require 'ebay_api/resources/shared/amount'

module EbayAPI
  class MonetaryDetails < Resource
    attribute? :payments do
      attribute? :payment, Types::Array do
        attribute? :fee_or_credit_amount, EbayAPI::Amount
        attribute? :payee, Types::Array do
          attribute? :type, Types::String.optional
          attribute? :value, Types::String.optional
        end
        attribute? :payment_amount, EbayAPI::Amount
        attribute? :payment_reference_id, Types::Array do
          attribute? :type, Types::String.optional
          attribute? :value, Types::String.optional
        end
        attribute? :payment_status, Types::String.optional
        attribute? :payment_time, Types::Params::DateTime
        attribute? :reference_id do
          attribute? :type, Types::String.optional
          attribute? :value, Types::String.optional
        end
      end
    end
    attribute? :refunds do
      attribute? :refund, Types::Array do
        attribute? :fee_or_credit_amount, EbayAPI::Amount
        attribute? :reference_id do
          attribute? :type, Types::String.optional
          attribute? :value, Types::String.optional
        end
        attribute? :refund_amount, EbayAPI::Amount
        attribute? :refund_status, Types::String.optional
        attribute? :refund_time, Types::Params::DateTime
        attribute? :refund_to do
          attribute? :type, Types::String.optional
          attribute? :value, Types::String.optional
        end
        attribute? :refund_type, Types::String.optional
      end
    end
  end
end
