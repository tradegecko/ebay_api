require 'ebay_api/resource'
require 'ebay_api/resources/shared/amount'

module EbayAPI
  class ExternalTransaction < Resource
    attribute? :external_transaction_id, Types::String.optional
    attribute? :external_transaction_status, Types::String.optional
    attribute? :external_transaction_time, Types::Params::DateTime
    attribute? :fee_or_credit_amount, EbayAPI::Amount
    attribute? :payment_or_refund_amount, EbayAPI::Amount
  end
end
