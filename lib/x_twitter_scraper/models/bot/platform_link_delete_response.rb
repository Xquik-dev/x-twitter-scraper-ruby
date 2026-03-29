# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Bot
      # @see XTwitterScraper::Resources::Bot::PlatformLinks#delete
      class PlatformLinkDeleteResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute success
        #
        #   @return [Boolean, nil]
        optional :success, XTwitterScraper::Internal::Type::Boolean

        # @!method initialize(success: nil)
        #   @param success [Boolean]
      end
    end
  end
end
