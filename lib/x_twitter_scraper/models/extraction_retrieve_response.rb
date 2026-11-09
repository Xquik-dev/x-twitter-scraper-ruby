# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#retrieve
    class ExtractionRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

      # @!attribute job
      #   Extraction job metadata - shape varies by tool type (JSON)
      #
      #   @return [Hash{Symbol=>Object}]
      required :job, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

      # @!attribute poll_after_ms
      #
      #   @return [Integer]
      required :poll_after_ms, Integer, api_name: :pollAfterMs

      # @!attribute results
      #
      #   @return [Array<Hash{Symbol=>Object}>]
      required :results,
               XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]]

      # @!attribute wait_url
      #
      #   @return [String]
      required :wait_url, String, api_name: :waitUrl

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String, api_name: :nextCursor

      # @!method initialize(has_more:, job:, poll_after_ms:, results:, wait_url:, next_cursor: nil)
      #   @param has_more [Boolean]
      #
      #   @param job [Hash{Symbol=>Object}] Extraction job metadata - shape varies by tool type (JSON)
      #
      #   @param poll_after_ms [Integer]
      #
      #   @param results [Array<Hash{Symbol=>Object}>]
      #
      #   @param wait_url [String]
      #
      #   @param next_cursor [String]
    end
  end
end
