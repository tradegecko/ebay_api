require 'ebay_api/resource'

module EbayAPI
  class Address < Resource
    attribute :address_line1, Types::String
    attribute? :address_line2, Types::String
    attribute :city, Types::String
    attribute :country_code, Types::String
    attribute? :county, Types::String
    attribute? :postal_code, Types::String
    attribute? :state_or_province, Types::String
  end
end
