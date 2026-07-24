# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Support
      # @see XTwitterScraper::Resources::Support::Tickets#update
      class TicketUpdateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute status
        #
        #   @return [Symbol, XTwitterScraper::Models::Support::TicketUpdateParams::Status]
        required :status, enum: -> { XTwitterScraper::Support::TicketUpdateParams::Status }

        # @!method initialize(id:, status:, request_options: {})
        #   @param id [String]
        #   @param status [Symbol, XTwitterScraper::Models::Support::TicketUpdateParams::Status]
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

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
