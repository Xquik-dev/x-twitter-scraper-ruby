# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#list
    class ExtractionListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute extractions
      #
      #   @return [Array<XTwitterScraper::Models::ExtractionJob>]
      required :extractions, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::ExtractionJob] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String, api_name: :nextCursor

      # @!method initialize(extractions:, has_more:, next_cursor: nil)
      #   @param extractions [Array<XTwitterScraper::Models::ExtractionJob>]
      #   @param has_more [Boolean]
      #   @param next_cursor [String]
    end
  end
end
