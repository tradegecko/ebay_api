require 'ebay_api/resource'

module EbayAPI
  class Address < Resource
    attribute? :address_attribute, Types::EbayArray do
      attribute :type, Types::String.optional.optional
      attribute :value, Types::String.optional.optional
    end
    attribute? :address_id, Types::String.optional
    attribute? :address_owner, Types::String.optional
    attribute? :address_usage, Types::String.optional
    attribute? :city_name, Types::String.optional
    attribute? :company_name, Types::String.optional
    attribute? :country, Types::String.optional
    attribute? :country_name, Types::String.optional
    attribute? :county, Types::String.optional
    attribute? :external_address_id, Types::String.optional
    attribute? :first_name, Types::String.optional
    attribute? :international_name, Types::String.optional
    attribute? :international_state_and_city, Types::String.optional
    attribute? :international_street, Types::String.optional
    attribute? :last_name, Types::String.optional
    attribute? :name, Types::String.optional
    attribute? :phone, Types::String.optional
    attribute? :phone2, Types::String.optional
    attribute? :phone_area_or_city_code, Types::String.optional
    attribute? :phone_country_code, Types::String.optional
    attribute? :phone_country_prefix, Types::String.optional
    attribute? :phone_local_number, Types::String.optional
    attribute? :postal_code, Types::String.optional
    attribute? :reference_id, Types::String.optional
    attribute? :state_or_province, Types::String.optional
    attribute? :street, Types::String.optional
    attribute? :street1, Types::String.optional
    attribute? :street2, Types::String.optional
  end
end
