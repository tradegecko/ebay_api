require 'ebay_api/version'

require 'oauth2'
require 'active_support/all'
require 'httparty'
require 'pry'

require 'ebay_api/client'
require 'ebay_api/concerns/singleton'
require 'ebay_api/resources/inventory_item'

module EbayAPI
  class Error < StandardError; end
  class InvalidToken < StandardError; end  
  # Your code goes here...
end
