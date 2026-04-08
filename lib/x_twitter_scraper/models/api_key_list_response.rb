# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::APIKeys#list
    class APIKeyListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute keys
      #
      #   @return [Array<XTwitterScraper::Models::APIKeyListResponse::Key>]
      required :keys,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::APIKeyListResponse::Key] }

      # @!method initialize(keys:)
      #   @param keys [Array<XTwitterScraper::Models::APIKeyListResponse::Key>]

      class Key < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute is_active
        #
        #   @return [Boolean]
        required :is_active, XTwitterScraper::Internal::Type::Boolean, api_name: :isActive

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute prefix
        #
        #   @return [String]
        required :prefix, String

        # @!attribute last_used_at
        #
        #   @return [Time, nil]
        optional :last_used_at, Time, api_name: :lastUsedAt

        # @!method initialize(id:, created_at:, is_active:, name:, prefix:, last_used_at: nil)
        #   API key metadata returned when listing keys.
        #
        #   @param id [String]
        #   @param created_at [Time]
        #   @param is_active [Boolean]
        #   @param name [String]
        #   @param prefix [String]
        #   @param last_used_at [Time]
      end
    end
  end
end
