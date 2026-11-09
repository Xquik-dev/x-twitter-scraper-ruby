# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Support
      # @see XTwitterScraper::Resources::Support::Tickets#create
      class TicketCreateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute body
        #
        #   @return [String, nil]
        optional :body, String

        # @!attribute subject
        #
        #   @return [String]
        required :subject, String

        # @!attribute attachments
        #   1 to 4 support image or video uploads.
        #
        #   @return [Array<Pathname, StringIO, IO, String, XTwitterScraper::FilePart>, nil]
        optional :attachments, XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Internal::Type::FileInput]

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!method initialize(subject:, attachments: nil, body: nil, idempotency_key: nil, request_options: {})
        #   @param body [String]
        #   @param subject [String]
        #   @param attachments [Array<Pathname, StringIO, IO, String, XTwitterScraper::FilePart>] 1 to 4 support image or video uploads.
        #
        #   @param idempotency_key [String]
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
