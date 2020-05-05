require 'ebay_api/resource'

module EbayAPI
  class Address < Resource
    attribute? :address_attribute, Types::EbayArray.of(Types::String)
    attribute? :address_id, Types::String
    attribute? :address_owner, Types::String
    attribute? :address_usage, Types::String
    attribute? :city_name, Types::String
    attribute? :company_name, Types::String
    attribute? :country, Types::String
    attribute? :country_name, Types::String
    attribute? :county, Types::String
    attribute? :external_address_id, Types::String
    attribute? :first_name, Types::String
    attribute? :international_name, Types::String
    attribute? :international_state_and_city, Types::String
    attribute? :international_street, Types::String
    attribute? :last_name, Types::String
    attribute? :name, Types::String
    attribute? :phone, Types::String
    attribute? :phone2, Types::String
    attribute? :phone_area_or_city_code, Types::String
    attribute? :phone_country_code, Types::String
    attribute? :phone_country_prefix, Types::String
    attribute? :phone_local_number, Types::String
    attribute? :postal_code, Types::String
    attribute? :reference_id, Types::String
    attribute? :state_or_province, Types::String
    attribute? :street, Types::String
    attribute? :street1, Types::String
    attribute? :street2, Types::String
  end
end
