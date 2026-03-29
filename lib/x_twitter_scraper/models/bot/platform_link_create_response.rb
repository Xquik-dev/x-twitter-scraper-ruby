# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Bot
      # @see XTwitterScraper::Resources::Bot::PlatformLinks#create
      class PlatformLinkCreateResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute platform
        #
        #   @return [String]
        required :platform, String

        # @!attribute platform_user_id
        #
        #   @return [String]
        required :platform_user_id, String, api_name: :platformUserId

        # @!method initialize(id:, created_at:, platform:, platform_user_id:)
        #   @param id [String]
        #   @param created_at [Time]
        #   @param platform [String]
        #   @param platform_user_id [String]
      end
    end
  end
end
