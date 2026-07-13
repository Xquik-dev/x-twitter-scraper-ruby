# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Monitors
      # @see XTwitterScraper::Resources::Monitors::Keywords#deactivate
      class KeywordDeactivateResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(success: true)
        #   @param success [Boolean, true]
      end
    end
  end
end
