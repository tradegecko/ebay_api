require 'ebay_api/resource'

module EbayAPI
  class ApiAccessRule < Resource
    def self.get_api_access_rules

      body = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
        xml.GetApiAccessRulesRequest("xmlns" => "urn:ebay:apis:eBLBaseComponents")
      end.to_xml

      response = http_request(__method__, body)
      return [] if response['GetApiAccessRulesResponse']['ApiAccessRule'].nil?

      response['GetApiAccessRulesResponse']['ApiAccessRule']
    end
  end
end
