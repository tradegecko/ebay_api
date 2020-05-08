require 'ebay_api/version'

require 'oauth2'
require 'active_support/all'
require 'httparty'
require 'dry-struct'
require 'pry'
require 'nokogiri'

require 'ebay_api/client'
require 'ebay_api/concerns/singleton'
require 'ebay_api/resources/api/item'
require 'ebay_api/resources/api/order'

module EbayAPI
  class Error < StandardError; end
  class InvalidToken < StandardError; end
  class InvalidPage < StandardError; end
  # Your code goes here...
end
