# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Integrations#send_test
    class IntegrationSendTestResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(success: true)
      #   @param success [Boolean, true]
    end
  end
end
