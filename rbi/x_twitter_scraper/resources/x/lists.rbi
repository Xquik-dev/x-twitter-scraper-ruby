# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      # X List followers, members, and tweets
      class Lists
        # List followers of an X List
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_followers(
          # List ID
          id,
          # Pagination cursor for list followers
          cursor: nil,
          # Maximum user profiles requested from this page (20-200, default 200). The
          # response can contain fewer profiles because the source returned fewer or
          # remaining credits cover fewer results. Keep requesting next_cursor while
          # has_next_page is true. The deprecated limit and count aliases remain accepted.
          page_size: nil,
          request_options: {}
        )
        end

        # List members of an X List
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_members(
          # List ID for member lookup
          id,
          # Pagination cursor for list members
          cursor: nil,
          # Members per page (20-200, default 20)
          page_size: nil,
          request_options: {}
        )
        end

        # List tweets from an X List
        sig do
          params(
            id: String,
            cursor: String,
            include_replies: T::Boolean,
            page_size: Integer,
            since_time: String,
            until_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def retrieve_tweets(
          # List ID for tweet lookup
          id,
          # Pagination cursor for list tweets
          cursor: nil,
          # Include replies (default false)
          include_replies: nil,
          # Maximum items requested from this page (1-100, default 20). The response can
          # contain fewer items because the source returned fewer, filters removed items, or
          # remaining credits cover fewer results. Keep requesting next_cursor while
          # has_next_page is true, even when a page is empty. The deprecated limit and count
          # aliases remain accepted.
          page_size: nil,
          # Unix timestamp - filter after
          since_time: nil,
          # Unix timestamp - filter before
          until_time: nil,
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
