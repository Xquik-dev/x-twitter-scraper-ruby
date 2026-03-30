# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Dm#send_
      class DmSendResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute message_id
        #
        #   @return [String]
        required :message_id, String, api_name: :messageId

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(message_id:, success: true)
        #   @param message_id [String]
        #   @param success [Boolean, true]
      end
    end
  end
end
