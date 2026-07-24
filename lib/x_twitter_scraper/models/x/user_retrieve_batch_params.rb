# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve_batch
      class UserRetrieveBatchParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute ids
        #   Comma-separated numeric user IDs (1-100 values). Duplicate IDs are ignored while
        #   preserving first-seen order.
        #
        #   @return [String]
        required :ids, String

        # @!method initialize(ids:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {XTwitterScraper::Models::X::UserRetrieveBatchParams} for more details.
        #
        #   @param ids [String] Comma-separated numeric user IDs (1-100 values). Duplicate IDs are ignored while
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
