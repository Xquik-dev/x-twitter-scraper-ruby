# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Support
      # @see XTwitterScraper::Resources::Support::Tickets#list
      class TicketListResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute tickets
        #
        #   @return [Array<XTwitterScraper::Models::Support::TicketListResponse::Ticket>]
        required :tickets,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Support::TicketListResponse::Ticket] }

        # @!method initialize(tickets:)
        #   @param tickets [Array<XTwitterScraper::Models::Support::TicketListResponse::Ticket>]

        class Ticket < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time, api_name: :createdAt

          # @!attribute message_count
          #
          #   @return [Integer]
          required :message_count, Integer, api_name: :messageCount

          # @!attribute public_id
          #
          #   @return [String]
          required :public_id, String, api_name: :publicId

          # @!attribute status
          #
          #   @return [Symbol, XTwitterScraper::Models::Support::TicketListResponse::Ticket::Status]
          required :status, enum: -> { XTwitterScraper::Models::Support::TicketListResponse::Ticket::Status }

          # @!attribute subject
          #
          #   @return [String]
          required :subject, String

          # @!attribute updated_at
          #
          #   @return [Time]
          required :updated_at, Time, api_name: :updatedAt

          # @!method initialize(created_at:, message_count:, public_id:, status:, subject:, updated_at:)
          #   @param created_at [Time]
          #   @param message_count [Integer]
          #   @param public_id [String]
          #   @param status [Symbol, XTwitterScraper::Models::Support::TicketListResponse::Ticket::Status]
          #   @param subject [String]
          #   @param updated_at [Time]

          # @see XTwitterScraper::Models::Support::TicketListResponse::Ticket#status
          module Status
            extend XTwitterScraper::Internal::Type::Enum

            OPEN = :open
            IN_PROGRESS = :in_progress
            RESOLVED = :resolved
            CLOSED = :closed

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
