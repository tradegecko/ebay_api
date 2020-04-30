require 'ebay_api/resource'

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
      attribute :dimensions do
        attribute :height, Types::Integer
        attribute :length, Types::Integer
        attribute :width, Types::Integer
        attribute :unit, LENGTH_UNIT
      end
      attribute :package_type, Types::String
      attribute :weight do
        attribute :unit, Types::String
        attribute :value, Types::Integer
      end
    end

    def self.collection_name
      'inventory_item'
    end
  end
end
