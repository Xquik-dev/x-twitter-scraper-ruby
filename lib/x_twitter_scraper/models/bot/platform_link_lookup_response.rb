# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Bot
      # @see XTwitterScraper::Resources::Bot::PlatformLinks#lookup
      class PlatformLinkLookupResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String, api_name: :userId

        # @!method initialize(user_id:)
        #   @param user_id [String]
      end
    end
  end
end
