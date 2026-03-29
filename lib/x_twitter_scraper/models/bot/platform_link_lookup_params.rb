# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Bot
      # @see XTwitterScraper::Resources::Bot::PlatformLinks#lookup
      class PlatformLinkLookupParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute platform
        #
        #   @return [String]
        required :platform, String

        # @!attribute platform_user_id
        #
        #   @return [String]
        required :platform_user_id, String

        # @!method initialize(platform:, platform_user_id:, request_options: {})
        #   @param platform [String]
        #   @param platform_user_id [String]
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
