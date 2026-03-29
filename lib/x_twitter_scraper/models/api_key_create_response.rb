# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::APIKeys#create
    class APIKeyCreateResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute full_key
      #
      #   @return [String]
      required :full_key, String, api_name: :fullKey

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute prefix
      #
      #   @return [String]
      required :prefix, String

      # @!method initialize(id:, created_at:, full_key:, name:, prefix:)
      #   @param id [String]
      #   @param created_at [Time]
      #   @param full_key [String]
      #   @param name [String]
      #   @param prefix [String]
    end
  end
end
