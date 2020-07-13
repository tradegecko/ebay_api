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
  class Error < StandardError
    attr_reader :code, :long_message
    def initialize(error)
      @code = error['ErrorCode']
      @long_message = error['LongMessage']
      super(error['ShortMessage'])
    end
  end

  class DailyLimitExceeded < Error
  end

  class UserLimitExceeded < Error
  end

  class CallUsageLimitReached < Error
  end
end
