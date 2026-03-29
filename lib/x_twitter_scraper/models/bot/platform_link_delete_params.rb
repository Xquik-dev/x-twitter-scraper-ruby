# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Bot
      # @see XTwitterScraper::Resources::Bot::PlatformLinks#delete
      class PlatformLinkDeleteParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute platform
        #
        #   @return [Symbol, XTwitterScraper::Models::Bot::PlatformLinkDeleteParams::Platform]
        required :platform, enum: -> { XTwitterScraper::Bot::PlatformLinkDeleteParams::Platform }

        # @!attribute platform_user_id
        #
        #   @return [String]
        required :platform_user_id, String, api_name: :platformUserId

        # @!method initialize(platform:, platform_user_id:, request_options: {})
        #   @param platform [Symbol, XTwitterScraper::Models::Bot::PlatformLinkDeleteParams::Platform]
        #   @param platform_user_id [String]
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

        module Platform
          extend XTwitterScraper::Internal::Type::Enum

          TELEGRAM = :telegram

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
