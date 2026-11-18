# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#get_retweeter_ids
      class TweetGetRetweeterIdsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #   Tweet ID or URL-encoded tweet URL, such as x.com/nasa/status/20. Takes x.com &
        #   twitter.com links with or without https://, www., mobile., a query or a
        #   fragment, & /i/status or /i/web/status links. Anything else gets 400
        #   `invalid_tweet_id`.
        #
        #   @return [String]
        required :id, String

        # @!attribute cursor
        #   Pagination cursor for collection results. Also read as next_cursor, next_token,
        #   pagination_token or continuation_token.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute page_size
        #   Profiles to request from this page. A page holds up to 10,000, so a larger
        #   pageSize gets the largest page. Default 200. Source, filters or credits can
        #   return fewer. Follow next_cursor for more pages. Its aliases are limit, count,
        #   max_results, maxItems, max_items & per_page.
        #
        #   @return [Integer, nil]
        optional :page_size, Integer, api_name: :pageSize

        # @!method initialize(id:, cursor: nil, page_size: nil, request_options: {})
        #   @param id [String] Tweet ID or URL-encoded tweet URL, such as x.com/nasa/status/20. Takes x.com & twitter.com links with or without https://, www., mobile., a query or a fragment, & /i/status or /i/web/status links. Anything else gets 400 `invalid_tweet_id`.
        #
        #   @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        #   @param page_size [Integer] Profiles to request from this page. A page holds up to 10,000, so a larger pageSize gets the largest page. Default 200. Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
