require 'ebay_api/resource'
require 'ebay_api/resources/shared/amount'

module EbayAPI
  class TaxDetails < Resource
    attribute? :collection_method, Types::String.optional
    attribute? :imposition, Types::String.optional
    attribute? :tax_amount, EbayAPI::Amount
    attribute? :tax_code, Types::String.optional
    attribute? :tax_description, Types::String.optional
    attribute? :tax_on_handling_amount, EbayAPI::Amount
    attribute? :tax_on_shipping_amount, EbayAPI::Amount
    attribute? :tax_on_subtotal_amount, EbayAPI::Amount
  end
end
