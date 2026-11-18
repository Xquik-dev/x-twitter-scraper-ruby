# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class PaginatedJobs < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute jobs
      #
      #   @return [Array<XTwitterScraper::Models::Job>]
      required :jobs, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Job] }

      # @!attribute has_next_page
      #
      #   @return [Boolean]
      required :has_next_page, XTwitterScraper::Internal::Type::Boolean

      # @!attribute next_cursor
      #   Cursor for the next page. Send it unchanged. Each next page arrives fast.
      #
      #   @return [String]
      required :next_cursor, String

      # @!method initialize(jobs:, has_next_page:, next_cursor:)
      #   1 page of job listings. Follow next_cursor while the response reports more
      #   pages.
      #
      #   @param jobs [Array<XTwitterScraper::Models::Job>]
      #
      #   @param has_next_page [Boolean]
      #
      #   @param next_cursor [String] Cursor for the next page. Send it unchanged. Each next page arrives fast.
    end
  end
end
