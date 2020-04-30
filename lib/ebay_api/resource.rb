require 'dry-types'
require 'dry-struct'
require 'ebay_api/concerns/singleton'

module EbayAPI
  class Resource < Dry::Struct
    include EbayAPI::Singleton

    transform_keys(&:to_sym)

    module Types
      include Dry.Types()
    end

    # def initialize(params={})
    #   pry
    #   # self.class.include_root_in_json = !!legacy_api?
    #   @raw_params = params.dup
    #   # if params.is_a?(Hash) && params.has_key?('attributes')
    #   #   params['wc_attributes'] = params.delete('attributes')
    #   # end
    #   load(params)
    #   super()
    # end

    # def load(params)
    #   params.each do |attr, value|
    #     self.send("#{attr}=", value) if self.respond_to?("#{attr}=", true)
    #   end if params
    #   self
    # end
  end
end
