# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::X#get_home_timeline
    class XGetHomeTimelineParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Pagination cursor for timeline
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute seen_tweet_ids
      #   Comma-separated tweet IDs to exclude from results. Empty entries are ignored.
      #
      #   @return [String, nil]
      optional :seen_tweet_ids, String

      # @!method initialize(cursor: nil, seen_tweet_ids: nil, request_options: {})
      #   @param cursor [String] Pagination cursor for timeline
      #
      #   @param seen_tweet_ids [String] Comma-separated tweet IDs to exclude from results. Empty entries are ignored.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
