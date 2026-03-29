# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Support
      # @see XTwitterScraper::Resources::Support::Tickets#reply
      class TicketReplyResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute public_id
        #
        #   @return [String, nil]
        optional :public_id, String, api_name: :publicId

        # @!method initialize(public_id: nil)
        #   @param public_id [String]
      end
    end
  end
end
