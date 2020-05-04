module EbayAPI
  class Product < Resource
    attribute? :aspects do
      attribute? :brand, Types::Array.of(Types::String)
      attribute? :storage_type, Types::Array.of(Types::String)
    end
    attribute? :brand, Types::String
    attribute? :description, Types::String
    attribute? :ean, Types::Array.of(Types::String)
    attribute? :epid, Types::String
    attribute? :image_urls, Types::Array.of(Types::String)
    attribute? :isbn, Types::Array.of(Types::String)
    attribute? :mpn, Types::String
    attribute? :subtitle, Types::String
    attribute? :title, Types::String
    attribute? :upc, Types::Array.of(Types::String)
  end
end
