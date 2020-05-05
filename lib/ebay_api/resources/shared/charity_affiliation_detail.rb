require 'ebay_api/resource'

module EbayAPI
  class CharityAffiliationDetailType < Resource
    attribute? :affiliation_type, Types::String
    attribute? :charity_id, Types::String
    attribute? :last_time_used, Types::Params::DateTime
  end
end