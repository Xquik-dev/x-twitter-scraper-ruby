# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Support
      # @see XTwitterScraper::Resources::Support::Tickets#update
      class TicketUpdateResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute public_id
        #
        #   @return [String]
        required :public_id, String, api_name: :publicId

        # @!attribute status
        #
        #   @return [Symbol, XTwitterScraper::Models::Support::TicketUpdateResponse::Status]
        required :status, enum: -> { XTwitterScraper::Models::Support::TicketUpdateResponse::Status }

        # @!method initialize(public_id:, status:)
        #   @param public_id [String]
        #   @param status [Symbol, XTwitterScraper::Models::Support::TicketUpdateResponse::Status]

        # @see XTwitterScraper::Models::Support::TicketUpdateResponse#status
        module Status
          extend XTwitterScraper::Internal::Type::Enum

          OPEN = :open
          RESOLVED = :resolved
          CLOSED = :closed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
