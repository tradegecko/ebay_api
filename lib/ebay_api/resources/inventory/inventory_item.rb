require 'ebay_api/resource'
require 'ebay_api/resources/inventory/product'

module EbayAPI
  class InventoryItem < Resource
    TIME_DURATION = Types::String.enum(
      'YEAR',
      'MONTH',
      'DAY',
      'HOUR',
      'CALENDAR_DAY',
      'BUSINESS_DAY',
      'MINUTE',
      'SECOND',
      'MILLISECOND'
    )

    CONDITION = Types::String.enum(
      'NEW',
      'LIKE_NEW',
      'NEW_OTHER',
      'NEW_WITH_DEFECTS',
      'MANUFACTURER_REFURBISHED',
      'SELLER_REFURBISHED',
      'USED_EXCELLENT',
      'USED_VERY_GOOD',
      'USED_GOOD',
      'USED_ACCEPTABLE',
      'FOR_PARTS_OR_NOT_WORKING'
    )

    LOCALE = Types::String.enum(
      'en_US', 'en_CA', 'fr_CA', 'en_GB', 'en_AU', 'en_IN', 'de_AT', 'fr_BE',
      'fr_FR', 'de_DE', 'it_IT', 'nl_BE', 'nl_NL', 'es_ES', 'de_CH', 'fi_FI',
      'zh_HK', 'hu_HU', 'en_PH', 'pl_PL', 'pt_PT', 'ru_RU', 'en_SG', 'en_IE',
      'en_MY'
    )

    LENGTH_UNIT = Types::String.enum('INCH', 'FEET', 'CENTIMETER', 'METER')

    PACKAGE_TYPES = Types::String

    attribute :item_id, Types::String
    attribute? :sku, Types::String
    attribute? :availability do
      attribute? :pickup_at_location_availability, Types::Array do
        attribute :availability_type, Types::String.enum(
          'IN_STOCK',
          'OUT_OF_STOCK',
          'SHIP_TO_STORE'
        )
        attribute? :fulfillment_time do
          attribute :unit, TIME_DURATION
          attribute :value, Types::Integer
        end
        attribute :quantity, Types::Integer
      end
      attribute? :ship_to_location_availability do
        attribute :quantity, Types::Integer
      end
    end
    attribute? :condition, CONDITION
    attribute? :condition_description, Types::String
    attribute? :group_ids, Types::Array.of(Types::String)
    attribute? :inventory_item_group_keys, Types::Array.of(Types::String)
    attribute? :locale, LOCALE
    attribute? :package_weight_and_size do
      attribute? :dimensions do
        attribute :height, Types::Float
        attribute :length, Types::Float
        attribute :width, Types::Float
        attribute :unit, LENGTH_UNIT
      end
      attribute? :package_type, Types::String
      attribute? :weight do
        attribute :unit, Types::String
        attribute :value, Types::Float
      end
    end
    attribute? :product, EbayAPI::Product

    def self.collection_name
      'inventory_item'
    end

    def self.get_item(id)
      return unless id.present?

      body = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
        xml.GetItemRequest("xmlns" => "urn:ebay:apis:eBLBaseComponents") do
          xml.ItemID id
        end
      end.to_xml

      response = http_request(__method__, body)
      new(response['GetItemResponse']['Item'])
    end

    def self.get_seller_list(params = {})
      start_time_to = params[:start_time_to] || Time.now.utc
      start_time_from = params[:start_time_from] || start_time_to - 100.days

      body = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
        xml.GetSellerListRequest("xmlns" => "urn:ebay:apis:eBLBaseComponents") do
          xml.IncludeVariations true
          xml.Sort params[:sort] if params[:sort]
          xml.StartTimeFrom start_time_from
          xml.StartTimeTo start_time_to
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
      response['GetSellerListResponse']['ItemArray']['Item'].map do |item|
        new(item)
      end
    end
  end
end
