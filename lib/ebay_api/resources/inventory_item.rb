require 'ebay_api/resource'

module EbayAPI
  class InventoryItem < Resource
    attribute :sku, Types::Strict::String
    attribute? :description, Types::String

    def self.collection_name
      'inventory_item'
    end
  end
end
