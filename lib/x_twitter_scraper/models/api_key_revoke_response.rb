# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::APIKeys#revoke
    class APIKeyRevokeResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(success: true)
      #   @param success [Boolean, true]
    end
  end
end
