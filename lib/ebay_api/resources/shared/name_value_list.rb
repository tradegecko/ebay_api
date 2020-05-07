require 'ebay_api/resource'

module EbayAPI
  class NameValueList < Resource
    attribute? :name, Types::String
    attribute? :source, Types::String
    attribute? :value, Types::EbayArray.of(Types::String)
  end
end
