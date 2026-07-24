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
        #   @return [Array<XTwitterScraper::Models::Support::TicketListResponse::Ticket>, nil]
        optional :tickets,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Support::TicketListResponse::Ticket] }

        # @!method initialize(tickets: nil)
        #   @param tickets [Array<XTwitterScraper::Models::Support::TicketListResponse::Ticket>]

        class Ticket < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute created_at
          #
          #   @return [Time, nil]
          optional :created_at, Time, api_name: :createdAt

          # @!attribute message_count
          #
          #   @return [Integer, nil]
          optional :message_count, Integer, api_name: :messageCount

          # @!attribute public_id
          #
          #   @return [String, nil]
          optional :public_id, String, api_name: :publicId

          # @!attribute status
          #
          #   @return [String, nil]
          optional :status, String

          # @!attribute subject
          #
          #   @return [String, nil]
          optional :subject, String

          # @!attribute updated_at
          #
          #   @return [Time, nil]
          optional :updated_at, Time, api_name: :updatedAt

          # @!method initialize(created_at: nil, message_count: nil, public_id: nil, status: nil, subject: nil, updated_at: nil)
          #   @param created_at [Time]
          #   @param message_count [Integer]
          #   @param public_id [String]
          #   @param status [String]
          #   @param subject [String]
          #   @param updated_at [Time]
        end
      end
    end
  end
end
