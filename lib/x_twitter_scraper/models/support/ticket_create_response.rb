# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Support
      # @see XTwitterScraper::Resources::Support::Tickets#create
      class TicketCreateResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute attachments
        #
        #   @return [Array<XTwitterScraper::Models::Support::TicketCreateResponse::Attachment>]
        required :attachments,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Support::TicketCreateResponse::Attachment] }

        # @!attribute public_id
        #
        #   @return [String]
        required :public_id, String, api_name: :publicId

        # @!method initialize(attachments:, public_id:)
        #   @param attachments [Array<XTwitterScraper::Models::Support::TicketCreateResponse::Attachment>]
        #   @param public_id [String]

        class Attachment < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute public_id
          #
          #   @return [String]
          required :public_id, String, api_name: :publicId

          # @!attribute status
          #
          #   @return [Symbol, XTwitterScraper::Models::Support::TicketCreateResponse::Attachment::Status]
          required :status, enum: -> { XTwitterScraper::Models::Support::TicketCreateResponse::Attachment::Status }

          # @!method initialize(public_id:, status:)
          #   Attachment identifier and initial processing state.
          #
          #   @param public_id [String]
          #   @param status [Symbol, XTwitterScraper::Models::Support::TicketCreateResponse::Attachment::Status]

          # @see XTwitterScraper::Models::Support::TicketCreateResponse::Attachment#status
          module Status
            extend XTwitterScraper::Internal::Type::Enum

            PENDING = :pending
            READY = :ready
            FAILED = :failed

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
