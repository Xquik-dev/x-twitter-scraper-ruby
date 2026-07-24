# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class Support
      # Support ticket management
      class Tickets
        # Create a support ticket
        sig do
          params(
            body: String,
            subject: String,
            idempotency_key: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Support::TicketCreateResponse)
        end
        def create(
          # Body param
          body:,
          # Body param
          subject:,
          # Header param: Generate one random value per ticket or reply. Reuse it only when
          # retrying identical text and attachments. Never log this value.
          idempotency_key: nil,
          request_options: {}
        )
        end

        # Get ticket with all messages
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Support::TicketRetrieveResponse)
        end
        def retrieve(
          # Support ticket public ID
          id,
          request_options: {}
        )
        end

        # Update ticket status
        sig do
          params(
            id: String,
            status:
              XTwitterScraper::Support::TicketUpdateParams::Status::OrSymbol,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Support::TicketUpdateResponse)
        end
        def update(
          # Support ticket public ID to update
          id,
          status:,
          request_options: {}
        )
        end

        # List user's support tickets
        sig do
          params(
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Support::TicketListResponse)
        end
        def list(request_options: {})
        end

        # Reply to a support ticket
        sig do
          params(
            id: String,
            body: String,
            idempotency_key: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Support::TicketReplyResponse)
        end
        def reply(
          # Path param: Support ticket public ID for the reply
          id,
          # Body param
          body:,
          # Header param: Generate one random value per ticket or reply. Reuse it only when
          # retrying identical text and attachments. Never log this value.
          idempotency_key: nil,
          request_options: {}
        )
        end

        # @api private
        sig do
          params(client: XTwitterScraper::Client).returns(T.attached_class)
        end
        def self.new(client:)
        end
      end
    end
  end
end
