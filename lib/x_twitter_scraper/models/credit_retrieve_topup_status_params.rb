# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Credits#retrieve_topup_status
    class CreditRetrieveTopupStatusParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute session_id
      #   Top-up session ID to inspect.
      #
      #   @return [String]
      required :session_id, String

      # @!method initialize(session_id:, request_options: {})
      #   @param session_id [String] Top-up session ID to inspect.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
