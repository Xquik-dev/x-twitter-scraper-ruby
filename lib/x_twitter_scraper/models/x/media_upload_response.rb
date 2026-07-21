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

        # @!attribute media_url
        #   Public media URL for tweet `media` arrays.
        #
        #   @return [String]
        required :media_url, String, api_name: :mediaUrl

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(media_id:, media_url:, success: true)
        #   @param media_id [String]
        #
        #   @param media_url [String] Public media URL for tweet `media` arrays.
        #
        #   @param success [Boolean, true]
      end
    end
  end
end
