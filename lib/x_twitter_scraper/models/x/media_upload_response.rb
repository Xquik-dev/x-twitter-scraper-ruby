# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Media#upload
      class MediaUploadResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute media_id
        #
        #   @return [String]
        required :media_id, String, api_name: :mediaId

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(media_id:, success: true)
        #   @param media_id [String]
        #   @param success [Boolean, true]
      end
    end
  end
end
